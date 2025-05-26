import 'package:flutter/material.dart';
import '../../tokens/colors.dart';
import '../../tokens/spacing.dart';
import '../../tokens/typography.dart';

/// An empty state component for the Nova design system
class NovaEmptyState extends StatelessWidget {
  /// Creates a Nova empty state
  const NovaEmptyState({
    super.key,
    required this.title,
    this.description,
    this.icon,
    this.action,
    this.variant = NovaEmptyStateVariant.primary,
    this.size = NovaEmptyStateSize.medium,
  });

  /// The title of the empty state
  final String title;

  /// The description of the empty state
  final String? description;

  /// The icon of the empty state
  final Widget? icon;

  /// The action of the empty state
  final Widget? action;

  /// The visual style variant of the empty state
  final NovaEmptyStateVariant variant;

  /// The size of the empty state
  final NovaEmptyStateSize size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: _getPadding(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              icon!,
              SizedBox(height: _getIconSpacing()),
            ],
            Text(
              title,
              style: _getTitleStyle(),
              textAlign: TextAlign.center,
            ),
            if (description != null) ...[
              SizedBox(height: _getDescriptionSpacing()),
              Text(
                description!,
                style: _getDescriptionStyle(),
                textAlign: TextAlign.center,
              ),
            ],
            if (action != null) ...[
              SizedBox(height: _getActionSpacing()),
              action!,
            ],
          ],
        ),
      ),
    );
  }

  EdgeInsetsGeometry _getPadding() {
    switch (size) {
      case NovaEmptyStateSize.small:
        return const EdgeInsets.all(NovaSpacing.md);
      case NovaEmptyStateSize.medium:
        return const EdgeInsets.all(NovaSpacing.lg);
    }
  }

  double _getIconSpacing() {
    switch (size) {
      case NovaEmptyStateSize.small:
        return NovaSpacing.md;
      case NovaEmptyStateSize.medium:
        return NovaSpacing.lg;
    }
  }

  double _getDescriptionSpacing() {
    switch (size) {
      case NovaEmptyStateSize.small:
        return NovaSpacing.sm;
      case NovaEmptyStateSize.medium:
        return NovaSpacing.md;
    }
  }

  double _getActionSpacing() {
    switch (size) {
      case NovaEmptyStateSize.small:
        return NovaSpacing.md;
      case NovaEmptyStateSize.medium:
        return NovaSpacing.lg;
    }
  }

  TextStyle _getTitleStyle() {
    final baseStyle = size == NovaEmptyStateSize.small
        ? NovaTypography.titleMedium
        : NovaTypography.titleLarge;

    return baseStyle.copyWith(
      color: _getTitleColor(),
    );
  }

  TextStyle _getDescriptionStyle() {
    final baseStyle = size == NovaEmptyStateSize.small
        ? NovaTypography.bodyMedium
        : NovaTypography.bodyLarge;

    return baseStyle.copyWith(
      color: _getDescriptionColor(),
    );
  }

  Color _getTitleColor() {
    switch (variant) {
      case NovaEmptyStateVariant.primary:
      case NovaEmptyStateVariant.secondary:
      case NovaEmptyStateVariant.surface:
      case NovaEmptyStateVariant.transparent:
        return NovaColors.textPrimary;
    }
  }

  Color _getDescriptionColor() {
    switch (variant) {
      case NovaEmptyStateVariant.primary:
      case NovaEmptyStateVariant.secondary:
      case NovaEmptyStateVariant.surface:
      case NovaEmptyStateVariant.transparent:
        return NovaColors.textSecondary;
    }
  }
}

/// Visual style variants for the Nova empty state
enum NovaEmptyStateVariant {
  /// Primary empty state style
  primary,

  /// Secondary empty state style
  secondary,

  /// Surface empty state style
  surface,

  /// Transparent empty state style
  transparent,
}

/// Size variants for the Nova empty state
enum NovaEmptyStateSize {
  /// Small empty state size
  small,

  /// Medium empty state size
  medium,
} 