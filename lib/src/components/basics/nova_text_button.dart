import 'package:flutter/material.dart';
import '../../tokens/colors.dart';
import '../../tokens/typography.dart';
import 'nova_button.dart';

/// A text button component for the Nova design system
class NovaTextButton extends StatelessWidget {
  /// Creates a Nova text button
  const NovaTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.variant = NovaTextButtonVariant.primary,
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
  final NovaTextButtonVariant variant;

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
      variant: _getButtonVariant(),
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

  NovaButtonVariant _getButtonVariant() {
    switch (variant) {
      case NovaTextButtonVariant.primary:
        return NovaButtonVariant.ghost;
      case NovaTextButtonVariant.secondary:
        return NovaButtonVariant.ghost;
      case NovaTextButtonVariant.danger:
        return NovaButtonVariant.ghost;
    }
  }

  TextStyle _getTextStyle() {
    final isEnabled = onPressed != null && !isDisabled && !isLoading;
    final baseStyle = size == NovaButtonSize.small
        ? NovaTypography.labelMedium
        : NovaTypography.labelLarge;

    Color textColor;
    switch (variant) {
      case NovaTextButtonVariant.primary:
        textColor = isEnabled ? NovaColors.primary : NovaColors.neutral400;
        break;
      case NovaTextButtonVariant.secondary:
        textColor = isEnabled ? NovaColors.secondary : NovaColors.neutral400;
        break;
      case NovaTextButtonVariant.danger:
        textColor = isEnabled ? NovaColors.error : NovaColors.neutral400;
        break;
    }

    return baseStyle.copyWith(
      color: textColor,
    );
  }
}

/// Visual style variants for the Nova text button
enum NovaTextButtonVariant {
  /// Primary text button style
  primary,

  /// Secondary text button style
  secondary,

  /// Danger text button style
  danger,
} 