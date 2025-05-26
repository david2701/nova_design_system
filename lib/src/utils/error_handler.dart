import 'package:flutter/material.dart';

class ErrorHandler {
  static void handleFlutterError(FlutterErrorDetails details) {
    // Aquí puedes loguear, mostrar un dialog, etc.
    debugPrint('Flutter Error: \n');
    debugPrint(details.exceptionAsString());
    debugPrintStack(label: 'Stack trace:', stackTrace: details.stack);
  }

  static void setup() {
    FlutterError.onError = handleFlutterError;
  }
} 