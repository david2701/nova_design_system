import 'package:flutter/material.dart';
import '../../tokens/colors.dart';
import '../../tokens/spacing.dart';
import '../../tokens/typography.dart';

/// A segmented button component for the Nova design system
class NovaSegmentedButton<T> extends StatelessWidget {
  /// Creates a Nova segmented button
  const NovaSegmentedButton({
    super.key,
    required this.segments,
    required this.selected,
    required this.onSelectionChanged,
    this.multiSelectionEnabled = false,
    this.showSelectedIcon = true,
    this.emptySelectionAllowed = false,
    this.style,
    this.variant = NovaSegmentedButtonVariant.primary,
    this.size = NovaSegmentedButtonSize.medium,
  });

  /// The segments to display in the segmented button
  final List<ButtonSegment<T>> segments;

  /// The selected segments
  final Set<T> selected;

  /// Called when the selection changes
  final void Function(Set<T>) onSelectionChanged;

  /// Whether multiple segments can be selected
  final bool multiSelectionEnabled;

  /// Whether to show the selected icon
  final bool showSelectedIcon;

  /// Whether empty selection is allowed
  final bool emptySelectionAllowed;

  /// The style of the segmented button
  final ButtonStyle? style;

  /// The visual style variant of the segmented button
  final NovaSegmentedButtonVariant variant;

  /// The size of the segmented button
  final NovaSegmentedButtonSize size;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<T>(
      segments: segments,
      selected: selected,
      onSelectionChanged: onSelectionChanged,
      multiSelectionEnabled: multiSelectionEnabled,
      showSelectedIcon: showSelectedIcon,
      emptySelectionAllowed: emptySelectionAllowed,
      style: style ?? _getButtonStyle(),
    );
  }

  ButtonStyle _getButtonStyle() {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (states) => _getBackgroundColor(states),
      ),
      foregroundColor: MaterialStateProperty.resolveWith<Color>(
        (states) => _getForegroundColor(states),
      ),
      side: MaterialStateProperty.resolveWith<BorderSide>(
        (states) => _getBorderSide(states),
      ),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        _getPadding(),
      ),
      textStyle: MaterialStateProperty.all<TextStyle>(
        _getTextStyle(),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            size == NovaSegmentedButtonSize.small ? 8 : 12,
          ),
        ),
      ),
    );
  }

  Color _getBackgroundColor(Set<MaterialState> states) {
    if (states.contains(MaterialState.selected)) {
      switch (variant) {
        case NovaSegmentedButtonVariant.primary:
          return NovaColors.primary;
        case NovaSegmentedButtonVariant.secondary:
          return NovaColors.secondary;
        case NovaSegmentedButtonVariant.surface:
          return NovaColors.surface;
        case NovaSegmentedButtonVariant.transparent:
          return Colors.transparent;
      }
    }

    switch (variant) {
      case NovaSegmentedButtonVariant.primary:
      case NovaSegmentedButtonVariant.secondary:
        return NovaColors.surface;
      case NovaSegmentedButtonVariant.surface:
      case NovaSegmentedButtonVariant.transparent:
        return Colors.transparent;
    }
  }

  Color _getForegroundColor(Set<MaterialState> states) {
    if (states.contains(MaterialState.selected)) {
      switch (variant) {
        case NovaSegmentedButtonVariant.primary:
        case NovaSegmentedButtonVariant.secondary:
          return NovaColors.textInverse;
        case NovaSegmentedButtonVariant.surface:
        case NovaSegmentedButtonVariant.transparent:
          return NovaColors.primary;
      }
    }

    switch (variant) {
      case NovaSegmentedButtonVariant.primary:
      case NovaSegmentedButtonVariant.secondary:
        return NovaColors.textInverse.withOpacity(0.6);
      case NovaSegmentedButtonVariant.surface:
      case NovaSegmentedButtonVariant.transparent:
        return NovaColors.neutral500;
    }
  }

  BorderSide _getBorderSide(Set<MaterialState> states) {
    if (states.contains(MaterialState.selected)) {
      switch (variant) {
        case NovaSegmentedButtonVariant.primary:
          return BorderSide(color: NovaColors.primary);
        case NovaSegmentedButtonVariant.secondary:
          return BorderSide(color: NovaColors.secondary);
        case NovaSegmentedButtonVariant.surface:
        case NovaSegmentedButtonVariant.transparent:
          return BorderSide(color: NovaColors.primary);
      }
    }

    switch (variant) {
      case NovaSegmentedButtonVariant.primary:
      case NovaSegmentedButtonVariant.secondary:
        return BorderSide(color: NovaColors.textInverse.withOpacity(0.1));
      case NovaSegmentedButtonVariant.surface:
      case NovaSegmentedButtonVariant.transparent:
        return BorderSide(color: NovaColors.neutral200);
    }
  }

  EdgeInsetsGeometry _getPadding() {
    switch (size) {
      case NovaSegmentedButtonSize.small:
        return const EdgeInsets.symmetric(
          horizontal: NovaSpacing.sm,
          vertical: NovaSpacing.xs,
        );
      case NovaSegmentedButtonSize.medium:
        return const EdgeInsets.symmetric(
          horizontal: NovaSpacing.md,
          vertical: NovaSpacing.sm,
        );
    }
  }

  TextStyle _getTextStyle() {
    final baseStyle = size == NovaSegmentedButtonSize.small
        ? NovaTypography.labelSmall
        : NovaTypography.labelMedium;

    return baseStyle;
  }
}

/// Visual style variants for the Nova segmented button
enum NovaSegmentedButtonVariant {
  /// Primary segmented button style
  primary,

  /// Secondary segmented button style
  secondary,

  /// Surface segmented button style
  surface,

  /// Transparent segmented button style
  transparent,
}

/// Size variants for the Nova segmented button
enum NovaSegmentedButtonSize {
  /// Small segmented button size
  small,

  /// Medium segmented button size
  medium,
} 