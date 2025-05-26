import 'package:flutter/material.dart';
import '../../tokens/colors.dart';
import '../../tokens/spacing.dart';

/// A divider component for the Nova design system
class NovaDivider extends StatelessWidget {
  /// Creates a Nova divider
  const NovaDivider({
    super.key,
    this.variant = NovaDividerVariant.neutral,
    this.size = NovaDividerSize.medium,
    this.orientation = NovaDividerOrientation.horizontal,
    this.text,
  });

  /// The visual style variant of the divider
  final NovaDividerVariant variant;

  /// The size of the divider
  final NovaDividerSize size;

  /// The orientation of the divider
  final NovaDividerOrientation orientation;

  /// Optional text to display in the center of the divider
  final String? text;

  @override
  Widget build(BuildContext context) {
    if (text != null && orientation == NovaDividerOrientation.horizontal) {
      return Row(
        children: [
          Expanded(
            child: _buildLine(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: NovaSpacing.md),
            child: Text(
              text!,
              style: TextStyle(
                color: _getTextColor(),
              ),
            ),
          ),
          Expanded(
            child: _buildLine(),
          ),
        ],
      );
    }

    return _buildLine();
  }

  Widget _buildLine() {
    return Container(
      width: orientation == NovaDividerOrientation.horizontal ? double.infinity : _getThickness(),
      height: orientation == NovaDividerOrientation.horizontal ? _getThickness() : double.infinity,
      color: _getColor(),
    );
  }

  Color _getColor() {
    switch (variant) {
      case NovaDividerVariant.primary:
        return NovaColors.primary;
      case NovaDividerVariant.secondary:
        return NovaColors.secondary;
      case NovaDividerVariant.neutral:
        return NovaColors.neutral300;
    }
  }

  Color _getTextColor() {
    switch (variant) {
      case NovaDividerVariant.primary:
        return NovaColors.primary;
      case NovaDividerVariant.secondary:
        return NovaColors.secondary;
      case NovaDividerVariant.neutral:
        return NovaColors.neutral700;
    }
  }

  double _getThickness() {
    switch (size) {
      case NovaDividerSize.small:
        return 1;
      case NovaDividerSize.medium:
        return 2;
      case NovaDividerSize.large:
        return 4;
    }
  }
}

/// Visual style variants for the Nova divider
enum NovaDividerVariant {
  /// Primary divider style
  primary,

  /// Secondary divider style
  secondary,

  /// Neutral divider style
  neutral,
}

/// Size variants for the Nova divider
enum NovaDividerSize {
  /// Small divider size
  small,

  /// Medium divider size
  medium,

  /// Large divider size
  large,
}

/// Orientation variants for the Nova divider
enum NovaDividerOrientation {
  /// Horizontal divider orientation
  horizontal,

  /// Vertical divider orientation
  vertical,
} 