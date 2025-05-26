import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../tokens/colors.dart';
import '../../tokens/radius.dart';
import '../../tokens/spacing.dart';
import '../../tokens/typography.dart';

/// A date picker component for the Nova design system
class NovaDatePicker extends StatelessWidget {
  /// Creates a Nova date picker
  const NovaDatePicker({
    super.key,
    required this.value,
    required this.onChanged,
    this.variant = NovaDatePickerVariant.outlined,
    this.size = NovaDatePickerSize.medium,
    this.isDisabled = false,
    this.isLoading = false,
    this.hintText,
    this.labelText,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.firstDate,
    this.lastDate,
    this.initialDate,
    this.selectableDayPredicate,
    this.cancelText,
    this.confirmText,
    this.helpText,
    this.locale,
    this.initialEntryMode = DatePickerEntryMode.calendar,
    this.builder,
  });

  /// The currently selected date
  final DateTime? value;

  /// Called when the date changes
  final ValueChanged<DateTime?>? onChanged;

  /// The visual style variant of the date picker
  final NovaDatePickerVariant variant;

  /// The size of the date picker
  final NovaDatePickerSize size;

  /// Whether the date picker is disabled
  final bool isDisabled;

  /// Whether the date picker is in a loading state
  final bool isLoading;

  /// Optional hint text to display when no date is selected
  final String? hintText;

  /// Optional label text to display above the date picker
  final String? labelText;

  /// Optional helper text to display below the date picker
  final String? helperText;

  /// Optional error text to display below the date picker
  final String? errorText;

  /// Optional icon to display before the date value
  final IconData? prefixIcon;

  /// Optional icon to display after the date value
  final IconData? suffixIcon;

  /// The earliest date that can be selected
  final DateTime? firstDate;

  /// The latest date that can be selected
  final DateTime? lastDate;

  /// The initial date to be selected
  final DateTime? initialDate;

  /// Function to determine if a day can be selected
  final SelectableDayPredicate? selectableDayPredicate;

  /// Text for the cancel button
  final String? cancelText;

  /// Text for the confirm button
  final String? confirmText;

  /// Text to display at the top of the date picker
  final String? helpText;

  /// The locale to use for the date picker
  final Locale? locale;

  /// The initial entry mode of the date picker
  final DatePickerEntryMode initialEntryMode;

  /// Builder function to customize the date picker dialog
  final TransitionBuilder? builder;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (labelText != null) ...[
          Text(
            labelText!,
            style: _getLabelStyle(),
          ),
          SizedBox(height: NovaSpacing.xs),
        ],
        InkWell(
          onTap: isDisabled || isLoading ? null : () => _showDatePicker(context),
          borderRadius: BorderRadius.circular(NovaRadius.md),
          child: Container(
            decoration: BoxDecoration(
              color: _getBackgroundColor(),
              borderRadius: BorderRadius.circular(NovaRadius.md),
              border: Border.all(
                color: _getBorderColor(),
                width: 1,
              ),
            ),
            padding: _getPadding(),
            child: Row(
              children: [
                if (prefixIcon != null) ...[
                  Icon(
                    prefixIcon,
                    size: _getIconSize(),
                    color: _getIconColor(),
                  ),
                  SizedBox(width: NovaSpacing.sm),
                ],
                Expanded(
                  child: Text(
                    value != null
                        ? DateFormat.yMMMd().format(value!)
                        : hintText ?? '',
                    style: value != null ? _getTextStyle() : _getHintStyle(),
                  ),
                ),
                if (isLoading)
                  SizedBox(
                    width: _getIconSize(),
                    height: _getIconSize(),
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(NovaColors.primary),
                    ),
                  )
                else if (suffixIcon != null)
                  Icon(
                    suffixIcon,
                    size: _getIconSize(),
                    color: _getIconColor(),
                  )
                else
                  Icon(
                    Icons.calendar_today,
                    size: _getIconSize(),
                    color: _getIconColor(),
                  ),
              ],
            ),
          ),
        ),
        if (helperText != null || errorText != null) ...[
          SizedBox(height: NovaSpacing.xs),
          Text(
            errorText ?? helperText!,
            style: _getHelperStyle(errorText != null),
          ),
        ],
      ],
    );
  }

  Future<void> _showDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: value ?? initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(1900),
      lastDate: lastDate ?? DateTime(2100),
      selectableDayPredicate: selectableDayPredicate,
      cancelText: cancelText,
      confirmText: confirmText,
      helpText: helpText,
      locale: locale,
      initialEntryMode: initialEntryMode,
      builder: builder,
    );

    if (picked != null && picked != value) {
      onChanged?.call(picked);
    }
  }

  Color _getBackgroundColor() {
    if (isDisabled) {
      return NovaColors.neutral100;
    }
    switch (variant) {
      case NovaDatePickerVariant.outlined:
        return NovaColors.background;
      case NovaDatePickerVariant.filled:
        return NovaColors.neutral100;
    }
  }

  Color _getBorderColor() {
    if (isDisabled) {
      return NovaColors.neutral300;
    }
    if (errorText != null) {
      return NovaColors.error;
    }
    return NovaColors.neutral400;
  }

  Color _getIconColor() {
    if (isDisabled) {
      return NovaColors.neutral400;
    }
    return NovaColors.neutral600;
  }

  TextStyle _getLabelStyle() {
    final baseStyle = size == NovaDatePickerSize.small
        ? NovaTypography.labelSmall
        : NovaTypography.labelMedium;

    return baseStyle.copyWith(
      color: isDisabled ? NovaColors.neutral400 : NovaColors.textPrimary,
    );
  }

  TextStyle _getTextStyle() {
    final baseStyle = size == NovaDatePickerSize.small
        ? NovaTypography.bodySmall
        : NovaTypography.bodyMedium;

    return baseStyle.copyWith(
      color: isDisabled ? NovaColors.neutral400 : NovaColors.textPrimary,
    );
  }

  TextStyle _getHintStyle() {
    final baseStyle = size == NovaDatePickerSize.small
        ? NovaTypography.bodySmall
        : NovaTypography.bodyMedium;

    return baseStyle.copyWith(
      color: NovaColors.neutral500,
    );
  }

  TextStyle _getHelperStyle(bool isError) {
    final baseStyle = size == NovaDatePickerSize.small
        ? NovaTypography.labelSmall
        : NovaTypography.labelMedium;

    return baseStyle.copyWith(
      color: isError ? NovaColors.error : NovaColors.neutral500,
    );
  }

  EdgeInsets _getPadding() {
    final horizontal = size == NovaDatePickerSize.small
        ? NovaSpacing.sm
        : NovaSpacing.md;
    final vertical = size == NovaDatePickerSize.small
        ? NovaSpacing.xs
        : NovaSpacing.sm;

    return EdgeInsets.symmetric(
      horizontal: horizontal,
      vertical: vertical,
    );
  }

  double _getIconSize() {
    switch (size) {
      case NovaDatePickerSize.small:
        return 16;
      case NovaDatePickerSize.medium:
        return 20;
    }
  }
}

/// Visual style variants for the Nova date picker
enum NovaDatePickerVariant {
  /// Outlined date picker style
  outlined,

  /// Filled date picker style
  filled,
}

/// Size variants for the Nova date picker
enum NovaDatePickerSize {
  /// Small date picker size
  small,

  /// Medium date picker size
  medium,
} 