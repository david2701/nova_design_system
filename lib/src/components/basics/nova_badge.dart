import 'package:flutter/material.dart';
import '../../tokens/colors.dart';
import '../../tokens/radius.dart';
import '../../tokens/spacing.dart';
import '../../tokens/typography.dart';

/// A badge component for the Nova design system
class NovaBadge extends StatelessWidget {
  /// Creates a Nova badge
  const NovaBadge({
    super.key,
    this.label,
    this.variant = NovaBadgeVariant.primary,
    this.size = NovaBadgeSize.medium,
    this.dot = false,
    this.maxCount,
    this.count,
  });

  /// The text to display in the badge
  final String? label;

  /// The visual style variant of the badge
  final NovaBadgeVariant variant;

  /// The size of the badge
  final NovaBadgeSize size;

  /// Whether to show a dot instead of text
  final bool dot;

  /// The maximum count to display
  final int? maxCount;

  /// The count to display
  final int? count;

  @override
  Widget build(BuildContext context) {
    if (dot) {
      return Container(
        width: _getDotSize(),
        height: _getDotSize(),
        decoration: BoxDecoration(
          color: _getColor(),
          shape: BoxShape.circle,
        ),
      );
    }

    if (count != null) {
      final displayCount = maxCount != null && count! > maxCount!
          ? '$maxCount+'
          : count.toString();

      return Container(
        padding: _getPadding(),
        decoration: BoxDecoration(
          color: _getColor(),
          borderRadius: BorderRadius.circular(NovaRadius.full),
        ),
        child: Text(
          displayCount,
          style: _getTextStyle(),
        ),
      );
    }

    if (label != null) {
      return Container(
        padding: _getPadding(),
        decoration: BoxDecoration(
          color: _getColor(),
          borderRadius: BorderRadius.circular(NovaRadius.full),
        ),
        child: Text(
          label!,
          style: _getTextStyle(),
        ),
      );
    }

    return const SizedBox.shrink();
  }

  Color _getColor() {
    switch (variant) {
      case NovaBadgeVariant.primary:
        return NovaColors.primary;
      case NovaBadgeVariant.secondary:
        return NovaColors.secondary;
      case NovaBadgeVariant.success:
        return NovaColors.success;
      case NovaBadgeVariant.warning:
        return NovaColors.warning;
      case NovaBadgeVariant.danger:
        return NovaColors.error;
      case NovaBadgeVariant.neutral:
        return NovaColors.neutral700;
    }
  }

  TextStyle _getTextStyle() {
    final baseStyle = size == NovaBadgeSize.small
        ? NovaTypography.labelSmall
        : NovaTypography.labelMedium;

    return baseStyle.copyWith(
      color: NovaColors.textInverse,
    );
  }

  EdgeInsets _getPadding() {
    switch (size) {
      case NovaBadgeSize.small:
        return EdgeInsets.symmetric(
          horizontal: NovaSpacing.xs,
          vertical: 2,
        );
      case NovaBadgeSize.medium:
        return EdgeInsets.symmetric(
          horizontal: NovaSpacing.sm,
          vertical: 4,
        );
    }
  }

  double _getDotSize() {
    switch (size) {
      case NovaBadgeSize.small:
        return 6;
      case NovaBadgeSize.medium:
        return 8;
    }
  }
}

/// Visual style variants for the Nova badge
enum NovaBadgeVariant {
  /// Primary badge style
  primary,

  /// Secondary badge style
  secondary,

  /// Success badge style
  success,

  /// Warning badge style
  warning,

  /// Danger badge style
  danger,

  /// Neutral badge style
  neutral,
}

/// Size variants for the Nova badge
enum NovaBadgeSize {
  /// Small badge size
  small,

  /// Medium badge size
  medium,
} 