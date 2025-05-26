import 'dart:io';
import 'dart:typed_data';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as img;

class NovaImageCompressor {
  /// Comprime una imagen desde un archivo
  static Future<File?> compressImage({
    required File file,
    int maxWidth = 1024,
    int maxHeight = 1024,
    int quality = 85,
  }) async {
    try {
      final bytes = await file.readAsBytes();
      final compressedBytes = await compute(
        _compressImageBytes,
        _CompressImageParams(
          bytes: bytes,
          maxWidth: maxWidth,
          maxHeight: maxHeight,
          quality: quality,
        ),
      );

      if (compressedBytes == null) return null;

      final tempDir = await getTemporaryDirectory();
      final tempFile = File('${tempDir.path}/compressed_${DateTime.now().millisecondsSinceEpoch}.jpg');
      await tempFile.writeAsBytes(compressedBytes);

      return tempFile;
    } catch (e) {
      debugPrint('Error comprimiendo imagen: $e');
      return null;
    }
  }

  /// Comprime una imagen desde bytes
  static Future<Uint8List?> compressImageFromBytes({
    required Uint8List bytes,
    int maxWidth = 1024,
    int maxHeight = 1024,
    int quality = 85,
  }) async {
    try {
      return await compute(
        _compressImageBytes,
        _CompressImageParams(
          bytes: bytes,
          maxWidth: maxWidth,
          maxHeight: maxHeight,
          quality: quality,
        ),
      );
    } catch (e) {
      debugPrint('Error comprimiendo imagen desde bytes: $e');
      return null;
    }
  }

  /// Comprime una imagen desde una URL
  static Future<File?> compressImageFromUrl({
    required String url,
    int maxWidth = 1024,
    int maxHeight = 1024,
    int quality = 85,
  }) async {
    try {
      final response = await HttpClient().getUrl(Uri.parse(url));
      final httpResponse = await response.close();
      final bytes = await httpResponse.fold<BytesBuilder>(
        BytesBuilder(),
        (builder, chunk) => builder..add(chunk),
      );
      final compressedBytes = await compute(
        _compressImageBytes,
        _CompressImageParams(
          bytes: bytes.takeBytes(),
          maxWidth: maxWidth,
          maxHeight: maxHeight,
          quality: quality,
        ),
      );

      if (compressedBytes == null) return null;

      final tempDir = await getTemporaryDirectory();
      final tempFile = File('${tempDir.path}/compressed_${DateTime.now().millisecondsSinceEpoch}.jpg');
      await tempFile.writeAsBytes(compressedBytes);

      return tempFile;
    } catch (e) {
      debugPrint('Error comprimiendo imagen desde URL: $e');
      return null;
    }
  }
}

class _CompressImageParams {
  final Uint8List bytes;
  final int maxWidth;
  final int maxHeight;
  final int quality;

  _CompressImageParams({
    required this.bytes,
    required this.maxWidth,
    required this.maxHeight,
    required this.quality,
  });
}

Uint8List? _compressImageBytes(_CompressImageParams params) {
  try {
    final image = img.decodeImage(params.bytes);
    if (image == null) return null;

    var width = image.width;
    var height = image.height;

    if (width > params.maxWidth || height > params.maxHeight) {
      if (width / height > params.maxWidth / params.maxHeight) {
        width = params.maxWidth;
        height = (image.height * params.maxWidth / image.width).round();
      } else {
        height = params.maxHeight;
        width = (image.width * params.maxHeight / image.height).round();
      }
    }

    final resized = img.copyResize(
      image,
      width: width,
      height: height,
      interpolation: img.Interpolation.linear,
    );

    return Uint8List.fromList(
      img.encodeJpg(resized, quality: params.quality),
    );
  } catch (e) {
    debugPrint('Error en _compressImageBytes: $e');
    return null;
  }
} 