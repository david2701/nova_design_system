import 'package:flutter/material.dart';
import '../../tokens/colors.dart';
import '../../tokens/typography.dart';
import 'nova_button.dart';

/// An elevated button component for the Nova design system
class NovaElevatedButton extends StatelessWidget {
  /// Creates a Nova elevated button
  const NovaElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.variant = NovaElevatedButtonVariant.primary,
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
  final NovaElevatedButtonVariant variant;

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
      case NovaElevatedButtonVariant.primary:
        return NovaButtonVariant.primary;
      case NovaElevatedButtonVariant.secondary:
        return NovaButtonVariant.secondary;
      case NovaElevatedButtonVariant.success:
        return NovaButtonVariant.primary;
      case NovaElevatedButtonVariant.danger:
        return NovaButtonVariant.primary;
    }
  }

  TextStyle _getTextStyle() {
    final baseStyle = size == NovaButtonSize.small
        ? NovaTypography.labelMedium
        : NovaTypography.labelLarge;

    return baseStyle.copyWith(
      color: NovaColors.textInverse,
    );
  }
}

/// Visual style variants for the Nova elevated button
enum NovaElevatedButtonVariant {
  /// Primary elevated button style
  primary,

  /// Secondary elevated button style
  secondary,

  /// Success elevated button style
  success,

  /// Danger elevated button style
  danger,
} 