import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../tokens/colors.dart';
import '../../tokens/radius.dart';
import '../../tokens/spacing.dart';
import '../../tokens/typography.dart';

/// An OTP input component for the Nova design system
class NovaOtpInput extends StatelessWidget {
  /// Creates a Nova OTP input
  const NovaOtpInput({
    super.key,
    required this.length,
    this.onCompleted,
    this.onChanged,
    this.focusNode,
    this.autofocus = false,
    this.variant = NovaOtpInputVariant.outlined,
    this.size = NovaOtpInputSize.medium,
    this.isDisabled = false,
    this.isLoading = false,
    this.errorText,
  });

  /// The number of OTP digits
  final int length;

  /// Called when all digits are filled
  final ValueChanged<String>? onCompleted;

  /// Called when the OTP value changes
  final ValueChanged<String>? onChanged;

  /// The focus node for the OTP input
  final FocusNode? focusNode;

  /// Whether the OTP input should autofocus
  final bool autofocus;

  /// The visual style variant of the OTP input
  final NovaOtpInputVariant variant;

  /// The size of the OTP input
  final NovaOtpInputSize size;

  /// Whether the OTP input is disabled
  final bool isDisabled;

  /// Whether the OTP input is loading
  final bool isLoading;

  /// The error text to display below the OTP input
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            length,
            (index) => Padding(
              padding: EdgeInsets.only(
                right: index < length - 1 ? NovaSpacing.sm : 0,
              ),
              child: _OtpDigitField(
                index: index,
                length: length,
                onCompleted: onCompleted,
                onChanged: onChanged,
                focusNode: focusNode,
                autofocus: autofocus && index == 0,
                variant: variant,
                size: size,
                isDisabled: isDisabled,
                isLoading: isLoading,
              ),
            ),
          ),
        ),
        if (errorText != null) ...[
          const SizedBox(height: NovaSpacing.xs),
          Text(
            errorText!,
            style: _getErrorStyle(),
          ),
        ],
      ],
    );
  }

  TextStyle _getErrorStyle() {
    final baseStyle = size == NovaOtpInputSize.small
        ? NovaTypography.labelSmall
        : NovaTypography.labelMedium;

    return baseStyle.copyWith(
      color: NovaColors.error,
    );
  }
}

class _OtpDigitField extends StatelessWidget {
  const _OtpDigitField({
    required this.index,
    required this.length,
    this.onCompleted,
    this.onChanged,
    this.focusNode,
    this.autofocus = false,
    this.variant = NovaOtpInputVariant.outlined,
    this.size = NovaOtpInputSize.medium,
    this.isDisabled = false,
    this.isLoading = false,
  });

  final int index;
  final int length;
  final ValueChanged<String>? onCompleted;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;
  final bool autofocus;
  final NovaOtpInputVariant variant;
  final NovaOtpInputSize size;
  final bool isDisabled;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _getWidth(),
      height: _getHeight(),
      child: TextField(
        focusNode: focusNode,
        autofocus: autofocus,
        enabled: !isDisabled && !isLoading,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: _getTextStyle(),
        decoration: InputDecoration(
          counterText: '',
          filled: variant == NovaOtpInputVariant.filled,
          fillColor: _getBackgroundColor(),
          contentPadding: EdgeInsets.zero,
          border: _getBorder(),
          enabledBorder: _getBorder(),
          focusedBorder: _getFocusedBorder(),
          errorBorder: _getErrorBorder(),
          focusedErrorBorder: _getErrorBorder(),
          disabledBorder: _getDisabledBorder(),
        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        onChanged: (value) {
          if (value.isNotEmpty) {
            onChanged?.call(value);
            if (index < length - 1) {
              FocusScope.of(context).nextFocus();
            } else {
              onCompleted?.call(value);
            }
          }
        },
      ),
    );
  }

  TextStyle _getTextStyle() {
    final baseStyle = size == NovaOtpInputSize.small
        ? NovaTypography.bodySmall
        : NovaTypography.bodyMedium;

    return baseStyle.copyWith(
      color: isDisabled ? NovaColors.neutral400 : NovaColors.textPrimary,
    );
  }

  Color _getBackgroundColor() {
    if (isDisabled) return NovaColors.neutral100;
    if (variant == NovaOtpInputVariant.filled) return NovaColors.neutral100;
    return Colors.transparent;
  }

  InputBorder _getBorder() {
    final color = isDisabled ? NovaColors.neutral300 : NovaColors.neutral400;

    switch (variant) {
      case NovaOtpInputVariant.outlined:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(NovaRadius.md),
          borderSide: BorderSide(
            color: color,
            width: 1,
          ),
        );
      case NovaOtpInputVariant.filled:
        return UnderlineInputBorder(
          borderRadius: BorderRadius.circular(NovaRadius.md),
          borderSide: BorderSide(
            color: color,
            width: 1,
          ),
        );
    }
  }

  InputBorder _getFocusedBorder() {
    switch (variant) {
      case NovaOtpInputVariant.outlined:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(NovaRadius.md),
          borderSide: const BorderSide(
            color: NovaColors.primary,
            width: 2,
          ),
        );
      case NovaOtpInputVariant.filled:
        return UnderlineInputBorder(
          borderRadius: BorderRadius.circular(NovaRadius.md),
          borderSide: const BorderSide(
            color: NovaColors.primary,
            width: 2,
          ),
        );
    }
  }

  InputBorder _getErrorBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(NovaRadius.md),
      borderSide: const BorderSide(
        color: NovaColors.error,
        width: 1,
      ),
    );
  }

  InputBorder _getDisabledBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(NovaRadius.md),
      borderSide: const BorderSide(
        color: NovaColors.neutral300,
        width: 1,
      ),
    );
  }

  double _getWidth() {
    switch (size) {
      case NovaOtpInputSize.small:
        return 32;
      case NovaOtpInputSize.medium:
        return 40;
    }
  }

  double _getHeight() {
    switch (size) {
      case NovaOtpInputSize.small:
        return 32;
      case NovaOtpInputSize.medium:
        return 40;
    }
  }
}

/// Visual style variants for the Nova OTP input
enum NovaOtpInputVariant {
  /// Outlined OTP input style
  outlined,

  /// Filled OTP input style
  filled,
}

/// Size variants for the Nova OTP input
enum NovaOtpInputSize {
  /// Small OTP input size
  small,

  /// Medium OTP input size
  medium,
} 