import 'package:flutter/material.dart';
import '../../tokens/colors.dart';
import '../../tokens/spacing.dart';

/// An expansion tile component for the Nova design system
class NovaExpansionTile extends StatelessWidget {
  /// Creates a Nova expansion tile
  const NovaExpansionTile({
    super.key,
    required this.title,
    required this.children,
    this.subtitle,
    this.leading,
    this.trailing,
    this.initiallyExpanded = false,
    this.maintainState = false,
    this.tilePadding,
    this.expandedCrossAxisAlignment,
    this.expandedAlignment,
    this.childrenPadding,
    this.backgroundColor,
    this.collapsedBackgroundColor,
    this.textColor,
    this.collapsedTextColor,
    this.iconColor,
    this.collapsedIconColor,
    this.onExpansionChanged,
    this.variant = NovaExpansionTileVariant.primary,
    this.size = NovaExpansionTileSize.medium,
  });

  /// The primary content of the tile
  final Widget title;

  /// Additional content displayed below the title
  final Widget? subtitle;

  /// A widget to display before the title
  final Widget? leading;

  /// A widget to display after the title
  final Widget? trailing;

  /// The children of the expansion tile
  final List<Widget> children;

  /// Whether the tile is initially expanded
  final bool initiallyExpanded;

  /// Whether the state of the children is maintained when the tile is collapsed
  final bool maintainState;

  /// The padding of the tile
  final EdgeInsetsGeometry? tilePadding;

  /// The cross-axis alignment of the children
  final CrossAxisAlignment? expandedCrossAxisAlignment;

  /// The alignment of the children
  final Alignment? expandedAlignment;

  /// The padding of the children
  final EdgeInsetsGeometry? childrenPadding;

  /// The background color of the tile when expanded
  final Color? backgroundColor;

  /// The background color of the tile when collapsed
  final Color? collapsedBackgroundColor;

  /// The text color of the tile when expanded
  final Color? textColor;

  /// The text color of the tile when collapsed
  final Color? collapsedTextColor;

  /// The icon color of the tile when expanded
  final Color? iconColor;

  /// The icon color of the tile when collapsed
  final Color? collapsedIconColor;

  /// Called when the expansion state changes
  final ValueChanged<bool>? onExpansionChanged;

  /// The visual style variant of the expansion tile
  final NovaExpansionTileVariant variant;

  /// The size of the expansion tile
  final NovaExpansionTileSize size;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
      ),
      child: ExpansionTile(
        title: title,
        subtitle: subtitle,
        leading: leading,
        trailing: trailing,
        initiallyExpanded: initiallyExpanded,
        maintainState: maintainState,
        tilePadding: tilePadding ?? _getTilePadding(),
        expandedCrossAxisAlignment: expandedCrossAxisAlignment ?? CrossAxisAlignment.start,
        expandedAlignment: expandedAlignment ?? Alignment.centerLeft,
        childrenPadding: childrenPadding ?? _getChildrenPadding(),
        backgroundColor: backgroundColor ?? _getBackgroundColor(),
        collapsedBackgroundColor: collapsedBackgroundColor ?? _getCollapsedBackgroundColor(),
        textColor: textColor ?? _getTextColor(),
        collapsedTextColor: collapsedTextColor ?? _getCollapsedTextColor(),
        iconColor: iconColor ?? _getIconColor(),
        collapsedIconColor: collapsedIconColor ?? _getCollapsedIconColor(),
        onExpansionChanged: onExpansionChanged,
      ),
    );
  }

  EdgeInsetsGeometry _getTilePadding() {
    switch (size) {
      case NovaExpansionTileSize.small:
        return const EdgeInsets.symmetric(
          horizontal: NovaSpacing.sm,
          vertical: NovaSpacing.xs,
        );
      case NovaExpansionTileSize.medium:
        return const EdgeInsets.symmetric(
          horizontal: NovaSpacing.md,
          vertical: NovaSpacing.sm,
        );
    }
  }

  EdgeInsetsGeometry _getChildrenPadding() {
    switch (size) {
      case NovaExpansionTileSize.small:
        return const EdgeInsets.fromLTRB(
          NovaSpacing.sm,
          0,
          NovaSpacing.sm,
          NovaSpacing.sm,
        );
      case NovaExpansionTileSize.medium:
        return const EdgeInsets.fromLTRB(
          NovaSpacing.md,
          0,
          NovaSpacing.md,
          NovaSpacing.md,
        );
    }
  }

  Color _getBackgroundColor() {
    switch (variant) {
      case NovaExpansionTileVariant.primary:
        return NovaColors.primary.withValues(alpha: 0.05);
      case NovaExpansionTileVariant.secondary:
        return NovaColors.secondary.withValues(alpha: 0.05);
      case NovaExpansionTileVariant.surface:
        return NovaColors.surface;
      case NovaExpansionTileVariant.transparent:
        return Colors.transparent;
    }
  }

  Color _getCollapsedBackgroundColor() {
    switch (variant) {
      case NovaExpansionTileVariant.primary:
      case NovaExpansionTileVariant.secondary:
      case NovaExpansionTileVariant.surface:
        return NovaColors.surface;
      case NovaExpansionTileVariant.transparent:
        return Colors.transparent;
    }
  }

  Color _getTextColor() {
    switch (variant) {
      case NovaExpansionTileVariant.primary:
        return NovaColors.primary;
      case NovaExpansionTileVariant.secondary:
        return NovaColors.secondary;
      case NovaExpansionTileVariant.surface:
      case NovaExpansionTileVariant.transparent:
        return NovaColors.textPrimary;
    }
  }

  Color _getCollapsedTextColor() {
    switch (variant) {
      case NovaExpansionTileVariant.primary:
      case NovaExpansionTileVariant.secondary:
      case NovaExpansionTileVariant.surface:
      case NovaExpansionTileVariant.transparent:
        return NovaColors.textPrimary;
    }
  }

  Color _getIconColor() {
    switch (variant) {
      case NovaExpansionTileVariant.primary:
        return NovaColors.primary;
      case NovaExpansionTileVariant.secondary:
        return NovaColors.secondary;
      case NovaExpansionTileVariant.surface:
      case NovaExpansionTileVariant.transparent:
        return NovaColors.textPrimary;
    }
  }

  Color _getCollapsedIconColor() {
    switch (variant) {
      case NovaExpansionTileVariant.primary:
      case NovaExpansionTileVariant.secondary:
      case NovaExpansionTileVariant.surface:
      case NovaExpansionTileVariant.transparent:
        return NovaColors.textPrimary;
    }
  }
}

/// Visual style variants for the Nova expansion tile
enum NovaExpansionTileVariant {
  /// Primary expansion tile style
  primary,

  /// Secondary expansion tile style
  secondary,

  /// Surface expansion tile style
  surface,

  /// Transparent expansion tile style
  transparent,
}

/// Size variants for the Nova expansion tile
enum NovaExpansionTileSize {
  /// Small expansion tile size
  small,

  /// Medium expansion tile size
  medium,
} 