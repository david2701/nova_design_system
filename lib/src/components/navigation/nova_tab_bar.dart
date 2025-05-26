import 'package:flutter/material.dart';
import '../../tokens/colors.dart';
import '../../tokens/typography.dart';

/// A tab bar component for the Nova design system
class NovaTabBar extends StatelessWidget implements PreferredSizeWidget {
  /// Creates a Nova tab bar
  const NovaTabBar({
    super.key,
    required this.tabs,
    this.controller,
    this.isScrollable = false,
    this.padding,
    this.indicatorColor,
    this.indicatorWeight = 2,
    this.indicatorPadding = EdgeInsets.zero,
    this.indicator,
    this.dividerColor,
    this.dividerHeight = 1,
    this.labelColor,
    this.unselectedLabelColor,
    this.labelStyle,
    this.unselectedLabelStyle,
    this.labelPadding,
    this.onTap,
    this.variant = NovaTabBarVariant.primary,
    this.size = NovaTabBarSize.medium,
  });

  /// The tabs to display in the tab bar
  final List<Widget> tabs;

  /// The tab controller
  final TabController? controller;

  /// Whether the tab bar should be scrollable
  final bool isScrollable;

  /// The padding of the tab bar
  final EdgeInsetsGeometry? padding;

  /// The color of the indicator
  final Color? indicatorColor;

  /// The weight of the indicator
  final double indicatorWeight;

  /// The padding of the indicator
  final EdgeInsetsGeometry indicatorPadding;

  /// The indicator widget
  final BoxDecoration? indicator;

  /// The color of the divider
  final Color? dividerColor;

  /// The height of the divider
  final double dividerHeight;

  /// The color of the selected tab label
  final Color? labelColor;

  /// The color of the unselected tab labels
  final Color? unselectedLabelColor;

  /// The text style of the selected tab label
  final TextStyle? labelStyle;

  /// The text style of the unselected tab labels
  final TextStyle? unselectedLabelStyle;

  /// The padding of the tab labels
  final EdgeInsetsGeometry? labelPadding;

  /// Called when a tab is tapped
  final ValueChanged<int>? onTap;

  /// The visual style variant of the tab bar
  final NovaTabBarVariant variant;

  /// The size of the tab bar
  final NovaTabBarSize size;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: tabs,
      controller: controller,
      isScrollable: isScrollable,
      padding: padding,
      indicatorColor: _getIndicatorColor(),
      indicatorWeight: indicatorWeight,
      indicatorPadding: indicatorPadding,
      indicator: indicator,
      dividerColor: _getDividerColor(),
      dividerHeight: dividerHeight,
      labelColor: _getLabelColor(),
      unselectedLabelColor: _getUnselectedLabelColor(),
      labelStyle: labelStyle ?? _getLabelStyle(),
      unselectedLabelStyle: unselectedLabelStyle ?? _getUnselectedLabelStyle(),
      labelPadding: labelPadding,
      onTap: onTap,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_getHeight());

  Color _getIndicatorColor() {
    if (indicatorColor != null) return indicatorColor!;

    switch (variant) {
      case NovaTabBarVariant.primary:
        return NovaColors.primary;
      case NovaTabBarVariant.secondary:
        return NovaColors.secondary;
      case NovaTabBarVariant.surface:
        return NovaColors.primary;
      case NovaTabBarVariant.transparent:
        return NovaColors.primary;
    }
  }

  Color _getDividerColor() {
    if (dividerColor != null) return dividerColor!;

    switch (variant) {
      case NovaTabBarVariant.primary:
      case NovaTabBarVariant.secondary:
        return NovaColors.textInverse.withOpacity(0.1);
      case NovaTabBarVariant.surface:
      case NovaTabBarVariant.transparent:
        return NovaColors.neutral200;
    }
  }

  Color _getLabelColor() {
    if (labelColor != null) return labelColor!;

    switch (variant) {
      case NovaTabBarVariant.primary:
      case NovaTabBarVariant.secondary:
        return NovaColors.textInverse;
      case NovaTabBarVariant.surface:
      case NovaTabBarVariant.transparent:
        return NovaColors.primary;
    }
  }

  Color _getUnselectedLabelColor() {
    if (unselectedLabelColor != null) return unselectedLabelColor!;

    switch (variant) {
      case NovaTabBarVariant.primary:
      case NovaTabBarVariant.secondary:
        return NovaColors.textInverse.withOpacity(0.6);
      case NovaTabBarVariant.surface:
      case NovaTabBarVariant.transparent:
        return NovaColors.neutral500;
    }
  }

  TextStyle _getLabelStyle() {
    final baseStyle = size == NovaTabBarSize.small
        ? NovaTypography.labelSmall
        : NovaTypography.labelMedium;

    return baseStyle.copyWith(
      color: _getLabelColor(),
    );
  }

  TextStyle _getUnselectedLabelStyle() {
    final baseStyle = size == NovaTabBarSize.small
        ? NovaTypography.labelSmall
        : NovaTypography.labelMedium;

    return baseStyle.copyWith(
      color: _getUnselectedLabelColor(),
    );
  }

  double _getHeight() {
    switch (size) {
      case NovaTabBarSize.small:
        return 40;
      case NovaTabBarSize.medium:
        return 48;
    }
  }
}

/// Visual style variants for the Nova tab bar
enum NovaTabBarVariant {
  /// Primary tab bar style
  primary,

  /// Secondary tab bar style
  secondary,

  /// Surface tab bar style
  surface,

  /// Transparent tab bar style
  transparent,
}

/// Size variants for the Nova tab bar
enum NovaTabBarSize {
  /// Small tab bar size
  small,

  /// Medium tab bar size
  medium,
} 