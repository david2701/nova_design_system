import 'package:flutter/material.dart';
import '../../tokens/spacing.dart';

/// A gap component for the Nova design system
class NovaGap extends StatelessWidget {
  /// Creates a Nova gap
  const NovaGap({
    super.key,
    this.size = NovaGapSize.md,
    this.direction = NovaGapDirection.vertical,
  });

  /// The size of the gap
  final NovaGapSize size;

  /// The direction of the gap
  final NovaGapDirection direction;

  @override
  Widget build(BuildContext context) {
    final gapSize = _getGapSize();

    return direction == NovaGapDirection.vertical
        ? SizedBox(height: gapSize)
        : SizedBox(width: gapSize);
  }

  double _getGapSize() {
    switch (size) {
      case NovaGapSize.xs:
        return NovaSpacing.xs;
      case NovaGapSize.sm:
        return NovaSpacing.sm;
      case NovaGapSize.md:
        return NovaSpacing.md;
      case NovaGapSize.lg:
        return NovaSpacing.lg;
      case NovaGapSize.xl:
        return NovaSpacing.xl;
    }
  }
}

/// Size variants for the Nova gap
enum NovaGapSize {
  /// Extra small gap size
  xs,

  /// Small gap size
  sm,

  /// Medium gap size
  md,

  /// Large gap size
  lg,

  /// Extra large gap size
  xl,
}

/// Direction variants for the Nova gap
enum NovaGapDirection {
  /// Vertical gap direction
  vertical,

  /// Horizontal gap direction
  horizontal,
} 