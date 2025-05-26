import 'package:flutter/material.dart';
import '../../tokens/colors.dart';
import '../../tokens/radius.dart';

/// A skeleton component for the Nova design system
class NovaSkeleton extends StatefulWidget {
  /// Creates a Nova skeleton
  const NovaSkeleton({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.variant = NovaSkeletonVariant.primary,
    this.size = NovaSkeletonSize.medium,
  });

  /// The width of the skeleton
  final double? width;

  /// The height of the skeleton
  final double? height;

  /// The border radius of the skeleton
  final double? borderRadius;

  /// The visual style variant of the skeleton
  final NovaSkeletonVariant variant;

  /// The size of the skeleton
  final NovaSkeletonSize size;

  @override
  State<NovaSkeleton> createState() => _NovaSkeletonState();
}

class _NovaSkeletonState extends State<NovaSkeleton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();

    _animation = Tween<double>(begin: -1.0, end: 2.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height ?? _getHeight(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              widget.borderRadius ?? _getBorderRadius(),
            ),
            gradient: LinearGradient(
              begin: Alignment(_animation.value - 1, 0),
              end: Alignment(_animation.value, 0),
              colors: [
                _getBaseColor(),
                _getHighlightColor(),
                _getBaseColor(),
              ],
              stops: const [0.0, 0.5, 1.0],
            ),
          ),
        );
      },
    );
  }

  double _getHeight() {
    switch (widget.size) {
      case NovaSkeletonSize.small:
        return 16.0;
      case NovaSkeletonSize.medium:
        return 24.0;
    }
  }

  double _getBorderRadius() {
    switch (widget.size) {
      case NovaSkeletonSize.small:
        return NovaRadius.sm;
      case NovaSkeletonSize.medium:
        return NovaRadius.md;
    }
  }

  Color _getBaseColor() {
    switch (widget.variant) {
      case NovaSkeletonVariant.primary:
        return NovaColors.primary.withValues(alpha: 0.1);
      case NovaSkeletonVariant.secondary:
        return NovaColors.secondary.withValues(alpha: 0.1);
      case NovaSkeletonVariant.surface:
        return NovaColors.neutral100;
      case NovaSkeletonVariant.transparent:
        return Colors.transparent;
    }
  }

  Color _getHighlightColor() {
    switch (widget.variant) {
      case NovaSkeletonVariant.primary:
        return NovaColors.primary.withValues(alpha: 0.2);
      case NovaSkeletonVariant.secondary:
        return NovaColors.secondary.withValues(alpha: 0.2);
      case NovaSkeletonVariant.surface:
        return NovaColors.neutral200;
      case NovaSkeletonVariant.transparent:
        return Colors.transparent;
    }
  }
}

/// Visual style variants for the Nova skeleton
enum NovaSkeletonVariant {
  /// Primary skeleton style
  primary,

  /// Secondary skeleton style
  secondary,

  /// Surface skeleton style
  surface,

  /// Transparent skeleton style
  transparent,
}

/// Size variants for the Nova skeleton
enum NovaSkeletonSize {
  /// Small skeleton size
  small,

  /// Medium skeleton size
  medium,
} 