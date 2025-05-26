import 'package:flutter/material.dart';
import '../../tokens/colors.dart';
import '../../tokens/spacing.dart';
import '../../tokens/typography.dart';

/// An app bar component for the Nova design system
class NovaAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Creates a Nova app bar
  const NovaAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.bottom,
    this.elevation = 0,
    this.backgroundColor,
    this.foregroundColor,
    this.centerTitle = true,
    this.automaticallyImplyLeading = true,
    this.scrolledUnderElevation = 0,
    this.shadowColor,
    this.surfaceTintColor,
    this.shape,
    this.toolbarHeight = kToolbarHeight,
    this.primary = true,
    this.excludeHeaderSemantics = false,
    this.titleSpacing,
    this.toolbarOpacity = 1.0,
    this.bottomOpacity = 1.0,
    this.variant = NovaAppBarVariant.primary,
    this.size = NovaAppBarSize.medium,
  });

  /// The primary widget displayed in the app bar
  final Widget? title;

  /// A widget to display before the title
  final Widget? leading;

  /// A list of widgets to display after the title
  final List<Widget>? actions;

  /// A widget to display below the app bar
  final PreferredSizeWidget? bottom;

  /// The elevation of the app bar
  final double elevation;

  /// The background color of the app bar
  final Color? backgroundColor;

  /// The foreground color of the app bar
  final Color? foregroundColor;

  /// Whether the title should be centered
  final bool centerTitle;

  /// Whether to automatically add a back button
  final bool automaticallyImplyLeading;

  /// The elevation when the app bar is scrolled under
  final double scrolledUnderElevation;

  /// The color of the shadow
  final Color? shadowColor;

  /// The color of the surface tint
  final Color? surfaceTintColor;

  /// The shape of the app bar
  final ShapeBorder? shape;

  /// The height of the toolbar
  final double toolbarHeight;

  /// Whether this is the primary app bar
  final bool primary;

  /// Whether to exclude header semantics
  final bool excludeHeaderSemantics;

  /// The spacing around the title
  final double? titleSpacing;

  /// The opacity of the toolbar
  final double toolbarOpacity;

  /// The opacity of the bottom widget
  final double bottomOpacity;

  /// The visual style variant of the app bar
  final NovaAppBarVariant variant;

  /// The size of the app bar
  final NovaAppBarSize size;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title != null
          ? Text(
              (title as Text).data!,
              style: _getTitleStyle(),
            )
          : null,
      leading: leading,
      actions: actions,
      bottom: bottom,
      elevation: elevation,
      backgroundColor: _getBackgroundColor(),
      foregroundColor: _getForegroundColor(),
      centerTitle: centerTitle,
      automaticallyImplyLeading: automaticallyImplyLeading,
      scrolledUnderElevation: scrolledUnderElevation,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
      shape: shape,
      toolbarHeight: _getToolbarHeight(),
      primary: primary,
      excludeHeaderSemantics: excludeHeaderSemantics,
      titleSpacing: titleSpacing,
      toolbarOpacity: toolbarOpacity,
      bottomOpacity: bottomOpacity,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_getToolbarHeight());

  TextStyle _getTitleStyle() {
    final baseStyle = size == NovaAppBarSize.small
        ? NovaTypography.titleSmall
        : NovaTypography.titleMedium;

    return baseStyle.copyWith(
      color: _getForegroundColor(),
    );
  }

  Color _getBackgroundColor() {
    if (backgroundColor != null) return backgroundColor!;

    switch (variant) {
      case NovaAppBarVariant.primary:
        return NovaColors.primary;
      case NovaAppBarVariant.secondary:
        return NovaColors.secondary;
      case NovaAppBarVariant.surface:
        return NovaColors.surface;
      case NovaAppBarVariant.transparent:
        return Colors.transparent;
    }
  }

  Color _getForegroundColor() {
    if (foregroundColor != null) return foregroundColor!;

    switch (variant) {
      case NovaAppBarVariant.primary:
      case NovaAppBarVariant.secondary:
        return NovaColors.textInverse;
      case NovaAppBarVariant.surface:
      case NovaAppBarVariant.transparent:
        return NovaColors.textPrimary;
    }
  }

  double _getToolbarHeight() {
    switch (size) {
      case NovaAppBarSize.small:
        return kToolbarHeight - NovaSpacing.sm;
      case NovaAppBarSize.medium:
        return kToolbarHeight;
    }
  }
}

/// Visual style variants for the Nova app bar
enum NovaAppBarVariant {
  /// Primary app bar style
  primary,

  /// Secondary app bar style
  secondary,

  /// Surface app bar style
  surface,

  /// Transparent app bar style
  transparent,
}

/// Size variants for the Nova app bar
enum NovaAppBarSize {
  /// Small app bar size
  small,

  /// Medium app bar size
  medium,
} 