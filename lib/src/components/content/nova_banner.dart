import 'package:flutter/material.dart';
import '../../tokens/colors.dart';
import '../../tokens/radius.dart';
import '../../tokens/spacing.dart';
import '../../tokens/typography.dart';

/// A banner component for the Nova design system
class NovaBanner extends StatelessWidget {
  /// Creates a Nova banner
  const NovaBanner({
    super.key,
    required this.content,
    this.title,
    this.leading,
    this.trailing,
    this.onDismiss,
    this.variant = NovaBannerVariant.primary,
    this.size = NovaBannerSize.medium,
  });

  /// The content of the banner
  final Widget content;

  /// The title of the banner
  final String? title;

  /// The leading widget of the banner
  final Widget? leading;

  /// The trailing widget of the banner
  final Widget? trailing;

  /// Called when the banner is dismissed
  final VoidCallback? onDismiss;

  /// The visual style variant of the banner
  final NovaBannerVariant variant;

  /// The size of the banner
  final NovaBannerSize size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius: BorderRadius.circular(
          size == NovaBannerSize.small ? NovaRadius.sm : NovaRadius.md,
        ),
        border: Border.all(
          color: _getBorderColor(),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onDismiss,
          borderRadius: BorderRadius.circular(
            size == NovaBannerSize.small ? NovaRadius.sm : NovaRadius.md,
          ),
          child: Padding(
            padding: _getPadding(),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (leading != null) ...[
                  leading!,
                  const SizedBox(width: NovaSpacing.sm),
                ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (title != null) ...[
                        Text(
                          title!,
                          style: _getTitleStyle(),
                        ),
                        const SizedBox(height: NovaSpacing.xs),
                      ],
                      content,
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
        ),
      ),
    );
  }

  EdgeInsetsGeometry _getPadding() {
    switch (size) {
      case NovaBannerSize.small:
        return const EdgeInsets.all(NovaSpacing.sm);
      case NovaBannerSize.medium:
        return const EdgeInsets.all(NovaSpacing.md);
    }
  }

  Color _getBackgroundColor() {
    switch (variant) {
      case NovaBannerVariant.primary:
        return NovaColors.primary.withValues(alpha: 0.1);
      case NovaBannerVariant.secondary:
        return NovaColors.secondary.withValues(alpha: 0.1);
      case NovaBannerVariant.surface:
        return NovaColors.neutral100;
      case NovaBannerVariant.transparent:
        return Colors.transparent;
    }
  }

  Color _getBorderColor() {
    switch (variant) {
      case NovaBannerVariant.primary:
        return NovaColors.primary.withValues(alpha: 0.2);
      case NovaBannerVariant.secondary:
        return NovaColors.secondary.withValues(alpha: 0.2);
      case NovaBannerVariant.surface:
        return NovaColors.neutral200;
      case NovaBannerVariant.transparent:
        return Colors.transparent;
    }
  }

  TextStyle _getTitleStyle() {
    final baseStyle = size == NovaBannerSize.small
        ? NovaTypography.titleSmall
        : NovaTypography.titleMedium;

    return baseStyle.copyWith(
      color: _getTitleColor(),
    );
  }

  Color _getTitleColor() {
    switch (variant) {
      case NovaBannerVariant.primary:
        return NovaColors.primary;
      case NovaBannerVariant.secondary:
        return NovaColors.secondary;
      case NovaBannerVariant.surface:
      case NovaBannerVariant.transparent:
        return NovaColors.textPrimary;
    }
  }
}

/// Visual style variants for the Nova banner
enum NovaBannerVariant {
  /// Primary banner style
  primary,

  /// Secondary banner style
  secondary,

  /// Surface banner style
  surface,

  /// Transparent banner style
  transparent,
}

/// Size variants for the Nova banner
enum NovaBannerSize {
  /// Small banner size
  small,

  /// Medium banner size
  medium,
} 