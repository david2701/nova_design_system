import 'package:flutter/material.dart';
import '../../tokens/colors.dart';
import 'nova_button.dart';

/// An icon button component for the Nova design system
class NovaIconButton extends StatelessWidget {
  /// Creates a Nova icon button
  const NovaIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.variant = NovaIconButtonVariant.primary,
    this.size = NovaIconButtonSize.medium,
    this.isLoading = false,
    this.isDisabled = false,
    this.tooltip,
  });

  /// The callback that is called when the button is pressed
  final VoidCallback? onPressed;

  /// The icon to display in the button
  final Widget icon;

  /// The visual style variant of the button
  final NovaIconButtonVariant variant;

  /// The size of the button
  final NovaIconButtonSize size;

  /// Whether the button is in a loading state
  final bool isLoading;

  /// Whether the button is disabled
  final bool isDisabled;

  /// Optional tooltip to display when hovering over the button
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    final button = NovaButton(
      onPressed: onPressed,
      variant: _getButtonVariant(),
      size: _getButtonSize(),
      isLoading: isLoading,
      isDisabled: isDisabled,
      child: _buildContent(),
    );

    if (tooltip != null) {
      return Tooltip(
        message: tooltip!,
        child: button,
      );
    }

    return button;
  }

  Widget _buildContent() {
    if (isLoading) {
      return SizedBox(
        height: _getIconSize(),
        width: _getIconSize(),
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            variant == NovaIconButtonVariant.primary
                ? NovaColors.textInverse
                : NovaColors.primary,
          ),
        ),
      );
    }

    return SizedBox(
      height: _getIconSize(),
      width: _getIconSize(),
      child: icon,
    );
  }

  NovaButtonVariant _getButtonVariant() {
    switch (variant) {
      case NovaIconButtonVariant.primary:
        return NovaButtonVariant.primary;
      case NovaIconButtonVariant.secondary:
        return NovaButtonVariant.secondary;
      case NovaIconButtonVariant.ghost:
        return NovaButtonVariant.ghost;
    }
  }

  NovaButtonSize _getButtonSize() {
    switch (size) {
      case NovaIconButtonSize.small:
        return NovaButtonSize.small;
      case NovaIconButtonSize.medium:
        return NovaButtonSize.medium;
      case NovaIconButtonSize.large:
        return NovaButtonSize.large;
    }
  }

  double _getIconSize() {
    switch (size) {
      case NovaIconButtonSize.small:
        return 16;
      case NovaIconButtonSize.medium:
        return 20;
      case NovaIconButtonSize.large:
        return 24;
    }
  }
}

/// Visual style variants for the Nova icon button
enum NovaIconButtonVariant {
  /// Primary icon button style
  primary,

  /// Secondary icon button style
  secondary,

  /// Ghost icon button style
  ghost,
}

/// Size variants for the Nova icon button
enum NovaIconButtonSize {
  /// Small icon button size
  small,

  /// Medium icon button size
  medium,

  /// Large icon button size
  large,
} 