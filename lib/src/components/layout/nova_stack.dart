import 'package:flutter/material.dart';

/// A stack component for the Nova design system
class NovaStack extends StatelessWidget {
  /// Creates a Nova stack
  const NovaStack({
    super.key,
    required this.children,
    this.alignment = Alignment.topLeft,
    this.fit = StackFit.loose,
    this.clipBehavior = Clip.hardEdge,
    this.variant = NovaStackVariant.standard,
  });

  /// The children widgets
  final List<Widget> children;

  /// The alignment of children
  final AlignmentGeometry alignment;

  /// How to size the non-positioned children
  final StackFit fit;

  /// The clip behavior of the stack
  final Clip clipBehavior;

  /// The visual style variant of the stack
  final NovaStackVariant variant;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: alignment,
      fit: fit,
      clipBehavior: clipBehavior,
      children: children,
    );
  }
}

/// Visual style variants for the Nova stack
enum NovaStackVariant {
  /// Standard stack layout
  standard,

  /// Centered stack layout
  centered,

  /// Expanded stack layout
  expanded,
} 