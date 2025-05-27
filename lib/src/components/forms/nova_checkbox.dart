import 'package:flutter/material.dart';
import '../../tokens/colors.dart';
import '../../tokens/radius.dart';
import '../../tokens/spacing.dart';
import '../../tokens/typography.dart';

/// A checkbox component for the Nova design system
class NovaCheckbox extends StatelessWidget {
  /// Creates a Nova checkbox
  const NovaCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.variant = NovaCheckboxVariant.primary,
    this.size = NovaCheckboxSize.medium,
    this.isDisabled = false,
    this.label,
    this.helperText,
    this.errorText,
  });

  /// Whether the checkbox is checked
  final bool value;

  /// Called when the checkbox value changes
  final ValueChanged<bool?>? onChanged;

  /// The visual style variant of the checkbox
  final NovaCheckboxVariant variant;

  /// The size of the checkbox
  final NovaCheckboxSize size;

  /// Whether the checkbox is disabled
  final bool isDisabled;

  /// Optional label to display next to the checkbox
  final String? label;

  /// Optional helper text to display below the checkbox
  final String? helperText;

  /// Optional error text to display below the checkbox
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: _getSize(),
              height: _getSize(),
              child: Checkbox(
                value: value,
                onChanged: isDisabled ? null : onChanged,
                activeColor: _getActiveColor(),
                checkColor: NovaColors.textInverse,
                fillColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.disabled)) {
                    return NovaColors.neutral300;
                  }
                  if (states.contains(WidgetState.selected)) {
                    return _getActiveColor();
                  }
                  return NovaColors.neutral400;
                }),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(NovaRadius.sm),
                ),
                side: BorderSide(
                  color: isDisabled ? NovaColors.neutral300 : NovaColors.neutral400,
                  width: 1,
                ),
              ),
            ),
            if (label != null) ...[
              const SizedBox(width: NovaSpacing.sm),
              Text(
                label!,
                style: _getLabelStyle(),
              ),
            ],
          ],
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

  Color _getActiveColor() {
    switch (variant) {
      case NovaCheckboxVariant.primary:
        return NovaColors.primary;
      case NovaCheckboxVariant.success:
        return NovaColors.success;
      case NovaCheckboxVariant.warning:
        return NovaColors.warning;
      case NovaCheckboxVariant.danger:
        return NovaColors.error;
    }
  }

  TextStyle _getLabelStyle() {
    final baseStyle = size == NovaCheckboxSize.small
        ? NovaTypography.labelSmall
        : NovaTypography.labelMedium;

    return baseStyle.copyWith(
      color: isDisabled ? NovaColors.neutral400 : NovaColors.textPrimary,
    );
  }

  TextStyle _getHelperStyle(bool isError) {
    final baseStyle = size == NovaCheckboxSize.small
        ? NovaTypography.labelSmall
        : NovaTypography.labelMedium;

    return baseStyle.copyWith(
      color: isError ? NovaColors.error : NovaColors.neutral500,
    );
  }

  double _getSize() {
    switch (size) {
      case NovaCheckboxSize.small:
        return 16;
      case NovaCheckboxSize.medium:
        return 20;
    }
  }
}

/// Visual style variants for the Nova checkbox
enum NovaCheckboxVariant {
  /// Primary checkbox style
  primary,

  /// Success checkbox style
  success,

  /// Warning checkbox style
  warning,

  /// Danger checkbox style
  danger,
}

/// Size variants for the Nova checkbox
enum NovaCheckboxSize {
  /// Small checkbox size
  small,

  /// Medium checkbox size
  medium,
} 