import 'package:flutter/material.dart';
import '../../tokens/spacing.dart';

/// A wrap component for the Nova design system
class NovaWrap extends StatelessWidget {
  /// Creates a Nova wrap
  const NovaWrap({
    super.key,
    required this.children,
    this.spacing = NovaSpacing.md,
    this.runSpacing = NovaSpacing.md,
    this.alignment = WrapAlignment.start,
    this.runAlignment = WrapAlignment.start,
    this.direction = Axis.horizontal,
    this.variant = NovaWrapVariant.standard,
  });

  /// The children widgets
  final List<Widget> children;

  /// The spacing between children
  final double spacing;

  /// The spacing between runs
  final double runSpacing;

  /// The alignment of children
  final WrapAlignment alignment;

  /// The alignment of runs
  final WrapAlignment runAlignment;

  /// The direction of the wrap
  final Axis direction;

  /// The visual style variant of the wrap
  final NovaWrapVariant variant;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: spacing,
      runSpacing: runSpacing,
      alignment: alignment,
      runAlignment: runAlignment,
      direction: direction,
      children: children,
    );
  }
}

/// Visual style variants for the Nova wrap
enum NovaWrapVariant {
  /// Standard wrap layout
  standard,

  /// Dense wrap layout with less spacing
  dense,

  /// Sparse wrap layout with more spacing
  sparse,
} 