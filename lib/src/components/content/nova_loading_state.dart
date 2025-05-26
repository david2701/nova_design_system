import 'package:flutter/material.dart';
import '../../tokens/colors.dart';
import '../../tokens/spacing.dart';
import '../../tokens/typography.dart';

/// A loading state component for the Nova design system
class NovaLoadingState extends StatelessWidget {
  /// Creates a Nova loading state
  const NovaLoadingState({
    super.key,
    required this.title,
    this.description,
    this.icon,
    this.variant = NovaLoadingStateVariant.primary,
    this.size = NovaLoadingStateSize.medium,
  });

  /// The title of the loading state
  final String title;

  /// The description of the loading state
  final String? description;

  /// The icon of the loading state
  final Widget? icon;

  /// The visual style variant of the loading state
  final NovaLoadingStateVariant variant;

  /// The size of the loading state
  final NovaLoadingStateSize size;

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
            SizedBox(height: _getSpinnerSpacing()),
            SizedBox(
              width: _getSpinnerSize(),
              height: _getSpinnerSize(),
              child: CircularProgressIndicator(
                strokeWidth: _getSpinnerStrokeWidth(),
                valueColor: AlwaysStoppedAnimation<Color>(_getSpinnerColor()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  EdgeInsetsGeometry _getPadding() {
    switch (size) {
      case NovaLoadingStateSize.small:
        return const EdgeInsets.all(NovaSpacing.md);
      case NovaLoadingStateSize.medium:
        return const EdgeInsets.all(NovaSpacing.lg);
    }
  }

  double _getIconSpacing() {
    switch (size) {
      case NovaLoadingStateSize.small:
        return NovaSpacing.md;
      case NovaLoadingStateSize.medium:
        return NovaSpacing.lg;
    }
  }

  double _getDescriptionSpacing() {
    switch (size) {
      case NovaLoadingStateSize.small:
        return NovaSpacing.sm;
      case NovaLoadingStateSize.medium:
        return NovaSpacing.md;
    }
  }

  double _getSpinnerSpacing() {
    switch (size) {
      case NovaLoadingStateSize.small:
        return NovaSpacing.md;
      case NovaLoadingStateSize.medium:
        return NovaSpacing.lg;
    }
  }

  double _getSpinnerSize() {
    switch (size) {
      case NovaLoadingStateSize.small:
        return 24.0;
      case NovaLoadingStateSize.medium:
        return 32.0;
    }
  }

  double _getSpinnerStrokeWidth() {
    switch (size) {
      case NovaLoadingStateSize.small:
        return 2.0;
      case NovaLoadingStateSize.medium:
        return 3.0;
    }
  }

  TextStyle _getTitleStyle() {
    final baseStyle = size == NovaLoadingStateSize.small
        ? NovaTypography.titleMedium
        : NovaTypography.titleLarge;

    return baseStyle.copyWith(
      color: _getTitleColor(),
    );
  }

  TextStyle _getDescriptionStyle() {
    final baseStyle = size == NovaLoadingStateSize.small
        ? NovaTypography.bodyMedium
        : NovaTypography.bodyLarge;

    return baseStyle.copyWith(
      color: _getDescriptionColor(),
    );
  }

  Color _getTitleColor() {
    switch (variant) {
      case NovaLoadingStateVariant.primary:
      case NovaLoadingStateVariant.secondary:
      case NovaLoadingStateVariant.surface:
      case NovaLoadingStateVariant.transparent:
        return NovaColors.textPrimary;
    }
  }

  Color _getDescriptionColor() {
    switch (variant) {
      case NovaLoadingStateVariant.primary:
      case NovaLoadingStateVariant.secondary:
      case NovaLoadingStateVariant.surface:
      case NovaLoadingStateVariant.transparent:
        return NovaColors.textSecondary;
    }
  }

  Color _getSpinnerColor() {
    switch (variant) {
      case NovaLoadingStateVariant.primary:
        return NovaColors.primary;
      case NovaLoadingStateVariant.secondary:
        return NovaColors.secondary;
      case NovaLoadingStateVariant.surface:
      case NovaLoadingStateVariant.transparent:
        return NovaColors.textPrimary;
    }
  }
}

/// Visual style variants for the Nova loading state
enum NovaLoadingStateVariant {
  /// Primary loading state style
  primary,

  /// Secondary loading state style
  secondary,

  /// Surface loading state style
  surface,

  /// Transparent loading state style
  transparent,
}

/// Size variants for the Nova loading state
enum NovaLoadingStateSize {
  /// Small loading state size
  small,

  /// Medium loading state size
  medium,
} 