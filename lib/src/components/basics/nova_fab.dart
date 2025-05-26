import 'package:flutter/material.dart';
import '../../tokens/colors.dart';
import '../../tokens/radius.dart';
import '../../tokens/shadows.dart';
import 'nova_button.dart';

/// A floating action button component for the Nova design system
class NovaFab extends StatelessWidget {
  /// Creates a Nova floating action button
  const NovaFab({
    super.key,
    required this.onPressed,
    required this.icon,
    this.variant = NovaFabVariant.primary,
    this.size = NovaFabSize.medium,
    this.isLoading = false,
    this.isDisabled = false,
    this.tooltip,
  });

  /// The callback that is called when the button is pressed
  final VoidCallback? onPressed;

  /// The icon to display in the button
  final Widget icon;

  /// The visual style variant of the button
  final NovaFabVariant variant;

  /// The size of the button
  final NovaFabSize size;

  /// Whether the button is in a loading state
  final bool isLoading;

  /// Whether the button is disabled
  final bool isDisabled;

  /// Optional tooltip to display when hovering over the button
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    final button = Container(
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius: BorderRadius.circular(NovaRadius.full),
        boxShadow: NovaShadows.md,
      ),
      child: NovaButton(
        onPressed: onPressed,
        variant: _getButtonVariant(),
        size: _getButtonSize(),
        isLoading: isLoading,
        isDisabled: isDisabled,
        child: _buildContent(),
      ),
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
            variant == NovaFabVariant.primary
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

  Color _getBackgroundColor() {
    final isEnabled = onPressed != null && !isDisabled && !isLoading;
    if (!isEnabled) return NovaColors.neutral300;

    switch (variant) {
      case NovaFabVariant.primary:
        return NovaColors.primary;
      case NovaFabVariant.secondary:
        return NovaColors.secondary;
      case NovaFabVariant.accent:
        return NovaColors.accent;
    }
  }

  NovaButtonVariant _getButtonVariant() {
    switch (variant) {
      case NovaFabVariant.primary:
        return NovaButtonVariant.primary;
      case NovaFabVariant.secondary:
        return NovaButtonVariant.secondary;
      case NovaFabVariant.accent:
        return NovaButtonVariant.primary;
    }
  }

  NovaButtonSize _getButtonSize() {
    switch (size) {
      case NovaFabSize.small:
        return NovaButtonSize.small;
      case NovaFabSize.medium:
        return NovaButtonSize.medium;
      case NovaFabSize.large:
        return NovaButtonSize.large;
    }
  }

  double _getIconSize() {
    switch (size) {
      case NovaFabSize.small:
        return 16;
      case NovaFabSize.medium:
        return 20;
      case NovaFabSize.large:
        return 24;
    }
  }
}

/// Visual style variants for the Nova floating action button
enum NovaFabVariant {
  /// Primary floating action button style
  primary,

  /// Secondary floating action button style
  secondary,

  /// Accent floating action button style
  accent,
}

/// Size variants for the Nova floating action button
enum NovaFabSize {
  /// Small floating action button size
  small,

  /// Medium floating action button size
  medium,

  /// Large floating action button size
  large,
} 