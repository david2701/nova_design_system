import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import '../../tokens/colors.dart';
import '../../tokens/radius.dart';
import '../../tokens/spacing.dart';
import '../../tokens/typography.dart';

/// A file picker component for the Nova design system
class NovaFilePicker extends StatelessWidget {
  /// Creates a Nova file picker
  const NovaFilePicker({
    super.key,
    required this.onChanged,
    this.variant = NovaFilePickerVariant.outlined,
    this.size = NovaFilePickerSize.medium,
    this.isDisabled = false,
    this.isLoading = false,
    this.hintText,
    this.labelText,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.allowedExtensions,
    this.maxFileSize,
    this.allowMultiple = false,
    this.type = FileType.any,
    this.withData = false,
    this.withReadStream = false,
    this.withIcon = true,
    this.withPreview = true,
    this.allowCompression = true,
    this.compressionQuality = 85,
    this.onFileLoading,
    this.onFilePicked,
    this.onFilePickedError,
  });

  /// Called when files are selected
  final ValueChanged<List<PlatformFile>>? onChanged;

  /// The visual style variant of the file picker
  final NovaFilePickerVariant variant;

  /// The size of the file picker
  final NovaFilePickerSize size;

  /// Whether the file picker is disabled
  final bool isDisabled;

  /// Whether the file picker is in a loading state
  final bool isLoading;

  /// Optional hint text to display when no files are selected
  final String? hintText;

  /// Optional label text to display above the file picker
  final String? labelText;

  /// Optional helper text to display below the file picker
  final String? helperText;

  /// Optional error text to display below the file picker
  final String? errorText;

  /// Optional icon to display before the file picker
  final IconData? prefixIcon;

  /// Optional icon to display after the file picker
  final IconData? suffixIcon;

  /// List of allowed file extensions
  final List<String>? allowedExtensions;

  /// Maximum file size in bytes
  final int? maxFileSize;

  /// Whether to allow multiple file selection
  final bool allowMultiple;

  /// The type of files to pick
  final FileType type;

  /// Whether to include file data
  final bool withData;

  /// Whether to include file read stream
  final bool withReadStream;

  /// Whether to include file icon
  final bool withIcon;

  /// Whether to include file preview
  final bool withPreview;

  /// Whether to allow file compression
  final bool allowCompression;

  /// Compression quality (0-100)
  final int compressionQuality;

  /// Called when file loading starts
  final Function(FilePickerStatus)? onFileLoading;

  /// Called when files are picked
  final Function(List<PlatformFile>)? onFilePicked;

  /// Called when file picking fails
  final Function(PlatformException)? onFilePickedError;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (labelText != null) ...[
          Text(
            labelText!,
            style: _getLabelStyle(),
          ),
          const SizedBox(height: NovaSpacing.xs),
        ],
        InkWell(
          onTap: isDisabled || isLoading ? null : () => _pickFiles(context),
          borderRadius: BorderRadius.circular(NovaRadius.md),
          child: Container(
            decoration: BoxDecoration(
              color: _getBackgroundColor(),
              borderRadius: BorderRadius.circular(NovaRadius.md),
              border: Border.all(
                color: _getBorderColor(),
                width: 1,
              ),
            ),
            padding: _getPadding(),
            child: Row(
              children: [
                if (prefixIcon != null) ...[
                  Icon(
                    prefixIcon,
                    size: _getIconSize(),
                    color: _getIconColor(),
                  ),
                  const SizedBox(width: NovaSpacing.sm),
                ],
                Expanded(
                  child: Text(
                    hintText ?? 'Seleccionar archivos',
                    style: _getHintStyle(),
                  ),
                ),
                if (isLoading)
                  SizedBox(
                    width: _getIconSize(),
                    height: _getIconSize(),
                    child: const CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(NovaColors.primary),
                    ),
                  )
                else if (suffixIcon != null)
                  Icon(
                    suffixIcon,
                    size: _getIconSize(),
                    color: _getIconColor(),
                  )
                else
                  Icon(
                    Icons.upload_file,
                    size: _getIconSize(),
                    color: _getIconColor(),
                  ),
              ],
            ),
          ),
        ),
        if (helperText != null || errorText != null) ...[
          const SizedBox(height: NovaSpacing.xs),
          Text(
            errorText ?? helperText!,
            style: _getHelperStyle(errorText != null),
          ),
        ],
      ],
    );
  }

  Future<void> _pickFiles(BuildContext context) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: type,
        allowMultiple: allowMultiple,
        allowedExtensions: allowedExtensions,
        withData: withData,
        withReadStream: withReadStream,
        compressionQuality: compressionQuality,
        onFileLoading: onFileLoading,
      );

      if (result != null) {
        if (maxFileSize != null) {
          final validFiles = result.files.where((file) {
            return file.size <= maxFileSize!;
          }).toList();

          if (validFiles.isNotEmpty) {
            onChanged?.call(validFiles);
            onFilePicked?.call(validFiles);
          } else {
            onFilePickedError?.call(
              PlatformException(
                code: 'FILE_TOO_LARGE',
                message: 'Los archivos seleccionados exceden el tamaño máximo permitido',
              ),
            );
          }
        } else {
          onChanged?.call(result.files);
          onFilePicked?.call(result.files);
        }
      }
    } on PlatformException catch (e) {
      onFilePickedError?.call(e);
    }
  }

  Color _getBackgroundColor() {
    if (isDisabled) {
      return NovaColors.neutral100;
    }
    switch (variant) {
      case NovaFilePickerVariant.outlined:
        return NovaColors.background;
      case NovaFilePickerVariant.filled:
        return NovaColors.neutral100;
    }
  }

  Color _getBorderColor() {
    if (isDisabled) {
      return NovaColors.neutral300;
    }
    if (errorText != null) {
      return NovaColors.error;
    }
    return NovaColors.neutral400;
  }

  Color _getIconColor() {
    if (isDisabled) {
      return NovaColors.neutral400;
    }
    return NovaColors.neutral600;
  }

  TextStyle _getLabelStyle() {
    final baseStyle = size == NovaFilePickerSize.small
        ? NovaTypography.labelSmall
        : NovaTypography.labelMedium;

    return baseStyle.copyWith(
      color: isDisabled ? NovaColors.neutral400 : NovaColors.textPrimary,
    );
  }

  TextStyle _getHintStyle() {
    final baseStyle = size == NovaFilePickerSize.small
        ? NovaTypography.bodySmall
        : NovaTypography.bodyMedium;

    return baseStyle.copyWith(
      color: NovaColors.neutral500,
    );
  }

  TextStyle _getHelperStyle(bool isError) {
    final baseStyle = size == NovaFilePickerSize.small
        ? NovaTypography.labelSmall
        : NovaTypography.labelMedium;

    return baseStyle.copyWith(
      color: isError ? NovaColors.error : NovaColors.neutral500,
    );
  }

  EdgeInsets _getPadding() {
    final horizontal = size == NovaFilePickerSize.small
        ? NovaSpacing.sm
        : NovaSpacing.md;
    final vertical = size == NovaFilePickerSize.small
        ? NovaSpacing.xs
        : NovaSpacing.sm;

    return EdgeInsets.symmetric(
      horizontal: horizontal,
      vertical: vertical,
    );
  }

  double _getIconSize() {
    switch (size) {
      case NovaFilePickerSize.small:
        return 16;
      case NovaFilePickerSize.medium:
        return 20;
    }
  }
}

/// Visual style variants for the Nova file picker
enum NovaFilePickerVariant {
  /// Outlined file picker style
  outlined,

  /// Filled file picker style
  filled,
}

/// Size variants for the Nova file picker
enum NovaFilePickerSize {
  /// Small file picker size
  small,

  /// Medium file picker size
  medium,
} 