import 'package:flutter/material.dart';
import '../../tokens/colors.dart';
import '../../tokens/radius.dart';
import '../../tokens/spacing.dart';

/// Base button component for the Nova design system
class NovaButton extends StatelessWidget {
  /// Creates a Nova button
  const NovaButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.variant = NovaButtonVariant.primary,
    this.size = NovaButtonSize.medium,
    this.isLoading = false,
    this.isDisabled = false,
    this.leftIcon,
    this.rightIcon,
    this.fullWidth = false,
  });

  /// The callback that is called when the button is pressed
  final VoidCallback? onPressed;

  /// The widget that is displayed inside the button
  final Widget child;

  /// The visual style variant of the button
  final NovaButtonVariant variant;

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
    final isEnabled = onPressed != null && !isDisabled && !isLoading;

    return SizedBox(
      width: fullWidth ? double.infinity : null,
      child: _buildButton(isEnabled),
    );
  }

  Widget _buildButton(bool isEnabled) {
    final buttonStyle = _getButtonStyle(isEnabled);
    final buttonHeight = _getButtonHeight();
    final buttonPadding = _getButtonPadding();

    return Container(
      height: buttonHeight,
      padding: buttonPadding,
      decoration: BoxDecoration(
        color: buttonStyle.backgroundColor,
        borderRadius: BorderRadius.circular(NovaRadius.md),
        border: buttonStyle.border,
      ),
      child: InkWell(
        onTap: isEnabled ? onPressed : null,
        borderRadius: BorderRadius.circular(NovaRadius.md),
        child: Center(
          child: _buildContent(),
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (isLoading) {
      return SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            variant == NovaButtonVariant.primary
                ? NovaColors.textInverse
                : NovaColors.primary,
          ),
        ),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (leftIcon != null) ...[
          leftIcon!,
          SizedBox(width: NovaSpacing.xs),
        ],
        child,
        if (rightIcon != null) ...[
          SizedBox(width: NovaSpacing.xs),
          rightIcon!,
        ],
      ],
    );
  }

  _ButtonStyle _getButtonStyle(bool isEnabled) {
    switch (variant) {
      case NovaButtonVariant.primary:
        return _ButtonStyle(
          backgroundColor: isEnabled ? NovaColors.primary : NovaColors.neutral300,
          border: null,
        );
      case NovaButtonVariant.secondary:
        return _ButtonStyle(
          backgroundColor: isEnabled ? NovaColors.secondary : NovaColors.neutral300,
          border: null,
        );
      case NovaButtonVariant.outline:
        return _ButtonStyle(
          backgroundColor: Colors.transparent,
          border: Border.all(
            color: isEnabled ? NovaColors.primary : NovaColors.neutral300,
            width: 1,
          ),
        );
      case NovaButtonVariant.ghost:
        return _ButtonStyle(
          backgroundColor: Colors.transparent,
          border: null,
        );
    }
  }

  double _getButtonHeight() {
    switch (size) {
      case NovaButtonSize.small:
        return 32;
      case NovaButtonSize.medium:
        return 40;
      case NovaButtonSize.large:
        return 48;
    }
  }

  EdgeInsets _getButtonPadding() {
    switch (size) {
      case NovaButtonSize.small:
        return EdgeInsets.symmetric(
          horizontal: NovaSpacing.sm,
          vertical: NovaSpacing.xs,
        );
      case NovaButtonSize.medium:
        return EdgeInsets.symmetric(
          horizontal: NovaSpacing.md,
          vertical: NovaSpacing.sm,
        );
      case NovaButtonSize.large:
        return EdgeInsets.symmetric(
          horizontal: NovaSpacing.lg,
          vertical: NovaSpacing.md,
        );
    }
  }
}

/// Visual style variants for the Nova button
enum NovaButtonVariant {
  /// Primary button style
  primary,

  /// Secondary button style
  secondary,

  /// Outline button style
  outline,

  /// Ghost button style
  ghost,
}

/// Size variants for the Nova button
enum NovaButtonSize {
  /// Small button size
  small,

  /// Medium button size
  medium,

  /// Large button size
  large,
}

/// Internal class for button styling
class _ButtonStyle {
  const _ButtonStyle({
    required this.backgroundColor,
    this.border,
  });

  final Color backgroundColor;
  final BoxBorder? border;
} 