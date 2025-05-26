import 'package:flutter/material.dart';
import '../../tokens/colors.dart';
import '../../tokens/radius.dart';
import '../../tokens/spacing.dart';

/// A slider component for the Nova design system
class NovaSlider extends StatelessWidget {
  /// Creates a Nova slider
  const NovaSlider({
    super.key,
    required this.value,
    required this.onChanged,
    this.min = 0.0,
    this.max = 1.0,
    this.divisions,
    this.variant = NovaSliderVariant.primary,
    this.size = NovaSliderSize.medium,
    this.isDisabled = false,
    this.label,
    this.showValue = false,
  });

  /// The current value of the slider
  final double value;

  /// Called when the user selects a new value
  final ValueChanged<double>? onChanged;

  /// The minimum value the user can select
  final double min;

  /// The maximum value the user can select
  final double max;

  /// The number of discrete divisions
  final int? divisions;

  /// The visual style variant of the slider
  final NovaSliderVariant variant;

  /// The size of the slider
  final NovaSliderSize size;

  /// Whether the slider is disabled
  final bool isDisabled;

  /// Optional label to display above the slider
  final String? label;

  /// Whether to show the current value
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
                    color: isDisabled ? NovaColors.neutral400 : NovaColors.neutral700,
                  ),
                ),
              if (showValue)
                Text(
                  value.toStringAsFixed(divisions != null ? 0 : 1),
                  style: TextStyle(
                    color: isDisabled ? NovaColors.neutral400 : NovaColors.neutral700,
                  ),
                ),
            ],
          ),
          SizedBox(height: NovaSpacing.xs),
        ],
        SliderTheme(
          data: SliderThemeData(
            trackHeight: _getTrackHeight(),
            activeTrackColor: _getActiveTrackColor(),
            inactiveTrackColor: _getInactiveTrackColor(),
            thumbColor: _getThumbColor(),
            overlayColor: _getOverlayColor(),
            thumbShape: _NovaSliderThumbShape(
              size: _getThumbSize(),
            ),
            overlayShape: _NovaSliderOverlayShape(
              size: _getThumbSize() * 2,
            ),
            trackShape: _NovaSliderTrackShape(
              size: _getTrackHeight(),
            ),
          ),
          child: Slider(
            value: value,
            onChanged: isDisabled ? null : onChanged,
            min: min,
            max: max,
            divisions: divisions,
          ),
        ),
      ],
    );
  }

  Color _getActiveTrackColor() {
    if (isDisabled) return NovaColors.neutral300;
    
    switch (variant) {
      case NovaSliderVariant.primary:
        return NovaColors.primary;
      case NovaSliderVariant.success:
        return NovaColors.success;
      case NovaSliderVariant.warning:
        return NovaColors.warning;
      case NovaSliderVariant.danger:
        return NovaColors.error;
    }
  }

  Color _getInactiveTrackColor() {
    return isDisabled ? NovaColors.neutral200 : NovaColors.neutral300;
  }

  Color _getThumbColor() {
    if (isDisabled) return NovaColors.neutral400;
    
    switch (variant) {
      case NovaSliderVariant.primary:
        return NovaColors.primary;
      case NovaSliderVariant.success:
        return NovaColors.success;
      case NovaSliderVariant.warning:
        return NovaColors.warning;
      case NovaSliderVariant.danger:
        return NovaColors.error;
    }
  }

  Color _getOverlayColor() {
    return _getThumbColor().withValues(alpha: 0.1);
  }

  double _getTrackHeight() {
    switch (size) {
      case NovaSliderSize.small:
        return 2;
      case NovaSliderSize.medium:
        return 4;
      case NovaSliderSize.large:
        return 6;
    }
  }

  double _getThumbSize() {
    switch (size) {
      case NovaSliderSize.small:
        return 12;
      case NovaSliderSize.medium:
        return 16;
      case NovaSliderSize.large:
        return 20;
    }
  }
}

/// Visual style variants for the Nova slider
enum NovaSliderVariant {
  /// Primary slider style
  primary,

  /// Success slider style
  success,

  /// Warning slider style
  warning,

  /// Danger slider style
  danger,
}

/// Size variants for the Nova slider
enum NovaSliderSize {
  /// Small slider size
  small,

  /// Medium slider size
  medium,

  /// Large slider size
  large,
}

class _NovaSliderThumbShape extends SliderComponentShape {
  const _NovaSliderThumbShape({
    required this.size,
  });

  final double size;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(size, size);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final canvas = context.canvas;
    final paint = Paint()
      ..color = sliderTheme.thumbColor!
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, size / 2, paint);
  }
}

class _NovaSliderOverlayShape extends SliderComponentShape {
  const _NovaSliderOverlayShape({
    required this.size,
  });

  final double size;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(size, size);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final canvas = context.canvas;
    final paint = Paint()
      ..color = sliderTheme.overlayColor!
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, size / 2, paint);
  }
}

class _NovaSliderTrackShape extends SliderTrackShape {
  const _NovaSliderTrackShape({
    required this.size,
  });

  final double size;

  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = size;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight) / 2;
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required TextDirection textDirection,
    required Offset thumbCenter,
    Offset? secondaryOffset,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final canvas = context.canvas;
    final trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );

    final paint = Paint()
      ..color = sliderTheme.inactiveTrackColor!
      ..style = PaintingStyle.fill;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        trackRect,
        Radius.circular(NovaRadius.full),
      ),
      paint,
    );

    final activePaint = Paint()
      ..color = sliderTheme.activeTrackColor!
      ..style = PaintingStyle.fill;

    final activeRect = Rect.fromLTRB(
      trackRect.left,
      trackRect.top,
      thumbCenter.dx,
      trackRect.bottom,
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        activeRect,
        Radius.circular(NovaRadius.full),
      ),
      activePaint,
    );
  }
} 