import 'package:flutter/material.dart';
import '../../tokens/colors.dart';

/// An expansion panel list component for the Nova design system
class NovaExpansionPanelList extends StatelessWidget {
  /// Creates a Nova expansion panel list
  const NovaExpansionPanelList({
    super.key,
    required this.expansionCallback,
    required this.children,
    this.animationDuration = const Duration(milliseconds: 200),
    this.expandedHeaderPadding = EdgeInsets.zero,
    this.dividerColor,
    this.elevation = 0,
    this.variant = NovaExpansionPanelListVariant.primary,
    this.size = NovaExpansionPanelListSize.medium,
  });

  /// Called when an expansion panel is expanded or collapsed
  final ExpansionPanelCallback expansionCallback;

  /// The expansion panels to display
  final List<ExpansionPanel> children;

  /// The duration of the expansion animation
  final Duration animationDuration;

  /// The padding of the expanded header
  final EdgeInsets expandedHeaderPadding;

  /// The color of the divider
  final Color? dividerColor;

  /// The elevation of the panels
  final double elevation;

  /// The visual style variant of the expansion panel list
  final NovaExpansionPanelListVariant variant;

  /// The size of the expansion panel list
  final NovaExpansionPanelListSize size;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: dividerColor ?? _getDividerColor(),
      ),
      child: ExpansionPanelList(
        expansionCallback: expansionCallback,
        children: _buildPanels(),
        animationDuration: animationDuration,
        expandedHeaderPadding: expandedHeaderPadding,
        elevation: elevation,
        dividerColor: dividerColor ?? _getDividerColor(),
      ),
    );
  }

  List<ExpansionPanel> _buildPanels() {
    return children.map((panel) {
      return ExpansionPanel(
        headerBuilder: panel.headerBuilder,
        body: panel.body,
        isExpanded: panel.isExpanded,
        canTapOnHeader: panel.canTapOnHeader,
        backgroundColor: panel.backgroundColor ?? _getBackgroundColor(),
      );
    }).toList();
  }

  Color _getDividerColor() {
    switch (variant) {
      case NovaExpansionPanelListVariant.primary:
      case NovaExpansionPanelListVariant.secondary:
        return NovaColors.textInverse.withValues(alpha: 0.1);
      case NovaExpansionPanelListVariant.surface:
      case NovaExpansionPanelListVariant.transparent:
        return NovaColors.neutral200;
    }
  }

  Color _getBackgroundColor() {
    switch (variant) {
      case NovaExpansionPanelListVariant.primary:
        return NovaColors.primary.withValues(alpha: 0.05);
      case NovaExpansionPanelListVariant.secondary:
        return NovaColors.secondary.withValues(alpha: 0.05);
      case NovaExpansionPanelListVariant.surface:
        return NovaColors.surface;
      case NovaExpansionPanelListVariant.transparent:
        return Colors.transparent;
    }
  }
}

/// Visual style variants for the Nova expansion panel list
enum NovaExpansionPanelListVariant {
  /// Primary expansion panel list style
  primary,

  /// Secondary expansion panel list style
  secondary,

  /// Surface expansion panel list style
  surface,

  /// Transparent expansion panel list style
  transparent,
}

/// Size variants for the Nova expansion panel list
enum NovaExpansionPanelListSize {
  /// Small expansion panel list size
  small,

  /// Medium expansion panel list size
  medium,
} 