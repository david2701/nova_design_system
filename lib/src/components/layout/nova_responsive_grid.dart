import 'package:flutter/material.dart';
import '../../tokens/spacing.dart';

/// A responsive grid component for the Nova design system
class NovaResponsiveGrid extends StatelessWidget {
  /// Creates a Nova responsive grid
  const NovaResponsiveGrid({
    super.key,
    required this.children,
    this.crossAxisCount = 2,
    this.mainAxisSpacing = NovaSpacing.md,
    this.crossAxisSpacing = NovaSpacing.md,
    this.childAspectRatio = 1.0,
    this.mainAxisExtent,
    this.padding,
    this.variant = NovaResponsiveGridVariant.standard,
  });

  /// The children widgets
  final List<Widget> children;

  /// The number of columns in the grid
  final int crossAxisCount;

  /// The spacing between rows
  final double mainAxisSpacing;

  /// The spacing between columns
  final double crossAxisSpacing;

  /// The aspect ratio of each child
  final double childAspectRatio;

  /// The maximum extent of each child in the main axis
  final double? mainAxisExtent;

  /// The padding around the grid
  final EdgeInsetsGeometry? padding;

  /// The visual style variant of the grid
  final NovaResponsiveGridVariant variant;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final columns = _getColumnCount(width);

        return GridView.builder(
          padding: padding,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            mainAxisSpacing: mainAxisSpacing,
            crossAxisSpacing: crossAxisSpacing,
            childAspectRatio: childAspectRatio,
            mainAxisExtent: mainAxisExtent,
          ),
          itemCount: children.length,
          itemBuilder: (context, index) => children[index],
        );
      },
    );
  }

  int _getColumnCount(double width) {
    switch (variant) {
      case NovaResponsiveGridVariant.standard:
        if (width < 600) return 1;
        if (width < 900) return 2;
        if (width < 1200) return 3;
        return 4;
      case NovaResponsiveGridVariant.dense:
        if (width < 600) return 2;
        if (width < 900) return 3;
        if (width < 1200) return 4;
        return 6;
      case NovaResponsiveGridVariant.sparse:
        if (width < 900) return 1;
        if (width < 1200) return 2;
        return 3;
    }
  }
}

/// Visual style variants for the Nova responsive grid
enum NovaResponsiveGridVariant {
  /// Standard grid layout
  standard,

  /// Dense grid layout with more columns
  dense,

  /// Sparse grid layout with fewer columns
  sparse,
} 