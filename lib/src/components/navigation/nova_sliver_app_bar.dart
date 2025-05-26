import 'package:flutter/material.dart';
import '../../tokens/colors.dart';
import '../../tokens/spacing.dart';
import '../../tokens/typography.dart';

/// A sliver app bar component for the Nova design system
class NovaSliverAppBar extends StatelessWidget {
  /// Creates a Nova sliver app bar
  const NovaSliverAppBar({
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
    this.pinned = false,
    this.snap = false,
    this.floating = false,
    this.stretch = false,
    this.expandedHeight,
    this.flexibleSpace,
    this.collapsedHeight,
    this.onStretchTrigger,
    this.variant = NovaSliverAppBarVariant.primary,
    this.size = NovaSliverAppBarSize.medium,
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

  /// Whether the app bar should remain visible at the start of the scroll view
  final bool pinned;

  /// Whether the app bar should snap into view
  final bool snap;

  /// Whether the app bar should become visible as soon as the user scrolls towards the app bar
  final bool floating;

  /// Whether the app bar should stretch to fill the available space
  final bool stretch;

  /// The height of the app bar when expanded
  final double? expandedHeight;

  /// The widget to display in the expanded space
  final Widget? flexibleSpace;

  /// The height of the app bar when collapsed
  final double? collapsedHeight;

  /// Called when the user over-scrolls to the max extent
  final Future<void> Function()? onStretchTrigger;

  /// The visual style variant of the app bar
  final NovaSliverAppBarVariant variant;

  /// The size of the app bar
  final NovaSliverAppBarSize size;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
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
      pinned: pinned,
      snap: snap,
      floating: floating,
      stretch: stretch,
      expandedHeight: expandedHeight,
      flexibleSpace: flexibleSpace,
      collapsedHeight: collapsedHeight,
      onStretchTrigger: onStretchTrigger,
    );
  }

  TextStyle _getTitleStyle() {
    final baseStyle = size == NovaSliverAppBarSize.small
        ? NovaTypography.titleSmall
        : NovaTypography.titleMedium;

    return baseStyle.copyWith(
      color: _getForegroundColor(),
    );
  }

  Color _getBackgroundColor() {
    if (backgroundColor != null) return backgroundColor!;

    switch (variant) {
      case NovaSliverAppBarVariant.primary:
        return NovaColors.primary;
      case NovaSliverAppBarVariant.secondary:
        return NovaColors.secondary;
      case NovaSliverAppBarVariant.surface:
        return NovaColors.surface;
      case NovaSliverAppBarVariant.transparent:
        return Colors.transparent;
    }
  }

  Color _getForegroundColor() {
    if (foregroundColor != null) return foregroundColor!;

    switch (variant) {
      case NovaSliverAppBarVariant.primary:
      case NovaSliverAppBarVariant.secondary:
        return NovaColors.textInverse;
      case NovaSliverAppBarVariant.surface:
      case NovaSliverAppBarVariant.transparent:
        return NovaColors.textPrimary;
    }
  }

  double _getToolbarHeight() {
    switch (size) {
      case NovaSliverAppBarSize.small:
        return kToolbarHeight - NovaSpacing.sm;
      case NovaSliverAppBarSize.medium:
        return kToolbarHeight;
    }
  }
}

/// Visual style variants for the Nova sliver app bar
enum NovaSliverAppBarVariant {
  /// Primary app bar style
  primary,

  /// Secondary app bar style
  secondary,

  /// Surface app bar style
  surface,

  /// Transparent app bar style
  transparent,
}

/// Size variants for the Nova sliver app bar
enum NovaSliverAppBarSize {
  /// Small app bar size
  small,

  /// Medium app bar size
  medium,
} 