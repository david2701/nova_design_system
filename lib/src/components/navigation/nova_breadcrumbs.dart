import 'package:flutter/material.dart';
import '../../tokens/colors.dart';
import '../../tokens/spacing.dart';
import '../../tokens/typography.dart';

/// A breadcrumbs component for the Nova design system
class NovaBreadcrumbs extends StatelessWidget {
  /// Creates a Nova breadcrumbs
  const NovaBreadcrumbs({
    super.key,
    required this.items,
    this.onItemTap,
    this.separator = '/',
    this.variant = NovaBreadcrumbsVariant.primary,
    this.size = NovaBreadcrumbsSize.medium,
  });

  /// The items to display in the breadcrumbs
  final List<NovaBreadcrumbItem> items;

  /// Called when an item is tapped
  final void Function(int)? onItemTap;

  /// The separator between items
  final String separator;

  /// The visual style variant of the breadcrumbs
  final NovaBreadcrumbsVariant variant;

  /// The size of the breadcrumbs
  final NovaBreadcrumbsSize size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < items.length; i++) ...[
          if (i > 0) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: NovaSpacing.xs),
              child: Text(
                separator,
                style: _getSeparatorStyle(),
              ),
            ),
          ],
          GestureDetector(
            onTap: onItemTap != null ? () => onItemTap!(i) : null,
            child: Text(
              items[i].label,
              style: _getItemStyle(i),
            ),
          ),
        ],
      ],
    );
  }

  TextStyle _getItemStyle(int index) {
    final baseStyle = size == NovaBreadcrumbsSize.small
        ? NovaTypography.labelSmall
        : NovaTypography.labelMedium;

    final isLast = index == items.length - 1;

    return baseStyle.copyWith(
      color: isLast ? _getActiveColor() : _getInactiveColor(),
      fontWeight: isLast ? FontWeight.w600 : FontWeight.normal,
    );
  }

  TextStyle _getSeparatorStyle() {
    final baseStyle = size == NovaBreadcrumbsSize.small
        ? NovaTypography.labelSmall
        : NovaTypography.labelMedium;

    return baseStyle.copyWith(
      color: _getSeparatorColor(),
    );
  }

  Color _getActiveColor() {
    switch (variant) {
      case NovaBreadcrumbsVariant.primary:
        return NovaColors.primary;
      case NovaBreadcrumbsVariant.secondary:
        return NovaColors.secondary;
      case NovaBreadcrumbsVariant.surface:
        return NovaColors.textPrimary;
      case NovaBreadcrumbsVariant.transparent:
        return NovaColors.textPrimary;
    }
  }

  Color _getInactiveColor() {
    switch (variant) {
      case NovaBreadcrumbsVariant.primary:
      case NovaBreadcrumbsVariant.secondary:
        return NovaColors.textInverse.withOpacity(0.6);
      case NovaBreadcrumbsVariant.surface:
      case NovaBreadcrumbsVariant.transparent:
        return NovaColors.neutral500;
    }
  }

  Color _getSeparatorColor() {
    switch (variant) {
      case NovaBreadcrumbsVariant.primary:
      case NovaBreadcrumbsVariant.secondary:
        return NovaColors.textInverse.withOpacity(0.4);
      case NovaBreadcrumbsVariant.surface:
      case NovaBreadcrumbsVariant.transparent:
        return NovaColors.neutral400;
    }
  }
}

/// A breadcrumb item for the Nova design system
class NovaBreadcrumbItem {
  /// Creates a Nova breadcrumb item
  const NovaBreadcrumbItem({
    required this.label,
    this.icon,
  });

  /// The label of the breadcrumb item
  final String label;

  /// The icon of the breadcrumb item
  final IconData? icon;
}

/// Visual style variants for the Nova breadcrumbs
enum NovaBreadcrumbsVariant {
  /// Primary breadcrumbs style
  primary,

  /// Secondary breadcrumbs style
  secondary,

  /// Surface breadcrumbs style
  surface,

  /// Transparent breadcrumbs style
  transparent,
}

/// Size variants for the Nova breadcrumbs
enum NovaBreadcrumbsSize {
  /// Small breadcrumbs size
  small,

  /// Medium breadcrumbs size
  medium,
} 