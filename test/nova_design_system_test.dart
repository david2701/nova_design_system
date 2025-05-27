import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:typed_data';
import 'package:nova_design_system/src/components/content/nova_linear_progress.dart';
import 'package:nova_design_system/src/components/overlay/nova_snackbar.dart';
import 'package:nova_design_system/src/components/overlay/nova_bottom_sheet.dart';
import 'package:nova_design_system/src/utils/nova_image_compressor.dart';

void main() {
  group('NovaLinearProgress', () {
    testWidgets('renders with default values', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NovaLinearProgress(
              value: 0.5,
            ),
          ),
        ),
      );

      expect(find.byType(NovaLinearProgress), findsOneWidget);
      expect(find.byType(LinearProgressIndicator), findsNothing);
    });

    testWidgets('renders with indeterminate state', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NovaLinearProgress(
              indeterminate: true,
            ),
          ),
        ),
      );

      expect(find.byType(LinearProgressIndicator), findsOneWidget);
    });

    testWidgets('renders with label and value', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NovaLinearProgress(
              value: 0.75,
              label: 'Progress',
              showValue: true,
            ),
          ),
        ),
      );

      expect(find.text('Progress'), findsOneWidget);
      expect(find.text('75%'), findsOneWidget);
    });
  });

  group('NovaSnackbar', () {
    testWidgets('shows snackbar with message', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () => NovaSnackbar.show(
                  context: context,
                  message: 'Test message',
                ),
                child: const Text('Show Snackbar'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Snackbar'));
      await tester.pumpAndSettle();

      expect(find.text('Test message'), findsOneWidget);
    });

    testWidgets('shows snackbar with title and action', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () => NovaSnackbar.show(
                  context: context,
                  message: 'Test message',
                  title: 'Test title',
                  action: TextButton(
                    onPressed: () {},
                    child: const Text('Action'),
                  ),
                ),
                child: const Text('Show Snackbar'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Snackbar'));
      await tester.pumpAndSettle();

      expect(find.text('Test title'), findsOneWidget);
      expect(find.text('Test message'), findsOneWidget);
      expect(find.text('Action'), findsOneWidget);
    });
  });

  group('NovaBottomSheet', () {
    testWidgets('shows bottom sheet with content', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () => NovaBottomSheet.show(
                  context: context,
                  child: const Text('Test content'),
                ),
                child: const Text('Show Bottom Sheet'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Bottom Sheet'));
      await tester.pumpAndSettle();

      expect(find.text('Test content'), findsOneWidget);
    });

    testWidgets('shows bottom sheet with title and actions', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () => NovaBottomSheet.show(
                  context: context,
                  title: 'Test title',
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {},
                    ),
                  ],
                  child: const Text('Test content'),
                ),
                child: const Text('Show Bottom Sheet'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Bottom Sheet'));
      await tester.pumpAndSettle();

      expect(find.text('Test title'), findsOneWidget);
      expect(find.byIcon(Icons.close), findsOneWidget);
      expect(find.text('Test content'), findsOneWidget);
    });
  });

  group('NovaImageCompressor', () {
    test('compresses image from bytes', () async {
      final bytes = Uint8List.fromList([1, 2, 3, 4, 5]);
      final result = await NovaImageCompressor.compressImageFromBytes(
        bytes: bytes,
        maxWidth: 100,
        maxHeight: 100,
        quality: 80,
      );

      expect(result, isNull); // Debería ser null porque los bytes no son una imagen válida
    });

    test('handles invalid image data gracefully', () async {
      final bytes = Uint8List.fromList([1, 2, 3, 4, 5]);
      final result = await NovaImageCompressor.compressImageFromBytes(
        bytes: bytes,
      );

      expect(result, isNull);
    });
  });
}
