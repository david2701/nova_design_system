import 'package:flutter/material.dart';
import '../../tokens/colors.dart';
import '../../tokens/radius.dart';
import '../../tokens/spacing.dart';

/// An accordion component for the Nova design system
class NovaAccordion extends StatelessWidget {
  /// Creates a Nova accordion
  const NovaAccordion({
    super.key,
    required this.title,
    required this.content,
    this.subtitle,
    this.leading,
    this.trailing,
    this.initiallyExpanded = false,
    this.maintainState = false,
    this.onExpansionChanged,
    this.variant = NovaAccordionVariant.primary,
    this.size = NovaAccordionSize.medium,
  });

  /// The primary content of the accordion
  final Widget title;

  /// Additional content displayed below the title
  final Widget? subtitle;

  /// A widget to display before the title
  final Widget? leading;

  /// A widget to display after the title
  final Widget? trailing;

  /// The content of the accordion
  final Widget content;

  /// Whether the accordion is initially expanded
  final bool initiallyExpanded;

  /// Whether the state of the content is maintained when the accordion is collapsed
  final bool maintainState;

  /// Called when the expansion state changes
  final ValueChanged<bool>? onExpansionChanged;

  /// The visual style variant of the accordion
  final NovaAccordionVariant variant;

  /// The size of the accordion
  final NovaAccordionSize size;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: _getBackgroundColor(),
          borderRadius: BorderRadius.circular(
            size == NovaAccordionSize.small ? NovaRadius.sm : NovaRadius.md,
          ),
          border: Border.all(
            color: _getBorderColor(),
          ),
        ),
        child: ExpansionTile(
          title: title,
          subtitle: subtitle,
          leading: leading,
          trailing: trailing,
          initiallyExpanded: initiallyExpanded,
          maintainState: maintainState,
          onExpansionChanged: onExpansionChanged,
          tilePadding: _getTilePadding(),
          childrenPadding: _getChildrenPadding(),
          backgroundColor: Colors.transparent,
          collapsedBackgroundColor: Colors.transparent,
          textColor: _getTextColor(),
          collapsedTextColor: _getCollapsedTextColor(),
          iconColor: _getIconColor(),
          collapsedIconColor: _getCollapsedIconColor(),
          children: [
            Container(
              decoration: BoxDecoration(
                color: _getContentBackgroundColor(),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(
                    size == NovaAccordionSize.small ? NovaRadius.sm : NovaRadius.md,
                  ),
                  bottomRight: Radius.circular(
                    size == NovaAccordionSize.small ? NovaRadius.sm : NovaRadius.md,
                  ),
                ),
              ),
              child: content,
            ),
          ],
        ),
      ),
    );
  }

  EdgeInsetsGeometry _getTilePadding() {
    switch (size) {
      case NovaAccordionSize.small:
        return const EdgeInsets.symmetric(
          horizontal: NovaSpacing.sm,
          vertical: NovaSpacing.xs,
        );
      case NovaAccordionSize.medium:
        return const EdgeInsets.symmetric(
          horizontal: NovaSpacing.md,
          vertical: NovaSpacing.sm,
        );
    }
  }

  EdgeInsetsGeometry _getChildrenPadding() {
    switch (size) {
      case NovaAccordionSize.small:
        return const EdgeInsets.all(NovaSpacing.sm);
      case NovaAccordionSize.medium:
        return const EdgeInsets.all(NovaSpacing.md);
    }
  }

  Color _getBackgroundColor() {
    switch (variant) {
      case NovaAccordionVariant.primary:
      case NovaAccordionVariant.secondary:
      case NovaAccordionVariant.surface:
        return NovaColors.surface;
      case NovaAccordionVariant.transparent:
        return Colors.transparent;
    }
  }

  Color _getContentBackgroundColor() {
    switch (variant) {
      case NovaAccordionVariant.primary:
        return NovaColors.primary.withValues(alpha: 0.05);
      case NovaAccordionVariant.secondary:
        return NovaColors.secondary.withValues(alpha: 0.05);
      case NovaAccordionVariant.surface:
        return NovaColors.neutral100;
      case NovaAccordionVariant.transparent:
        return Colors.transparent;
    }
  }

  Color _getBorderColor() {
    switch (variant) {
      case NovaAccordionVariant.primary:
      case NovaAccordionVariant.secondary:
        return NovaColors.textInverse.withValues(alpha: 0.1);
      case NovaAccordionVariant.surface:
      case NovaAccordionVariant.transparent:
        return NovaColors.neutral200;
    }
  }

  Color _getTextColor() {
    switch (variant) {
      case NovaAccordionVariant.primary:
        return NovaColors.primary;
      case NovaAccordionVariant.secondary:
        return NovaColors.secondary;
      case NovaAccordionVariant.surface:
      case NovaAccordionVariant.transparent:
        return NovaColors.textPrimary;
    }
  }

  Color _getCollapsedTextColor() {
    switch (variant) {
      case NovaAccordionVariant.primary:
      case NovaAccordionVariant.secondary:
      case NovaAccordionVariant.surface:
      case NovaAccordionVariant.transparent:
        return NovaColors.textPrimary;
    }
  }

  Color _getIconColor() {
    switch (variant) {
      case NovaAccordionVariant.primary:
        return NovaColors.primary;
      case NovaAccordionVariant.secondary:
        return NovaColors.secondary;
      case NovaAccordionVariant.surface:
      case NovaAccordionVariant.transparent:
        return NovaColors.textPrimary;
    }
  }

  Color _getCollapsedIconColor() {
    switch (variant) {
      case NovaAccordionVariant.primary:
      case NovaAccordionVariant.secondary:
      case NovaAccordionVariant.surface:
      case NovaAccordionVariant.transparent:
        return NovaColors.textPrimary;
    }
  }
}

/// Visual style variants for the Nova accordion
enum NovaAccordionVariant {
  /// Primary accordion style
  primary,

  /// Secondary accordion style
  secondary,

  /// Surface accordion style
  surface,

  /// Transparent accordion style
  transparent,
}

/// Size variants for the Nova accordion
enum NovaAccordionSize {
  /// Small accordion size
  small,

  /// Medium accordion size
  medium,
} 