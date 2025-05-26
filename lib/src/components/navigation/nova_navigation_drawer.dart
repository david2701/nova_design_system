import 'package:flutter/material.dart';
import '../../tokens/colors.dart';
import '../../tokens/spacing.dart';
import '../../tokens/typography.dart';

/// A navigation drawer component for the Nova design system
class NovaNavigationDrawer extends StatelessWidget {
  /// Creates a Nova navigation drawer
  const NovaNavigationDrawer({
    super.key,
    required this.children,
    this.elevation = 16,
    this.backgroundColor,
    this.surfaceTintColor,
    this.shadowColor,
    this.width = 304,
    this.padding = const EdgeInsets.symmetric(vertical: NovaSpacing.md),
    this.child,
    this.variant = NovaNavigationDrawerVariant.primary,
    this.size = NovaNavigationDrawerSize.medium,
  });

  /// The list of widgets to display in the navigation drawer
  final List<Widget> children;

  /// The elevation of the navigation drawer
  final double elevation;

  /// The background color of the navigation drawer
  final Color? backgroundColor;

  /// The surface tint color of the navigation drawer
  final Color? surfaceTintColor;

  /// The shadow color of the navigation drawer
  final Color? shadowColor;

  /// The width of the navigation drawer
  final double width;

  /// The padding of the navigation drawer
  final EdgeInsetsGeometry padding;

  /// A widget to display at the top of the navigation drawer
  final Widget? child;

  /// The visual style variant of the navigation drawer
  final NovaNavigationDrawerVariant variant;

  /// The size of the navigation drawer
  final NovaNavigationDrawerSize size;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      children: [
        if (child != null) child!,
        ...children,
      ],
      elevation: elevation,
      backgroundColor: _getBackgroundColor(),
      surfaceTintColor: surfaceTintColor,
      shadowColor: shadowColor,
      indicatorColor: _getIndicatorColor(),
      indicatorShape: _getIndicatorShape(),
    );
  }

  Color _getBackgroundColor() {
    if (backgroundColor != null) return backgroundColor!;

    switch (variant) {
      case NovaNavigationDrawerVariant.primary:
        return NovaColors.primary;
      case NovaNavigationDrawerVariant.secondary:
        return NovaColors.secondary;
      case NovaNavigationDrawerVariant.surface:
        return NovaColors.surface;
      case NovaNavigationDrawerVariant.transparent:
        return Colors.transparent;
    }
  }

  Color _getIndicatorColor() {
    switch (variant) {
      case NovaNavigationDrawerVariant.primary:
      case NovaNavigationDrawerVariant.secondary:
        return NovaColors.textInverse.withOpacity(0.1);
      case NovaNavigationDrawerVariant.surface:
      case NovaNavigationDrawerVariant.transparent:
        return NovaColors.primary.withOpacity(0.1);
    }
  }

  ShapeBorder _getIndicatorShape() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        size == NovaNavigationDrawerSize.small ? 8 : 12,
      ),
    );
  }
}

/// A navigation drawer destination for the Nova design system
class NovaNavigationDrawerDestination extends StatelessWidget {
  /// Creates a Nova navigation drawer destination
  const NovaNavigationDrawerDestination({
    super.key,
    required this.icon,
    required this.label,
    this.selectedIcon,
    this.padding = const EdgeInsets.symmetric(
      horizontal: NovaSpacing.md,
      vertical: NovaSpacing.sm,
    ),
    this.variant = NovaNavigationDrawerVariant.primary,
    this.size = NovaNavigationDrawerSize.medium,
  });

  /// The icon to display
  final Widget icon;

  /// The label to display
  final String label;

  /// The icon to display when selected
  final Widget? selectedIcon;

  /// The padding of the destination
  final EdgeInsetsGeometry padding;

  /// The visual style variant of the destination
  final NovaNavigationDrawerVariant variant;

  /// The size of the destination
  final NovaNavigationDrawerSize size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: NavigationDrawerDestination(
        icon: icon,
        label: Text(
          label,
          style: _getLabelStyle(),
        ),
        selectedIcon: selectedIcon,
      ),
    );
  }

  TextStyle _getLabelStyle() {
    final baseStyle = size == NovaNavigationDrawerSize.small
        ? NovaTypography.labelSmall
        : NovaTypography.labelMedium;

    return baseStyle.copyWith(
      color: _getTextColor(),
    );
  }

  Color _getTextColor() {
    switch (variant) {
      case NovaNavigationDrawerVariant.primary:
      case NovaNavigationDrawerVariant.secondary:
        return NovaColors.textInverse;
      case NovaNavigationDrawerVariant.surface:
      case NovaNavigationDrawerVariant.transparent:
        return NovaColors.textPrimary;
    }
  }
}

/// Visual style variants for the Nova navigation drawer
enum NovaNavigationDrawerVariant {
  /// Primary navigation drawer style
  primary,

  /// Secondary navigation drawer style
  secondary,

  /// Surface navigation drawer style
  surface,

  /// Transparent navigation drawer style
  transparent,
}

/// Size variants for the Nova navigation drawer
enum NovaNavigationDrawerSize {
  /// Small navigation drawer size
  small,

  /// Medium navigation drawer size
  medium,
} 