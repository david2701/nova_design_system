import 'package:flutter/material.dart';
import '../../tokens/colors.dart';
import '../../tokens/radius.dart';
import '../../tokens/spacing.dart';

/// A switch component for the Nova design system
class NovaSwitch extends StatelessWidget {
  /// Creates a Nova switch
  const NovaSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.variant = NovaSwitchVariant.primary,
    this.size = NovaSwitchSize.medium,
    this.isDisabled = false,
    this.label,
  });

  /// Whether the switch is on or off
  final bool value;

  /// Called when the user toggles the switch
  final ValueChanged<bool>? onChanged;

  /// The visual style variant of the switch
  final NovaSwitchVariant variant;

  /// The size of the switch
  final NovaSwitchSize size;

  /// Whether the switch is disabled
  final bool isDisabled;

  /// Optional label to display next to the switch
  final String? label;

  @override
  Widget build(BuildContext context) {
    final switchWidget = GestureDetector(
      onTap: isDisabled ? null : () => onChanged?.call(!value),
      child: Container(
        width: _getWidth(),
        height: _getHeight(),
        decoration: BoxDecoration(
          color: _getTrackColor(),
          borderRadius: BorderRadius.circular(NovaRadius.full),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              left: value ? _getThumbPosition() : 0,
              child: Container(
                width: _getThumbSize(),
                height: _getThumbSize(),
                margin: EdgeInsets.all(_getThumbMargin()),
                decoration: BoxDecoration(
                  color: _getThumbColor(),
                  borderRadius: BorderRadius.circular(NovaRadius.full),
                  boxShadow: [
                    BoxShadow(
                      color: NovaColors.neutral900.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

    if (label != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          switchWidget,
          SizedBox(width: NovaSpacing.sm),
          Text(
            label!,
            style: TextStyle(
              color: isDisabled ? NovaColors.neutral400 : NovaColors.textPrimary,
            ),
          ),
        ],
      );
    }

    return switchWidget;
  }

  Color _getTrackColor() {
    if (isDisabled) return NovaColors.neutral200;
    if (!value) return NovaColors.neutral300;
    
    switch (variant) {
      case NovaSwitchVariant.primary:
        return NovaColors.primary.withValues(alpha: 0.3);
      case NovaSwitchVariant.success:
        return NovaColors.success.withValues(alpha: 0.3);
      case NovaSwitchVariant.warning:
        return NovaColors.warning.withValues(alpha: 0.3);
      case NovaSwitchVariant.danger:
        return NovaColors.error.withValues(alpha: 0.3);
    }
  }

  Color _getThumbColor() {
    if (isDisabled) return NovaColors.neutral400;
    if (!value) return NovaColors.neutral500;
    
    switch (variant) {
      case NovaSwitchVariant.primary:
        return NovaColors.primary;
      case NovaSwitchVariant.success:
        return NovaColors.success;
      case NovaSwitchVariant.warning:
        return NovaColors.warning;
      case NovaSwitchVariant.danger:
        return NovaColors.error;
    }
  }

  double _getWidth() {
    switch (size) {
      case NovaSwitchSize.small:
        return 32;
      case NovaSwitchSize.medium:
        return 40;
      case NovaSwitchSize.large:
        return 48;
    }
  }

  double _getHeight() {
    switch (size) {
      case NovaSwitchSize.small:
        return 16;
      case NovaSwitchSize.medium:
        return 20;
      case NovaSwitchSize.large:
        return 24;
    }
  }

  double _getThumbSize() {
    switch (size) {
      case NovaSwitchSize.small:
        return 12;
      case NovaSwitchSize.medium:
        return 16;
      case NovaSwitchSize.large:
        return 20;
    }
  }

  double _getThumbMargin() {
    switch (size) {
      case NovaSwitchSize.small:
        return 2;
      case NovaSwitchSize.medium:
        return 2;
      case NovaSwitchSize.large:
        return 2;
    }
  }

  double _getThumbPosition() {
    return _getWidth() - _getThumbSize() - (_getThumbMargin() * 2);
  }
}

/// Visual style variants for the Nova switch
enum NovaSwitchVariant {
  /// Primary switch style
  primary,

  /// Success switch style
  success,

  /// Warning switch style
  warning,

  /// Danger switch style
  danger,
}

/// Size variants for the Nova switch
enum NovaSwitchSize {
  /// Small switch size
  small,

  /// Medium switch size
  medium,

  /// Large switch size
  large,
} 