import 'package:flutter/material.dart';
import '../../tokens/colors.dart';
import '../../tokens/spacing.dart';
import '../../tokens/typography.dart';

/// An error state component for the Nova design system
class NovaErrorState extends StatelessWidget {
  /// Creates a Nova error state
  const NovaErrorState({
    super.key,
    required this.title,
    this.description,
    this.icon,
    this.action,
    this.variant = NovaErrorStateVariant.primary,
    this.size = NovaErrorStateSize.medium,
  });

  /// The title of the error state
  final String title;

  /// The description of the error state
  final String? description;

  /// The icon of the error state
  final Widget? icon;

  /// The action of the error state
  final Widget? action;

  /// The visual style variant of the error state
  final NovaErrorStateVariant variant;

  /// The size of the error state
  final NovaErrorStateSize size;

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
      case NovaErrorStateSize.small:
        return const EdgeInsets.all(NovaSpacing.md);
      case NovaErrorStateSize.medium:
        return const EdgeInsets.all(NovaSpacing.lg);
    }
  }

  double _getIconSpacing() {
    switch (size) {
      case NovaErrorStateSize.small:
        return NovaSpacing.md;
      case NovaErrorStateSize.medium:
        return NovaSpacing.lg;
    }
  }

  double _getDescriptionSpacing() {
    switch (size) {
      case NovaErrorStateSize.small:
        return NovaSpacing.sm;
      case NovaErrorStateSize.medium:
        return NovaSpacing.md;
    }
  }

  double _getActionSpacing() {
    switch (size) {
      case NovaErrorStateSize.small:
        return NovaSpacing.md;
      case NovaErrorStateSize.medium:
        return NovaSpacing.lg;
    }
  }

  TextStyle _getTitleStyle() {
    final baseStyle = size == NovaErrorStateSize.small
        ? NovaTypography.titleMedium
        : NovaTypography.titleLarge;

    return baseStyle.copyWith(
      color: _getTitleColor(),
    );
  }

  TextStyle _getDescriptionStyle() {
    final baseStyle = size == NovaErrorStateSize.small
        ? NovaTypography.bodyMedium
        : NovaTypography.bodyLarge;

    return baseStyle.copyWith(
      color: _getDescriptionColor(),
    );
  }

  Color _getTitleColor() {
    switch (variant) {
      case NovaErrorStateVariant.primary:
        return NovaColors.error;
      case NovaErrorStateVariant.secondary:
        return NovaColors.error.withValues(alpha: 0.8);
      case NovaErrorStateVariant.surface:
      case NovaErrorStateVariant.transparent:
        return NovaColors.textPrimary;
    }
  }

  Color _getDescriptionColor() {
    switch (variant) {
      case NovaErrorStateVariant.primary:
      case NovaErrorStateVariant.secondary:
      case NovaErrorStateVariant.surface:
      case NovaErrorStateVariant.transparent:
        return NovaColors.textSecondary;
    }
  }
}

/// Visual style variants for the Nova error state
enum NovaErrorStateVariant {
  /// Primary error state style
  primary,

  /// Secondary error state style
  secondary,

  /// Surface error state style
  surface,

  /// Transparent error state style
  transparent,
}

/// Size variants for the Nova error state
enum NovaErrorStateSize {
  /// Small error state size
  small,

  /// Medium error state size
  medium,
} 