import 'package:flutter/material.dart';
import '../../tokens/colors.dart';
import '../../tokens/typography.dart';
import 'nova_button.dart';

/// An outlined button component for the Nova design system
class NovaOutlinedButton extends StatelessWidget {
  /// Creates a Nova outlined button
  const NovaOutlinedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.variant = NovaOutlinedButtonVariant.primary,
    this.size = NovaButtonSize.medium,
    this.isLoading = false,
    this.isDisabled = false,
    this.leftIcon,
    this.rightIcon,
    this.fullWidth = false,
  });

  /// The callback that is called when the button is pressed
  final VoidCallback? onPressed;

  /// The text to display in the button
  final String text;

  /// The visual style variant of the button
  final NovaOutlinedButtonVariant variant;

  /// The size of the button
  final NovaButtonSize size;

  /// Whether the button is in a loading state
  final bool isLoading;

  /// Whether the button is disabled
  final bool isDisabled;

  /// Optional icon to display on the left side of the button
  final Widget? leftIcon;

  /// Optional icon to display on the right side of the button
  final Widget? rightIcon;

  /// Whether the button should take up the full width of its parent
  final bool fullWidth;

  @override
  Widget build(BuildContext context) {
    return NovaButton(
      onPressed: onPressed,
      variant: NovaButtonVariant.outline,
      size: size,
      isLoading: isLoading,
      isDisabled: isDisabled,
      leftIcon: leftIcon,
      rightIcon: rightIcon,
      fullWidth: fullWidth,
      child: Text(
        text,
        style: _getTextStyle(),
      ),
    );
  }

  TextStyle _getTextStyle() {
    final isEnabled = onPressed != null && !isDisabled && !isLoading;
    final baseStyle = size == NovaButtonSize.small
        ? NovaTypography.labelMedium
        : NovaTypography.labelLarge;

    Color textColor;
    switch (variant) {
      case NovaOutlinedButtonVariant.primary:
        textColor = isEnabled ? NovaColors.primary : NovaColors.neutral400;
        break;
      case NovaOutlinedButtonVariant.secondary:
        textColor = isEnabled ? NovaColors.secondary : NovaColors.neutral400;
        break;
      case NovaOutlinedButtonVariant.danger:
        textColor = isEnabled ? NovaColors.error : NovaColors.neutral400;
        break;
    }

    return baseStyle.copyWith(
      color: textColor,
    );
  }
}

/// Visual style variants for the Nova outlined button
enum NovaOutlinedButtonVariant {
  /// Primary outlined button style
  primary,

  /// Secondary outlined button style
  secondary,

  /// Danger outlined button style
  danger,
} 