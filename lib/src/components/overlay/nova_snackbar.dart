import 'package:flutter/material.dart';
import 'package:nova_design_system/nova_design_system.dart';

enum NovaSnackbarVariant {
  primary,
  secondary,
  success,
  warning,
  error,
  info
}

enum NovaSnackbarSize {
  small,
  medium,
  large
}

class NovaSnackbar {
  static void show({
    required BuildContext context,
    required String message,
    String? title,
    NovaSnackbarVariant variant = NovaSnackbarVariant.primary,
    NovaSnackbarSize size = NovaSnackbarSize.medium,
    Duration duration = const Duration(seconds: 4),
    Widget? icon,
    Widget? action,
    bool showCloseIcon = true,
    VoidCallback? onVisible,
    EdgeInsets? margin,
    EdgeInsets? padding,
    BorderRadius? borderRadius,
    Color? backgroundColor,
    Color? textColor,
  }) {
    final snackBar = SnackBar(
      content: _NovaSnackbarContent(
        message: message,
        title: title,
        variant: variant,
        size: size,
        icon: icon,
        action: action,
        showCloseIcon: showCloseIcon,
        textColor: textColor,
      ),
      duration: duration,
      margin: margin ?? const EdgeInsets.all(NovaSpacing.md),
      padding: padding ?? const EdgeInsets.all(NovaSpacing.md),
      backgroundColor: backgroundColor ?? _getBackgroundColor(variant),
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(8),
      ),
      behavior: SnackBarBehavior.floating,
      onVisible: onVisible,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static Color _getBackgroundColor(NovaSnackbarVariant variant) {
    switch (variant) {
      case NovaSnackbarVariant.primary:
        return NovaColors.primary;
      case NovaSnackbarVariant.secondary:
        return NovaColors.secondary;
      case NovaSnackbarVariant.success:
        return NovaColors.success;
      case NovaSnackbarVariant.warning:
        return NovaColors.warning;
      case NovaSnackbarVariant.error:
        return NovaColors.error;
      case NovaSnackbarVariant.info:
        return NovaColors.info;
    }
  }
}

class _NovaSnackbarContent extends StatelessWidget {
  final String message;
  final String? title;
  final NovaSnackbarVariant variant;
  final NovaSnackbarSize size;
  final Widget? icon;
  final Widget? action;
  final bool showCloseIcon;
  final Color? textColor;

  const _NovaSnackbarContent({
    required this.message,
    this.title,
    required this.variant,
    required this.size,
    this.icon,
    this.action,
    this.showCloseIcon = true,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveTextColor = textColor ?? Colors.white;
    final iconSize = _getIconSize();
    final textStyle = _getTextStyle(context, effectiveTextColor);

    return Row(
      children: [
        if (icon != null) ...[
          SizedBox(
            width: iconSize,
            height: iconSize,
            child: icon,
          ),
          const SizedBox(width: NovaSpacing.sm),
        ],
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title != null) ...[
                Text(
                  title!,
                  style: textStyle?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: NovaSpacing.xs),
              ],
              Text(
                message,
                style: textStyle,
              ),
            ],
          ),
        ),
        if (action != null) ...[
          const SizedBox(width: NovaSpacing.sm),
          action!,
        ],
        if (showCloseIcon) ...[
          const SizedBox(width: NovaSpacing.sm),
          IconButton(
            icon: Icon(
              Icons.close,
              color: effectiveTextColor,
              size: iconSize,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ],
    );
  }

  double _getIconSize() {
    switch (size) {
      case NovaSnackbarSize.small:
        return 16.0;
      case NovaSnackbarSize.medium:
        return 20.0;
      case NovaSnackbarSize.large:
        return 24.0;
    }
  }

  TextStyle? _getTextStyle(BuildContext context, Color color) {
    final baseStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
      color: color,
    );

    switch (size) {
      case NovaSnackbarSize.small:
        return baseStyle?.copyWith(fontSize: 12);
      case NovaSnackbarSize.medium:
        return baseStyle?.copyWith(fontSize: 14);
      case NovaSnackbarSize.large:
        return baseStyle?.copyWith(fontSize: 16);
    }
  }
} 