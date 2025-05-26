import 'package:flutter/material.dart';
import '../../tokens/colors.dart';
import '../../tokens/radius.dart';
import '../../tokens/spacing.dart';
import '../../tokens/typography.dart';

/// An alert component for the Nova design system
class NovaAlert extends StatelessWidget {
  /// Creates a Nova alert
  const NovaAlert({
    super.key,
    required this.content,
    this.title,
    this.leading,
    this.trailing,
    this.onDismiss,
    this.variant = NovaAlertVariant.info,
    this.size = NovaAlertSize.medium,
  });

  /// The content of the alert
  final Widget content;

  /// The title of the alert
  final String? title;

  /// The leading widget of the alert
  final Widget? leading;

  /// The trailing widget of the alert
  final Widget? trailing;

  /// Called when the alert is dismissed
  final VoidCallback? onDismiss;

  /// The visual style variant of the alert
  final NovaAlertVariant variant;

  /// The size of the alert
  final NovaAlertSize size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius: BorderRadius.circular(
          size == NovaAlertSize.small ? NovaRadius.sm : NovaRadius.md,
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
            size == NovaAlertSize.small ? NovaRadius.sm : NovaRadius.md,
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
      case NovaAlertSize.small:
        return const EdgeInsets.all(NovaSpacing.sm);
      case NovaAlertSize.medium:
        return const EdgeInsets.all(NovaSpacing.md);
    }
  }

  Color _getBackgroundColor() {
    switch (variant) {
      case NovaAlertVariant.info:
        return NovaColors.info.withOpacity(0.1);
      case NovaAlertVariant.success:
        return NovaColors.success.withOpacity(0.1);
      case NovaAlertVariant.warning:
        return NovaColors.warning.withOpacity(0.1);
      case NovaAlertVariant.error:
        return NovaColors.error.withOpacity(0.1);
    }
  }

  Color _getBorderColor() {
    switch (variant) {
      case NovaAlertVariant.info:
        return NovaColors.info.withOpacity(0.2);
      case NovaAlertVariant.success:
        return NovaColors.success.withOpacity(0.2);
      case NovaAlertVariant.warning:
        return NovaColors.warning.withOpacity(0.2);
      case NovaAlertVariant.error:
        return NovaColors.error.withOpacity(0.2);
    }
  }

  TextStyle _getTitleStyle() {
    final baseStyle = size == NovaAlertSize.small
        ? NovaTypography.titleSmall
        : NovaTypography.titleMedium;

    return baseStyle.copyWith(
      color: _getTitleColor(),
    );
  }

  Color _getTitleColor() {
    switch (variant) {
      case NovaAlertVariant.info:
        return NovaColors.info;
      case NovaAlertVariant.success:
        return NovaColors.success;
      case NovaAlertVariant.warning:
        return NovaColors.warning;
      case NovaAlertVariant.error:
        return NovaColors.error;
    }
  }
}

/// Visual style variants for the Nova alert
enum NovaAlertVariant {
  /// Info alert style
  info,

  /// Success alert style
  success,

  /// Warning alert style
  warning,

  /// Error alert style
  error,
}

/// Size variants for the Nova alert
enum NovaAlertSize {
  /// Small alert size
  small,

  /// Medium alert size
  medium,
} 