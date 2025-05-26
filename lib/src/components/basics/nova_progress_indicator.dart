import 'package:flutter/material.dart';
import '../../tokens/colors.dart';
import '../../tokens/radius.dart';
import '../../tokens/spacing.dart';

/// A progress indicator component for the Nova design system
class NovaProgressIndicator extends StatelessWidget {
  /// Creates a Nova progress indicator
  const NovaProgressIndicator({
    super.key,
    this.value,
    this.variant = NovaProgressIndicatorVariant.primary,
    this.size = NovaProgressIndicatorSize.medium,
    this.label,
    this.showValue = false,
  });

  /// The current progress value between 0.0 and 1.0
  final double? value;

  /// The visual style variant of the progress indicator
  final NovaProgressIndicatorVariant variant;

  /// The size of the progress indicator
  final NovaProgressIndicatorSize size;

  /// Optional label to display above the progress indicator
  final String? label;

  /// Whether to show the current value as a percentage
  final bool showValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null || showValue) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (label != null)
                Text(
                  label!,
                  style: TextStyle(
                    color: NovaColors.neutral700,
                  ),
                ),
              if (showValue && value != null)
                Text(
                  '${(value! * 100).toInt()}%',
                  style: TextStyle(
                    color: NovaColors.neutral700,
                  ),
                ),
            ],
          ),
          SizedBox(height: NovaSpacing.xs),
        ],
        if (value != null)
          _buildDeterminateProgress()
        else
          _buildIndeterminateProgress(),
      ],
    );
  }

  Widget _buildDeterminateProgress() {
    return Container(
      height: _getHeight(),
      decoration: BoxDecoration(
        color: NovaColors.neutral200,
        borderRadius: BorderRadius.circular(NovaRadius.full),
      ),
      child: Stack(
        children: [
          FractionallySizedBox(
            widthFactor: value,
            child: Container(
              decoration: BoxDecoration(
                color: _getColor(),
                borderRadius: BorderRadius.circular(NovaRadius.full),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIndeterminateProgress() {
    return Container(
      height: _getHeight(),
      decoration: BoxDecoration(
        color: NovaColors.neutral200,
        borderRadius: BorderRadius.circular(NovaRadius.full),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(NovaRadius.full),
        child: LinearProgressIndicator(
          backgroundColor: Colors.transparent,
          valueColor: AlwaysStoppedAnimation<Color>(_getColor()),
        ),
      ),
    );
  }

  Color _getColor() {
    switch (variant) {
      case NovaProgressIndicatorVariant.primary:
        return NovaColors.primary;
      case NovaProgressIndicatorVariant.success:
        return NovaColors.success;
      case NovaProgressIndicatorVariant.warning:
        return NovaColors.warning;
      case NovaProgressIndicatorVariant.danger:
        return NovaColors.error;
    }
  }

  double _getHeight() {
    switch (size) {
      case NovaProgressIndicatorSize.small:
        return 4;
      case NovaProgressIndicatorSize.medium:
        return 8;
      case NovaProgressIndicatorSize.large:
        return 12;
    }
  }
}

/// Visual style variants for the Nova progress indicator
enum NovaProgressIndicatorVariant {
  /// Primary progress indicator style
  primary,

  /// Success progress indicator style
  success,

  /// Warning progress indicator style
  warning,

  /// Danger progress indicator style
  danger,
}

/// Size variants for the Nova progress indicator
enum NovaProgressIndicatorSize {
  /// Small progress indicator size
  small,

  /// Medium progress indicator size
  medium,

  /// Large progress indicator size
  large,
} 