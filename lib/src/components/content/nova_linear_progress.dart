import 'package:flutter/material.dart';
import 'package:nova_design_system/nova_design_system.dart';

enum NovaLinearProgressVariant {
  primary,
  secondary,
  success,
  warning,
  error,
  info
}

enum NovaLinearProgressSize {
  small,
  medium,
  large
}

class NovaLinearProgress extends StatelessWidget {
  final double value;
  final double? minHeight;
  final NovaLinearProgressVariant variant;
  final NovaLinearProgressSize size;
  final bool showValue;
  final bool indeterminate;
  final String? label;
  final Color? backgroundColor;
  final Color? valueColor;
  final BorderRadius? borderRadius;

  const NovaLinearProgress({
    super.key,
    this.value = 0.0,
    this.minHeight,
    this.variant = NovaLinearProgressVariant.primary,
    this.size = NovaLinearProgressSize.medium,
    this.showValue = false,
    this.indeterminate = false,
    this.label,
    this.backgroundColor,
    this.valueColor,
    this.borderRadius,
  }) : assert(value >= 0.0 && value <= 1.0 || indeterminate);

  double _getHeight() {
    switch (size) {
      case NovaLinearProgressSize.small:
        return 4.0;
      case NovaLinearProgressSize.medium:
        return 8.0;
      case NovaLinearProgressSize.large:
        return 12.0;
    }
  }

  Color _getBackgroundColor() {
    return backgroundColor ?? 
      NovaColors.neutral200.withValues(alpha: 0.5);
  }

  Color _getValueColor() {
    if (valueColor != null) return valueColor!;
    
    switch (variant) {
      case NovaLinearProgressVariant.primary:
        return NovaColors.primary;
      case NovaLinearProgressVariant.secondary:
        return NovaColors.secondary;
      case NovaLinearProgressVariant.success:
        return NovaColors.success;
      case NovaLinearProgressVariant.warning:
        return NovaColors.warning;
      case NovaLinearProgressVariant.error:
        return NovaColors.error;
      case NovaLinearProgressVariant.info:
        return NovaColors.info;
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = minHeight ?? _getHeight();
    final progressColor = _getValueColor();
    final bgColor = _getBackgroundColor();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: NovaColors.neutral700,
            ),
          ),
          const SizedBox(height: NovaSpacing.xs),
        ],
        Stack(
          children: [
            Container(
              height: height,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: borderRadius ?? BorderRadius.circular(height / 2),
              ),
            ),
            if (indeterminate)
              LinearProgressIndicator(
                backgroundColor: Colors.transparent,
                valueColor: AlwaysStoppedAnimation<Color>(progressColor),
                minHeight: height,
                borderRadius: borderRadius ?? BorderRadius.circular(height / 2),
              )
            else
              FractionallySizedBox(
                widthFactor: value,
                child: Container(
                  height: height,
                  decoration: BoxDecoration(
                    color: progressColor,
                    borderRadius: borderRadius ?? BorderRadius.circular(height / 2),
                  ),
                ),
              ),
          ],
        ),
        if (showValue && !indeterminate) ...[
          const SizedBox(height: NovaSpacing.xs),
          Text(
            '${(value * 100).toInt()}%',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: NovaColors.neutral700,
            ),
          ),
        ],
      ],
    );
  }
} 