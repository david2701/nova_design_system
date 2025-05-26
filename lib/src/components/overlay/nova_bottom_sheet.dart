import 'package:flutter/material.dart';
import 'package:nova_design_system/nova_design_system.dart';

enum NovaBottomSheetVariant {
  primary,
  secondary,
  surface,
  transparent
}

enum NovaBottomSheetSize {
  small,
  medium,
  large,
  full
}

class NovaBottomSheet {
  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
    String? title,
    Widget? leading,
    List<Widget>? actions,
    NovaBottomSheetVariant variant = NovaBottomSheetVariant.surface,
    NovaBottomSheetSize size = NovaBottomSheetSize.medium,
    bool isDismissible = true,
    bool enableDrag = true,
    bool showDragHandle = true,
    Color? backgroundColor,
    Color? barrierColor,
    EdgeInsets? padding,
    BorderRadius? borderRadius,
    VoidCallback? onClose,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      backgroundColor: backgroundColor ?? _getBackgroundColor(variant),
      barrierColor: barrierColor ?? Colors.black54,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? const BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      builder: (context) => _NovaBottomSheetContent(
        title: title,
        leading: leading,
        actions: actions,
        variant: variant,
        size: size,
        showDragHandle: showDragHandle,
        padding: padding,
        onClose: onClose,
        child: child,
      ),
    );
  }

  static Color _getBackgroundColor(NovaBottomSheetVariant variant) {
    switch (variant) {
      case NovaBottomSheetVariant.primary:
        return NovaColors.primary;
      case NovaBottomSheetVariant.secondary:
        return NovaColors.secondary;
      case NovaBottomSheetVariant.surface:
        return NovaColors.surface;
      case NovaBottomSheetVariant.transparent:
        return Colors.transparent;
    }
  }
}

class _NovaBottomSheetContent extends StatelessWidget {
  final Widget child;
  final String? title;
  final Widget? leading;
  final List<Widget>? actions;
  final NovaBottomSheetVariant variant;
  final NovaBottomSheetSize size;
  final bool showDragHandle;
  final EdgeInsets? padding;
  final VoidCallback? onClose;

  const _NovaBottomSheetContent({
    required this.child,
    this.title,
    this.leading,
    this.actions,
    required this.variant,
    required this.size,
    this.showDragHandle = true,
    this.padding,
    this.onClose,
  });

  double _getMaxHeight(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    switch (size) {
      case NovaBottomSheetSize.small:
        return height * 0.3;
      case NovaBottomSheetSize.medium:
        return height * 0.6;
      case NovaBottomSheetSize.large:
        return height * 0.8;
      case NovaBottomSheetSize.full:
        return height;
    }
  }

  @override
  Widget build(BuildContext context) {
    final effectivePadding = padding ?? const EdgeInsets.all(NovaSpacing.md);
    final maxHeight = _getMaxHeight(context);
    final isDark = variant == NovaBottomSheetVariant.primary || 
                   variant == NovaBottomSheetVariant.secondary;
    final textColor = isDark ? Colors.white : NovaColors.neutral900;

    return Container(
      constraints: BoxConstraints(
        maxHeight: maxHeight,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showDragHandle) ...[
            const SizedBox(height: NovaSpacing.sm),
            Container(
              width: 32,
              height: 4,
              decoration: BoxDecoration(
                color: NovaColors.neutral300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: NovaSpacing.sm),
          ],
          if (title != null || leading != null || actions != null)
            Padding(
              padding: effectivePadding,
              child: Row(
                children: [
                  if (leading != null) ...[
                    leading!,
                    const SizedBox(width: NovaSpacing.sm),
                  ],
                  if (title != null)
                    Expanded(
                      child: Text(
                        title!,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  if (actions != null) ...[
                    ...actions!,
                    if (onClose != null) ...[
                      const SizedBox(width: NovaSpacing.sm),
                      IconButton(
                        icon: Icon(
                          Icons.close,
                          color: textColor,
                        ),
                        onPressed: onClose,
                      ),
                    ],
                  ],
                ],
              ),
            ),
          Flexible(
            child: SingleChildScrollView(
              padding: effectivePadding,
              child: child,
            ),
          ),
        ],
      ),
    );
  }
} 