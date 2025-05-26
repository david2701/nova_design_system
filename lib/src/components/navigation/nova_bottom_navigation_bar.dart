import 'package:flutter/material.dart';
import '../../tokens/colors.dart';
import '../../tokens/typography.dart';

/// A bottom navigation bar component for the Nova design system
class NovaBottomNavigationBar extends StatelessWidget {
  /// Creates a Nova bottom navigation bar
  const NovaBottomNavigationBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
    this.elevation = 8,
    this.backgroundColor,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.selectedIconTheme,
    this.unselectedIconTheme,
    this.selectedLabelStyle,
    this.unselectedLabelStyle,
    this.showSelectedLabels = true,
    this.showUnselectedLabels = true,
    this.type = BottomNavigationBarType.fixed,
    this.enableFeedback = true,
    this.variant = NovaBottomNavigationBarVariant.primary,
    this.size = NovaBottomNavigationBarSize.medium,
  });

  /// The items to display in the bottom navigation bar
  final List<BottomNavigationBarItem> items;

  /// The index of the selected item
  final int currentIndex;

  /// Called when an item is tapped
  final ValueChanged<int> onTap;

  /// The elevation of the bottom navigation bar
  final double elevation;

  /// The background color of the bottom navigation bar
  final Color? backgroundColor;

  /// The color of the selected item
  final Color? selectedItemColor;

  /// The color of the unselected items
  final Color? unselectedItemColor;

  /// The icon theme for the selected item
  final IconThemeData? selectedIconTheme;

  /// The icon theme for the unselected items
  final IconThemeData? unselectedIconTheme;

  /// The text style for the selected item label
  final TextStyle? selectedLabelStyle;

  /// The text style for the unselected item labels
  final TextStyle? unselectedLabelStyle;

  /// Whether to show the selected item label
  final bool showSelectedLabels;

  /// Whether to show the unselected item labels
  final bool showUnselectedLabels;

  /// The type of bottom navigation bar
  final BottomNavigationBarType type;

  /// Whether to enable haptic feedback
  final bool enableFeedback;

  /// The visual style variant of the bottom navigation bar
  final NovaBottomNavigationBarVariant variant;

  /// The size of the bottom navigation bar
  final NovaBottomNavigationBarSize size;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: items,
      currentIndex: currentIndex,
      onTap: onTap,
      elevation: elevation,
      backgroundColor: _getBackgroundColor(),
      selectedItemColor: _getSelectedItemColor(),
      unselectedItemColor: _getUnselectedItemColor(),
      selectedIconTheme: selectedIconTheme ?? _getSelectedIconTheme(),
      unselectedIconTheme: unselectedIconTheme ?? _getUnselectedIconTheme(),
      selectedLabelStyle: selectedLabelStyle ?? _getSelectedLabelStyle(),
      unselectedLabelStyle: unselectedLabelStyle ?? _getUnselectedLabelStyle(),
      showSelectedLabels: showSelectedLabels,
      showUnselectedLabels: showUnselectedLabels,
      type: type,
      enableFeedback: enableFeedback,
    );
  }

  Color _getBackgroundColor() {
    if (backgroundColor != null) return backgroundColor!;

    switch (variant) {
      case NovaBottomNavigationBarVariant.primary:
        return NovaColors.primary;
      case NovaBottomNavigationBarVariant.secondary:
        return NovaColors.secondary;
      case NovaBottomNavigationBarVariant.surface:
        return NovaColors.surface;
      case NovaBottomNavigationBarVariant.transparent:
        return Colors.transparent;
    }
  }

  Color _getSelectedItemColor() {
    if (selectedItemColor != null) return selectedItemColor!;

    switch (variant) {
      case NovaBottomNavigationBarVariant.primary:
      case NovaBottomNavigationBarVariant.secondary:
        return NovaColors.textInverse;
      case NovaBottomNavigationBarVariant.surface:
      case NovaBottomNavigationBarVariant.transparent:
        return NovaColors.primary;
    }
  }

  Color _getUnselectedItemColor() {
    if (unselectedItemColor != null) return unselectedItemColor!;

    switch (variant) {
      case NovaBottomNavigationBarVariant.primary:
      case NovaBottomNavigationBarVariant.secondary:
        return NovaColors.textInverse.withValues(alpha: 0.6);
      case NovaBottomNavigationBarVariant.surface:
      case NovaBottomNavigationBarVariant.transparent:
        return NovaColors.neutral500;
    }
  }

  IconThemeData _getSelectedIconTheme() {
    return IconThemeData(
      color: _getSelectedItemColor(),
      size: _getIconSize(),
    );
  }

  IconThemeData _getUnselectedIconTheme() {
    return IconThemeData(
      color: _getUnselectedItemColor(),
      size: _getIconSize(),
    );
  }

  TextStyle _getSelectedLabelStyle() {
    final baseStyle = size == NovaBottomNavigationBarSize.small
        ? NovaTypography.labelSmall
        : NovaTypography.labelMedium;

    return baseStyle.copyWith(
      color: _getSelectedItemColor(),
    );
  }

  TextStyle _getUnselectedLabelStyle() {
    final baseStyle = size == NovaBottomNavigationBarSize.small
        ? NovaTypography.labelSmall
        : NovaTypography.labelMedium;

    return baseStyle.copyWith(
      color: _getUnselectedItemColor(),
    );
  }

  double _getIconSize() {
    switch (size) {
      case NovaBottomNavigationBarSize.small:
        return 20;
      case NovaBottomNavigationBarSize.medium:
        return 24;
    }
  }
}

/// Visual style variants for the Nova bottom navigation bar
enum NovaBottomNavigationBarVariant {
  /// Primary bottom navigation bar style
  primary,

  /// Secondary bottom navigation bar style
  secondary,

  /// Surface bottom navigation bar style
  surface,

  /// Transparent bottom navigation bar style
  transparent,
}

/// Size variants for the Nova bottom navigation bar
enum NovaBottomNavigationBarSize {
  /// Small bottom navigation bar size
  small,

  /// Medium bottom navigation bar size
  medium,
} 