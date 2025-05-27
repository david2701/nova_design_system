import 'package:flutter/material.dart';
import '../../tokens/colors.dart';
import '../../tokens/radius.dart';
import '../../tokens/spacing.dart';
import '../../tokens/typography.dart';

/// A tooltip component for the Nova design system
class NovaTooltip extends StatelessWidget {
  /// Creates a Nova tooltip
  const NovaTooltip({
    super.key,
    required this.message,
    required this.child,
    this.variant = NovaTooltipVariant.neutral,
    this.position = NovaTooltipPosition.bottom,
    this.showArrow = true,
    this.padding,
    this.margin,
  });

  /// The message to display in the tooltip
  final String message;

  /// The widget that triggers the tooltip
  final Widget child;

  /// The visual style variant of the tooltip
  final NovaTooltipVariant variant;

  /// The position of the tooltip relative to the child
  final NovaTooltipPosition position;

  /// Whether to show an arrow pointing to the child
  final bool showArrow;

  /// The padding inside the tooltip
  final EdgeInsets? padding;

  /// The margin around the tooltip
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      preferBelow: position == NovaTooltipPosition.bottom,
      verticalOffset: _getVerticalOffset(),
      padding: padding ?? _getPadding(),
      margin: margin ?? _getMargin(),
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius: BorderRadius.circular(NovaRadius.md),
        boxShadow: [
          BoxShadow(
            color: NovaColors.neutral900.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      textStyle: _getTextStyle(),
      child: child,
    );
  }

  Color _getBackgroundColor() {
    switch (variant) {
      case NovaTooltipVariant.primary:
        return NovaColors.primary;
      case NovaTooltipVariant.secondary:
        return NovaColors.secondary;
      case NovaTooltipVariant.neutral:
        return NovaColors.neutral800;
    }
  }

  TextStyle _getTextStyle() {
    return NovaTypography.labelSmall.copyWith(
      color: NovaColors.textInverse,
    );
  }

  EdgeInsets _getPadding() {
    return const EdgeInsets.symmetric(
      horizontal: NovaSpacing.md,
      vertical: NovaSpacing.sm,
    );
  }

  EdgeInsets _getMargin() {
    return const EdgeInsets.symmetric(
      horizontal: NovaSpacing.sm,
      vertical: NovaSpacing.xs,
    );
  }

  double _getVerticalOffset() {
    if (!showArrow) return 0;

    switch (position) {
      case NovaTooltipPosition.top:
        return -8;
      case NovaTooltipPosition.bottom:
        return 8;
    }
  }
}

/// Visual style variants for the Nova tooltip
enum NovaTooltipVariant {
  /// Primary tooltip style
  primary,

  /// Secondary tooltip style
  secondary,

  /// Neutral tooltip style
  neutral,
}

/// Position variants for the Nova tooltip
enum NovaTooltipPosition {
  /// Tooltip appears above the child
  top,

  /// Tooltip appears below the child
  bottom,
} 