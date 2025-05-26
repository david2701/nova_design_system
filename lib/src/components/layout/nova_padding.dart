import 'package:flutter/material.dart';
import '../../tokens/spacing.dart';

/// A padding component for the Nova design system
class NovaPadding extends StatelessWidget {
  /// Creates a Nova padding
  const NovaPadding({
    super.key,
    required this.child,
    this.padding,
    this.variant = NovaPaddingVariant.standard,
    this.size = NovaPaddingSize.medium,
  });

  /// The child widget
  final Widget child;

  /// The padding to apply
  final EdgeInsetsGeometry? padding;

  /// The visual style variant of the padding
  final NovaPaddingVariant variant;

  /// The size of the padding
  final NovaPaddingSize size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? _getPadding(),
      child: child,
    );
  }

  EdgeInsetsGeometry _getPadding() {
    switch (variant) {
      case NovaPaddingVariant.standard:
        return _getStandardPadding();
      case NovaPaddingVariant.horizontal:
        return EdgeInsets.symmetric(horizontal: _getPaddingSize());
      case NovaPaddingVariant.vertical:
        return EdgeInsets.symmetric(vertical: _getPaddingSize());
    }
  }

  EdgeInsetsGeometry _getStandardPadding() {
    switch (size) {
      case NovaPaddingSize.small:
        return const EdgeInsets.all(NovaSpacing.sm);
      case NovaPaddingSize.medium:
        return const EdgeInsets.all(NovaSpacing.md);
      case NovaPaddingSize.large:
        return const EdgeInsets.all(NovaSpacing.lg);
    }
  }

  double _getPaddingSize() {
    switch (size) {
      case NovaPaddingSize.small:
        return NovaSpacing.sm;
      case NovaPaddingSize.medium:
        return NovaSpacing.md;
      case NovaPaddingSize.large:
        return NovaSpacing.lg;
    }
  }
}

/// Visual style variants for the Nova padding
enum NovaPaddingVariant {
  /// Standard padding on all sides
  standard,

  /// Padding only on horizontal sides
  horizontal,

  /// Padding only on vertical sides
  vertical,
}

/// Size variants for the Nova padding
enum NovaPaddingSize {
  /// Small padding size
  small,

  /// Medium padding size
  medium,

  /// Large padding size
  large,
} 