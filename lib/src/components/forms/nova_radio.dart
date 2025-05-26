import 'package:flutter/material.dart';
import '../../tokens/colors.dart';
import '../../tokens/spacing.dart';
import '../../tokens/typography.dart';

/// A radio button component for the Nova design system
class NovaRadio<T> extends StatelessWidget {
  /// Creates a Nova radio button
  const NovaRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.variant = NovaRadioVariant.primary,
    this.size = NovaRadioSize.medium,
    this.isDisabled = false,
    this.label,
    this.helperText,
    this.errorText,
  });

  /// The value represented by this radio button
  final T value;

  /// The currently selected value for this group of radio buttons
  final T? groupValue;

  /// Called when the radio button value changes
  final ValueChanged<T?>? onChanged;

  /// The visual style variant of the radio button
  final NovaRadioVariant variant;

  /// The size of the radio button
  final NovaRadioSize size;

  /// Whether the radio button is disabled
  final bool isDisabled;

  /// Optional label to display next to the radio button
  final String? label;

  /// Optional helper text to display below the radio button
  final String? helperText;

  /// Optional error text to display below the radio button
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
              child: Radio<T>(
                value: value,
                groupValue: groupValue,
                onChanged: isDisabled ? null : onChanged,
                activeColor: _getActiveColor(),
                fillColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.disabled)) {
                    return NovaColors.neutral300;
                  }
                  if (states.contains(MaterialState.selected)) {
                    return _getActiveColor();
                  }
                  return NovaColors.neutral400;
                }),
              ),
            ),
            if (label != null) ...[
              SizedBox(width: NovaSpacing.sm),
              Text(
                label!,
                style: _getLabelStyle(),
              ),
            ],
          ],
        ),
        if (helperText != null || errorText != null) ...[
          SizedBox(height: NovaSpacing.xs),
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
      case NovaRadioVariant.primary:
        return NovaColors.primary;
      case NovaRadioVariant.success:
        return NovaColors.success;
      case NovaRadioVariant.warning:
        return NovaColors.warning;
      case NovaRadioVariant.danger:
        return NovaColors.error;
    }
  }

  TextStyle _getLabelStyle() {
    final baseStyle = size == NovaRadioSize.small
        ? NovaTypography.labelSmall
        : NovaTypography.labelMedium;

    return baseStyle.copyWith(
      color: isDisabled ? NovaColors.neutral400 : NovaColors.textPrimary,
    );
  }

  TextStyle _getHelperStyle(bool isError) {
    final baseStyle = size == NovaRadioSize.small
        ? NovaTypography.labelSmall
        : NovaTypography.labelMedium;

    return baseStyle.copyWith(
      color: isError ? NovaColors.error : NovaColors.neutral500,
    );
  }

  double _getSize() {
    switch (size) {
      case NovaRadioSize.small:
        return 16;
      case NovaRadioSize.medium:
        return 20;
    }
  }
}

/// Visual style variants for the Nova radio button
enum NovaRadioVariant {
  /// Primary radio button style
  primary,

  /// Success radio button style
  success,

  /// Warning radio button style
  warning,

  /// Danger radio button style
  danger,
}

/// Size variants for the Nova radio button
enum NovaRadioSize {
  /// Small radio button size
  small,

  /// Medium radio button size
  medium,
} 