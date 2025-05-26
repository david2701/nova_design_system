import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'nova_tab_bar.dart';

/// A tab view component for the Nova design system
class NovaTabView extends StatelessWidget {
  /// Creates a Nova tab view
  const NovaTabView({
    super.key,
    required this.tabs,
    required this.children,
    this.controller,
    this.physics,
    this.dragStartBehavior = DragStartBehavior.start,
    this.onPageChanged,
    this.variant = NovaTabViewVariant.primary,
    this.size = NovaTabViewSize.medium,
  });

  /// The tabs to display in the tab view
  final List<Widget> tabs;

  /// The children to display in the tab view
  final List<Widget> children;

  /// The tab controller
  final TabController? controller;

  /// The physics of the tab view
  final ScrollPhysics? physics;

  /// The drag start behavior of the tab view
  final DragStartBehavior dragStartBehavior;

  /// Called when the page changes
  final ValueChanged<int>? onPageChanged;

  /// The visual style variant of the tab view
  final NovaTabViewVariant variant;

  /// The size of the tab view
  final NovaTabViewSize size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NovaTabBar(
          tabs: tabs,
          controller: controller,
          variant: _getTabBarVariant(),
          size: _getTabBarSize(),
        ),
        Expanded(
          child: TabBarView(
            controller: controller,
            physics: physics,
            dragStartBehavior: dragStartBehavior,
            children: children,
          ),
        ),
      ],
    );
  }

  NovaTabBarVariant _getTabBarVariant() {
    switch (variant) {
      case NovaTabViewVariant.primary:
        return NovaTabBarVariant.primary;
      case NovaTabViewVariant.secondary:
        return NovaTabBarVariant.secondary;
      case NovaTabViewVariant.surface:
        return NovaTabBarVariant.surface;
      case NovaTabViewVariant.transparent:
        return NovaTabBarVariant.transparent;
    }
  }

  NovaTabBarSize _getTabBarSize() {
    switch (size) {
      case NovaTabViewSize.small:
        return NovaTabBarSize.small;
      case NovaTabViewSize.medium:
        return NovaTabBarSize.medium;
    }
  }
}

/// Visual style variants for the Nova tab view
enum NovaTabViewVariant {
  /// Primary tab view style
  primary,

  /// Secondary tab view style
  secondary,

  /// Surface tab view style
  surface,

  /// Transparent tab view style
  transparent,
}

/// Size variants for the Nova tab view
enum NovaTabViewSize {
  /// Small tab view size
  small,

  /// Medium tab view size
  medium,
} 