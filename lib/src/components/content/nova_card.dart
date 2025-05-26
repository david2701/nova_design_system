import 'package:flutter/material.dart';
import '../../tokens/colors.dart';
import '../../tokens/radius.dart';
import '../../tokens/spacing.dart';
import '../../tokens/typography.dart';

/// A card component for the Nova design system
class NovaCard extends StatelessWidget {
  /// Creates a Nova card
  const NovaCard({
    super.key,
    required this.child,
    this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.padding,
    this.margin,
    this.variant = NovaCardVariant.elevated,
    this.size = NovaCardSize.medium,
  });

  /// The main content of the card
  final Widget child;

  /// The title of the card
  final String? title;

  /// The subtitle of the card
  final String? subtitle;

  /// The leading widget of the card
  final Widget? leading;

  /// The trailing widget of the card
  final Widget? trailing;

  /// Called when the card is tapped
  final VoidCallback? onTap;

  /// The padding of the card
  final EdgeInsetsGeometry? padding;

  /// The margin of the card
  final EdgeInsetsGeometry? margin;

  /// The visual style variant of the card
  final NovaCardVariant variant;

  /// The size of the card
  final NovaCardSize size;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: _getElevation(),
      color: _getBackgroundColor(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          size == NovaCardSize.small ? NovaRadius.sm : NovaRadius.md,
        ),
        side: _getBorderSide(),
      ),
      margin: margin ?? _getMargin(),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(
          size == NovaCardSize.small ? NovaRadius.sm : NovaRadius.md,
        ),
        child: Padding(
          padding: padding ?? _getPadding(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (title != null || subtitle != null || leading != null || trailing != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: NovaSpacing.sm),
                  child: Row(
                    children: [
                      if (leading != null) ...[
                        leading!,
                        const SizedBox(width: NovaSpacing.sm),
                      ],
                      if (title != null || subtitle != null)
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (title != null)
                                Text(
                                  title!,
                                  style: _getTitleStyle(),
                                ),
                              if (subtitle != null) ...[
                                const SizedBox(height: NovaSpacing.xs),
                                Text(
                                  subtitle!,
                                  style: _getSubtitleStyle(),
                                ),
                              ],
                            ],
                          ),
                        ),
                      if (trailing != null) ...[
                        const SizedBox(width: NovaSpacing.sm),
                        trailing!,
                      ],
                    ],
                  ),
                ),
              child,
            ],
          ),
        ),
      ),
    );
  }

  double _getElevation() {
    switch (variant) {
      case NovaCardVariant.elevated:
        return 2;
      case NovaCardVariant.outlined:
      case NovaCardVariant.filled:
        return 0;
    }
  }

  Color _getBackgroundColor() {
    switch (variant) {
      case NovaCardVariant.elevated:
      case NovaCardVariant.outlined:
        return NovaColors.surface;
      case NovaCardVariant.filled:
        return NovaColors.neutral100;
    }
  }

  BorderSide _getBorderSide() {
    switch (variant) {
      case NovaCardVariant.elevated:
        return BorderSide.none;
      case NovaCardVariant.outlined:
        return BorderSide(color: NovaColors.neutral200);
      case NovaCardVariant.filled:
        return BorderSide.none;
    }
  }

  EdgeInsetsGeometry _getMargin() {
    switch (size) {
      case NovaCardSize.small:
        return const EdgeInsets.all(NovaSpacing.xs);
      case NovaCardSize.medium:
        return const EdgeInsets.all(NovaSpacing.sm);
    }
  }

  EdgeInsetsGeometry _getPadding() {
    switch (size) {
      case NovaCardSize.small:
        return const EdgeInsets.all(NovaSpacing.sm);
      case NovaCardSize.medium:
        return const EdgeInsets.all(NovaSpacing.md);
    }
  }

  TextStyle _getTitleStyle() {
    final baseStyle = size == NovaCardSize.small
        ? NovaTypography.titleSmall
        : NovaTypography.titleMedium;

    return baseStyle.copyWith(
      color: NovaColors.textPrimary,
    );
  }

  TextStyle _getSubtitleStyle() {
    final baseStyle = size == NovaCardSize.small
        ? NovaTypography.bodySmall
        : NovaTypography.bodyMedium;

    return baseStyle.copyWith(
      color: NovaColors.textSecondary,
    );
  }
}

/// Visual style variants for the Nova card
enum NovaCardVariant {
  /// Elevated card style
  elevated,

  /// Outlined card style
  outlined,

  /// Filled card style
  filled,
}

/// Size variants for the Nova card
enum NovaCardSize {
  /// Small card size
  small,

  /// Medium card size
  medium,
} 