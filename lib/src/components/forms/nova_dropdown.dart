import 'package:flutter/material.dart';
import '../../tokens/colors.dart';
import '../../tokens/radius.dart';
import '../../tokens/spacing.dart';
import '../../tokens/typography.dart';

/// A dropdown component for the Nova design system
class NovaDropdown<T> extends StatelessWidget {
  /// Creates a Nova dropdown
  const NovaDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    this.variant = NovaDropdownVariant.outlined,
    this.size = NovaDropdownSize.medium,
    this.isDisabled = false,
    this.isLoading = false,
    this.hintText,
    this.labelText,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
  });

  /// The currently selected value
  final T? value;

  /// The list of items to display in the dropdown
  final List<DropdownMenuItem<T>> items;

  /// Called when the dropdown value changes
  final ValueChanged<T?>? onChanged;

  /// The visual style variant of the dropdown
  final NovaDropdownVariant variant;

  /// The size of the dropdown
  final NovaDropdownSize size;

  /// Whether the dropdown is disabled
  final bool isDisabled;

  /// Whether the dropdown is in a loading state
  final bool isLoading;

  /// Optional hint text to display when no value is selected
  final String? hintText;

  /// Optional label text to display above the dropdown
  final String? labelText;

  /// Optional helper text to display below the dropdown
  final String? helperText;

  /// Optional error text to display below the dropdown
  final String? errorText;

  /// Optional icon to display before the dropdown value
  final IconData? prefixIcon;

  /// Optional icon to display after the dropdown value
  final IconData? suffixIcon;

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
        Container(
          decoration: BoxDecoration(
            color: _getBackgroundColor(),
            borderRadius: BorderRadius.circular(NovaRadius.md),
            border: Border.all(
              color: _getBorderColor(),
              width: 1,
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              value: value,
              items: items,
              onChanged: isDisabled || isLoading ? null : onChanged,
              hint: hintText != null
                  ? Text(
                      hintText!,
                      style: _getHintStyle(),
                    )
                  : null,
              icon: _buildSuffixIcon(),
              isExpanded: true,
              dropdownColor: NovaColors.background,
              padding: _getPadding(),
              style: _getTextStyle(),
              borderRadius: BorderRadius.circular(NovaRadius.md),
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

  Widget _buildSuffixIcon() {
    if (isLoading) {
      return SizedBox(
        width: _getIconSize(),
        height: _getIconSize(),
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(NovaColors.primary),
        ),
      );
    }

    if (suffixIcon != null) {
      return Icon(
        suffixIcon,
        size: _getIconSize(),
        color: _getIconColor(),
      );
    }

    return Icon(
      Icons.arrow_drop_down,
      size: _getIconSize(),
      color: _getIconColor(),
    );
  }

  Color _getBackgroundColor() {
    if (isDisabled) {
      return NovaColors.neutral100;
    }
    switch (variant) {
      case NovaDropdownVariant.outlined:
        return NovaColors.background;
      case NovaDropdownVariant.filled:
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
    final baseStyle = size == NovaDropdownSize.small
        ? NovaTypography.labelSmall
        : NovaTypography.labelMedium;

    return baseStyle.copyWith(
      color: isDisabled ? NovaColors.neutral400 : NovaColors.textPrimary,
    );
  }

  TextStyle _getTextStyle() {
    final baseStyle = size == NovaDropdownSize.small
        ? NovaTypography.bodySmall
        : NovaTypography.bodyMedium;

    return baseStyle.copyWith(
      color: isDisabled ? NovaColors.neutral400 : NovaColors.textPrimary,
    );
  }

  TextStyle _getHintStyle() {
    final baseStyle = size == NovaDropdownSize.small
        ? NovaTypography.bodySmall
        : NovaTypography.bodyMedium;

    return baseStyle.copyWith(
      color: NovaColors.neutral500,
    );
  }

  TextStyle _getHelperStyle(bool isError) {
    final baseStyle = size == NovaDropdownSize.small
        ? NovaTypography.labelSmall
        : NovaTypography.labelMedium;

    return baseStyle.copyWith(
      color: isError ? NovaColors.error : NovaColors.neutral500,
    );
  }

  EdgeInsets _getPadding() {
    final horizontal = size == NovaDropdownSize.small
        ? NovaSpacing.sm
        : NovaSpacing.md;
    final vertical = size == NovaDropdownSize.small
        ? NovaSpacing.xs
        : NovaSpacing.sm;

    return EdgeInsets.symmetric(
      horizontal: horizontal,
      vertical: vertical,
    );
  }

  double _getIconSize() {
    switch (size) {
      case NovaDropdownSize.small:
        return 16;
      case NovaDropdownSize.medium:
        return 20;
    }
  }
}

/// Visual style variants for the Nova dropdown
enum NovaDropdownVariant {
  /// Outlined dropdown style
  outlined,

  /// Filled dropdown style
  filled,
}

/// Size variants for the Nova dropdown
enum NovaDropdownSize {
  /// Small dropdown size
  small,

  /// Medium dropdown size
  medium,
} 