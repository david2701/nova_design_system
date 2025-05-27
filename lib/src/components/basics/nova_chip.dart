import 'package:flutter/material.dart';
import '../../tokens/colors.dart';
import '../../tokens/radius.dart';
import '../../tokens/spacing.dart';
import '../../tokens/typography.dart';

/// A chip component for the Nova design system
class NovaChip extends StatelessWidget {
  /// Creates a Nova chip
  const NovaChip({
    super.key,
    required this.label,
    this.variant = NovaChipVariant.primary,
    this.size = NovaChipSize.medium,
    this.isSelected = false,
    this.isDisabled = false,
    this.onSelected,
    this.onDeleted,
    this.avatar,
    this.deleteIcon,
  });

  /// The text to display in the chip
  final String label;

  /// The visual style variant of the chip
  final NovaChipVariant variant;

  /// The size of the chip
  final NovaChipSize size;

  /// Whether the chip is selected
  final bool isSelected;

  /// Whether the chip is disabled
  final bool isDisabled;

  /// Called when the chip is selected or deselected
  final ValueChanged<bool>? onSelected;

  /// Called when the delete button is pressed
  final VoidCallback? onDeleted;

  /// Optional avatar to display at the start of the chip
  final Widget? avatar;

  /// Optional custom delete icon
  final Widget? deleteIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _getPadding(),
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius: BorderRadius.circular(NovaRadius.full),
        border: _getBorder(),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (avatar != null) ...[
            avatar!,
            const SizedBox(width: NovaSpacing.xs),
          ],
          Text(
            label,
            style: _getTextStyle(),
          ),
          if (onDeleted != null) ...[
            const SizedBox(width: NovaSpacing.xs),
            GestureDetector(
              onTap: isDisabled ? null : onDeleted,
              child: deleteIcon ??
                  Icon(
                    Icons.close,
                    size: _getIconSize(),
                    color: _getIconColor(),
                  ),
            ),
          ],
        ],
      ),
    );
  }

  Color _getBackgroundColor() {
    if (isDisabled) return NovaColors.neutral200;
    if (isSelected) return _getSelectedBackgroundColor();

    switch (variant) {
      case NovaChipVariant.primary:
        return NovaColors.primary.withValues(alpha: 0.1);
      case NovaChipVariant.secondary:
        return NovaColors.secondary.withValues(alpha: 0.1);
      case NovaChipVariant.success:
        return NovaColors.success.withValues(alpha: 0.1);
      case NovaChipVariant.warning:
        return NovaColors.warning.withValues(alpha: 0.1);
      case NovaChipVariant.danger:
        return NovaColors.error.withValues(alpha: 0.1);
      case NovaChipVariant.neutral:
        return NovaColors.neutral200;
    }
  }

  Color _getSelectedBackgroundColor() {
    switch (variant) {
      case NovaChipVariant.primary:
        return NovaColors.primary;
      case NovaChipVariant.secondary:
        return NovaColors.secondary;
      case NovaChipVariant.success:
        return NovaColors.success;
      case NovaChipVariant.warning:
        return NovaColors.warning;
      case NovaChipVariant.danger:
        return NovaColors.error;
      case NovaChipVariant.neutral:
        return NovaColors.neutral700;
    }
  }

  BoxBorder? _getBorder() {
    if (isSelected) return null;

    switch (variant) {
      case NovaChipVariant.primary:
        return Border.all(color: NovaColors.primary.withValues(alpha: 0.3));
      case NovaChipVariant.secondary:
        return Border.all(color: NovaColors.secondary.withValues(alpha: 0.3));
      case NovaChipVariant.success:
        return Border.all(color: NovaColors.success.withValues(alpha: 0.3));
      case NovaChipVariant.warning:
        return Border.all(color: NovaColors.warning.withValues(alpha: 0.3));
      case NovaChipVariant.danger:
        return Border.all(color: NovaColors.error.withValues(alpha: 0.3));
      case NovaChipVariant.neutral:
        return Border.all(color: NovaColors.neutral300);
    }
  }

  TextStyle _getTextStyle() {
    final baseStyle = size == NovaChipSize.small
        ? NovaTypography.labelSmall
        : NovaTypography.labelMedium;

    Color textColor;
    if (isDisabled) {
      textColor = NovaColors.neutral400;
    } else if (isSelected) {
      textColor = NovaColors.textInverse;
    } else {
      switch (variant) {
        case NovaChipVariant.primary:
          textColor = NovaColors.primary;
        case NovaChipVariant.secondary:
          textColor = NovaColors.secondary;
        case NovaChipVariant.success:
          textColor = NovaColors.success;
        case NovaChipVariant.warning:
          textColor = NovaColors.warning;
        case NovaChipVariant.danger:
          textColor = NovaColors.error;
        case NovaChipVariant.neutral:
          textColor = NovaColors.neutral700;
      }
    }

    return baseStyle.copyWith(color: textColor);
  }

  Color _getIconColor() {
    if (isDisabled) return NovaColors.neutral400;
    if (isSelected) return NovaColors.textInverse;

    switch (variant) {
      case NovaChipVariant.primary:
        return NovaColors.primary;
      case NovaChipVariant.secondary:
        return NovaColors.secondary;
      case NovaChipVariant.success:
        return NovaColors.success;
      case NovaChipVariant.warning:
        return NovaColors.warning;
      case NovaChipVariant.danger:
        return NovaColors.error;
      case NovaChipVariant.neutral:
        return NovaColors.neutral700;
    }
  }

  EdgeInsets _getPadding() {
    switch (size) {
      case NovaChipSize.small:
        return const EdgeInsets.symmetric(
          horizontal: NovaSpacing.sm,
          vertical: NovaSpacing.xs,
        );
      case NovaChipSize.medium:
        return const EdgeInsets.symmetric(
          horizontal: NovaSpacing.md,
          vertical: NovaSpacing.sm,
        );
    }
  }

  double _getIconSize() {
    switch (size) {
      case NovaChipSize.small:
        return 14;
      case NovaChipSize.medium:
        return 16;
    }
  }
}

/// Visual style variants for the Nova chip
enum NovaChipVariant {
  /// Primary chip style
  primary,

  /// Secondary chip style
  secondary,

  /// Success chip style
  success,

  /// Warning chip style
  warning,

  /// Danger chip style
  danger,

  /// Neutral chip style
  neutral,
}

/// Size variants for the Nova chip
enum NovaChipSize {
  /// Small chip size
  small,

  /// Medium chip size
  medium,
} 