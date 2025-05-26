import 'package:flutter/material.dart';
import '../../tokens/colors.dart';
import '../../tokens/typography.dart';

/// A navigation rail component for the Nova design system
class NovaNavigationRail extends StatelessWidget {
  /// Creates a Nova navigation rail
  const NovaNavigationRail({
    super.key,
    required this.destinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
    this.useIndicator = true,
    this.indicatorColor,
    this.backgroundColor,
    this.elevation = 0,
    this.groupAlignment = -0.85,
    this.labelType = NavigationRailLabelType.all,
    this.minWidth = 72,
    this.minExtendedWidth = 256,
    this.leading,
    this.trailing,
    this.extended = false,
    this.variant = NovaNavigationRailVariant.primary,
    this.size = NovaNavigationRailSize.medium,
  });

  /// The list of destinations to display in the navigation rail
  final List<NavigationRailDestination> destinations;

  /// The index of the selected destination
  final int selectedIndex;

  /// Called when a destination is selected
  final ValueChanged<int> onDestinationSelected;

  /// Whether to show the selection indicator
  final bool useIndicator;

  /// The color of the selection indicator
  final Color? indicatorColor;

  /// The background color of the navigation rail
  final Color? backgroundColor;

  /// The elevation of the navigation rail
  final double elevation;

  /// The alignment of the navigation rail group
  final double groupAlignment;

  /// The type of labels to display
  final NavigationRailLabelType labelType;

  /// The minimum width of the navigation rail
  final double minWidth;

  /// The minimum width of the extended navigation rail
  final double minExtendedWidth;

  /// A widget to display at the top of the navigation rail
  final Widget? leading;

  /// A widget to display at the bottom of the navigation rail
  final Widget? trailing;

  /// Whether the navigation rail is extended
  final bool extended;

  /// The visual style variant of the navigation rail
  final NovaNavigationRailVariant variant;

  /// The size of the navigation rail
  final NovaNavigationRailSize size;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      destinations: destinations,
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      useIndicator: useIndicator,
      indicatorColor: _getIndicatorColor(),
      backgroundColor: _getBackgroundColor(),
      elevation: elevation,
      groupAlignment: groupAlignment,
      labelType: labelType,
      minWidth: minWidth,
      minExtendedWidth: minExtendedWidth,
      leading: leading,
      trailing: trailing,
      extended: extended,
      selectedIconTheme: _getSelectedIconTheme(),
      unselectedIconTheme: _getUnselectedIconTheme(),
      selectedLabelTextStyle: _getSelectedLabelStyle(),
      unselectedLabelTextStyle: _getUnselectedLabelStyle(),
    );
  }

  Color _getBackgroundColor() {
    if (backgroundColor != null) return backgroundColor!;

    switch (variant) {
      case NovaNavigationRailVariant.primary:
        return NovaColors.primary;
      case NovaNavigationRailVariant.secondary:
        return NovaColors.secondary;
      case NovaNavigationRailVariant.surface:
        return NovaColors.surface;
      case NovaNavigationRailVariant.transparent:
        return Colors.transparent;
    }
  }

  Color _getIndicatorColor() {
    if (indicatorColor != null) return indicatorColor!;

    switch (variant) {
      case NovaNavigationRailVariant.primary:
      case NovaNavigationRailVariant.secondary:
        return NovaColors.textInverse.withValues(alpha: 0.1);
      case NovaNavigationRailVariant.surface:
      case NovaNavigationRailVariant.transparent:
        return NovaColors.primary.withValues(alpha: 0.1);
    }
  }

  IconThemeData _getSelectedIconTheme() {
    return IconThemeData(
      color: _getSelectedColor(),
      size: _getIconSize(),
    );
  }

  IconThemeData _getUnselectedIconTheme() {
    return IconThemeData(
      color: _getUnselectedColor(),
      size: _getIconSize(),
    );
  }

  TextStyle _getSelectedLabelStyle() {
    final baseStyle = size == NovaNavigationRailSize.small
        ? NovaTypography.labelSmall
        : NovaTypography.labelMedium;

    return baseStyle.copyWith(
      color: _getSelectedColor(),
    );
  }

  TextStyle _getUnselectedLabelStyle() {
    final baseStyle = size == NovaNavigationRailSize.small
        ? NovaTypography.labelSmall
        : NovaTypography.labelMedium;

    return baseStyle.copyWith(
      color: _getUnselectedColor(),
    );
  }

  Color _getSelectedColor() {
    switch (variant) {
      case NovaNavigationRailVariant.primary:
      case NovaNavigationRailVariant.secondary:
        return NovaColors.textInverse;
      case NovaNavigationRailVariant.surface:
      case NovaNavigationRailVariant.transparent:
        return NovaColors.primary;
    }
  }

  Color _getUnselectedColor() {
    switch (variant) {
      case NovaNavigationRailVariant.primary:
      case NovaNavigationRailVariant.secondary:
        return NovaColors.textInverse.withValues(alpha: 0.6);
      case NovaNavigationRailVariant.surface:
      case NovaNavigationRailVariant.transparent:
        return NovaColors.neutral500;
    }
  }

  double _getIconSize() {
    switch (size) {
      case NovaNavigationRailSize.small:
        return 20;
      case NovaNavigationRailSize.medium:
        return 24;
    }
  }
}

/// Visual style variants for the Nova navigation rail
enum NovaNavigationRailVariant {
  /// Primary navigation rail style
  primary,

  /// Secondary navigation rail style
  secondary,

  /// Surface navigation rail style
  surface,

  /// Transparent navigation rail style
  transparent,
}

/// Size variants for the Nova navigation rail
enum NovaNavigationRailSize {
  /// Small navigation rail size
  small,

  /// Medium navigation rail size
  medium,
} 