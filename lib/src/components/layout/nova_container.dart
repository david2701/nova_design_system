import 'package:flutter/material.dart';
import '../../tokens/colors.dart';
import '../../tokens/radius.dart';
import '../../tokens/spacing.dart';

/// A container component for the Nova design system
class NovaContainer extends StatelessWidget {
  /// Creates a Nova container
  const NovaContainer({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.alignment,
    this.variant = NovaContainerVariant.surface,
    this.size = NovaContainerSize.medium,
    this.borderRadius,
    this.borderColor,
    this.borderWidth,
    this.shadow,
  });

  /// The child widget
  final Widget child;

  /// The padding of the container
  final EdgeInsetsGeometry? padding;

  /// The margin of the container
  final EdgeInsetsGeometry? margin;

  /// The width of the container
  final double? width;

  /// The height of the container
  final double? height;

  /// The alignment of the container
  final Alignment? alignment;

  /// The visual style variant of the container
  final NovaContainerVariant variant;

  /// The size of the container
  final NovaContainerSize size;

  /// The border radius of the container
  final double? borderRadius;

  /// The border color of the container
  final Color? borderColor;

  /// The border width of the container
  final double? borderWidth;

  /// The shadow of the container
  final List<BoxShadow>? shadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding ?? _getPadding(),
      alignment: alignment,
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius: BorderRadius.circular(
          borderRadius ?? _getBorderRadius(),
        ),
        border: borderColor != null || borderWidth != null
            ? Border.all(
                color: borderColor ?? _getBorderColor(),
                width: borderWidth ?? _getBorderWidth(),
              )
            : null,
        boxShadow: shadow ?? _getShadow(),
      ),
      child: child,
    );
  }

  EdgeInsetsGeometry _getPadding() {
    switch (size) {
      case NovaContainerSize.small:
        return const EdgeInsets.all(NovaSpacing.sm);
      case NovaContainerSize.medium:
        return const EdgeInsets.all(NovaSpacing.md);
      case NovaContainerSize.large:
        return const EdgeInsets.all(NovaSpacing.lg);
    }
  }

  double _getBorderRadius() {
    switch (size) {
      case NovaContainerSize.small:
        return NovaRadius.sm;
      case NovaContainerSize.medium:
        return NovaRadius.md;
      case NovaContainerSize.large:
        return NovaRadius.lg;
    }
  }

  double _getBorderWidth() {
    switch (size) {
      case NovaContainerSize.small:
        return 1.0;
      case NovaContainerSize.medium:
        return 1.5;
      case NovaContainerSize.large:
        return 2.0;
    }
  }

  Color _getBackgroundColor() {
    switch (variant) {
      case NovaContainerVariant.primary:
        return NovaColors.primary;
      case NovaContainerVariant.secondary:
        return NovaColors.secondary;
      case NovaContainerVariant.surface:
        return NovaColors.surface;
      case NovaContainerVariant.surfaceVariant:
        return NovaColors.neutral100;
      case NovaContainerVariant.transparent:
        return Colors.transparent;
    }
  }

  Color _getBorderColor() {
    switch (variant) {
      case NovaContainerVariant.primary:
        return NovaColors.primary.withValues(alpha: 0.2);
      case NovaContainerVariant.secondary:
        return NovaColors.secondary.withValues(alpha: 0.2);
      case NovaContainerVariant.surface:
      case NovaContainerVariant.surfaceVariant:
        return NovaColors.neutral200;
      case NovaContainerVariant.transparent:
        return Colors.transparent;
    }
  }

  List<BoxShadow> _getShadow() {
    switch (variant) {
      case NovaContainerVariant.primary:
      case NovaContainerVariant.secondary:
      case NovaContainerVariant.surface:
      case NovaContainerVariant.surfaceVariant:
        return [
          BoxShadow(
            color: NovaColors.neutral900.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ];
      case NovaContainerVariant.transparent:
        return [];
    }
  }
}

/// Visual style variants for the Nova container
enum NovaContainerVariant {
  /// Primary container style
  primary,

  /// Secondary container style
  secondary,

  /// Surface container style
  surface,

  /// Surface variant container style
  surfaceVariant,

  /// Transparent container style
  transparent,
}

/// Size variants for the Nova container
enum NovaContainerSize {
  /// Small container size
  small,

  /// Medium container size
  medium,

  /// Large container size
  large,
} 