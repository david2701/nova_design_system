import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../tokens/colors.dart';
import '../../tokens/radius.dart';
import '../../tokens/spacing.dart';
import '../../tokens/typography.dart';

/// A text field component for the Nova design system
class NovaTextField extends StatelessWidget {
  /// Creates a Nova text field
  const NovaTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.initialValue,
    this.hintText,
    this.labelText,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.style,
    this.strutStyle,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textDirection,
    this.readOnly = false,
    this.showCursor,
    this.autofocus = false,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.autocorrect = true,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.maxLengthEnforcement,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.onAppPrivateCommand,
    this.inputFormatters,
    this.enabled = true,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.selectionHeightStyle = BoxHeightStyle.tight,
    this.selectionWidthStyle = BoxWidthStyle.tight,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.enableInteractiveSelection = true,
    this.selectionControls,
    this.onTap,
    this.mouseCursor,
    this.buildCounter,
    this.scrollController,
    this.scrollPhysics,
    this.autofillHints,
    this.clipBehavior = Clip.hardEdge,
    this.restorationId,
    this.scribbleEnabled = true,
    this.enableIMEPersonalizedLearning = true,
    this.variant = NovaTextFieldVariant.outlined,
    this.size = NovaTextFieldSize.medium,
    this.isDisabled = false,
    this.isLoading = false,
  });

  /// The controller for the text field
  final TextEditingController? controller;

  /// The focus node for the text field
  final FocusNode? focusNode;

  /// The initial value for the text field
  final String? initialValue;

  /// The hint text to display when the text field is empty
  final String? hintText;

  /// The label text to display above the text field
  final String? labelText;

  /// The helper text to display below the text field
  final String? helperText;

  /// The error text to display below the text field
  final String? errorText;

  /// The icon to display at the start of the text field
  final Widget? prefixIcon;

  /// The icon to display at the end of the text field
  final Widget? suffixIcon;

  /// The type of keyboard to display
  final TextInputType? keyboardType;

  /// The action to perform when the user presses the action button
  final TextInputAction? textInputAction;

  /// The capitalization mode for the text
  final TextCapitalization textCapitalization;

  /// The style for the text
  final TextStyle? style;

  /// The strut style for the text
  final StrutStyle? strutStyle;

  /// The alignment for the text
  final TextAlign textAlign;

  /// The vertical alignment for the text
  final TextAlignVertical? textAlignVertical;

  /// The direction for the text
  final TextDirection? textDirection;

  /// Whether the text field is read-only
  final bool readOnly;

  /// Whether to show the cursor
  final bool? showCursor;

  /// Whether the text field should autofocus
  final bool autofocus;

  /// The character to use for obscuring text
  final String obscuringCharacter;

  /// Whether the text should be obscured
  final bool obscureText;

  /// Whether to enable autocorrect
  final bool autocorrect;

  /// The type of smart dashes to use
  final SmartDashesType? smartDashesType;

  /// The type of smart quotes to use
  final SmartQuotesType? smartQuotesType;

  /// Whether to enable suggestions
  final bool enableSuggestions;

  /// The maximum number of lines for the text field
  final int? maxLines;

  /// The minimum number of lines for the text field
  final int? minLines;

  /// Whether the text field should expand to fill the available space
  final bool expands;

  /// The maximum length of the text
  final int? maxLength;

  /// The enforcement for the maximum length
  final MaxLengthEnforcement? maxLengthEnforcement;

  /// Called when the text changes
  final ValueChanged<String>? onChanged;

  /// Called when the user finishes editing
  final VoidCallback? onEditingComplete;

  /// Called when the user submits the text
  final ValueChanged<String>? onSubmitted;

  /// Called when the user performs a private command
  final AppPrivateCommandCallback? onAppPrivateCommand;

  /// The input formatters to apply to the text
  final List<TextInputFormatter>? inputFormatters;

  /// Whether the text field is enabled
  final bool enabled;

  /// The width of the cursor
  final double cursorWidth;

  /// The height of the cursor
  final double? cursorHeight;

  /// The radius of the cursor
  final Radius? cursorRadius;

  /// The color of the cursor
  final Color? cursorColor;

  /// The height style for the selection
  final BoxHeightStyle selectionHeightStyle;

  /// The width style for the selection
  final BoxWidthStyle selectionWidthStyle;

  /// The appearance of the keyboard
  final Brightness? keyboardAppearance;

  /// The padding to apply when scrolling
  final EdgeInsets scrollPadding;

  /// Whether to enable interactive selection
  final bool enableInteractiveSelection;

  /// The controls for the selection
  final TextSelectionControls? selectionControls;

  /// Called when the text field is tapped
  final GestureTapCallback? onTap;

  /// The cursor to display when hovering over the text field
  final MouseCursor? mouseCursor;

  /// The builder for the counter
  final InputCounterWidgetBuilder? buildCounter;

  /// The controller for the scroll view
  final ScrollController? scrollController;

  /// The physics for the scroll view
  final ScrollPhysics? scrollPhysics;

  /// The hints for autofill
  final Iterable<String>? autofillHints;

  /// The clip behavior for the text field
  final Clip clipBehavior;

  /// The restoration ID for the text field
  final String? restorationId;

  /// Whether to enable scribble
  final bool scribbleEnabled;

  /// Whether to enable IME personalized learning
  final bool enableIMEPersonalizedLearning;

  /// The visual style variant of the text field
  final NovaTextFieldVariant variant;

  /// The size of the text field
  final NovaTextFieldSize size;

  /// Whether the text field is disabled
  final bool isDisabled;

  /// Whether the text field is loading
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final hasError = errorText != null;
    final isEnabled = enabled && !isDisabled && !isLoading;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (labelText != null) ...[
          Text(
            labelText!,
            style: _getLabelStyle(hasError),
          ),
          const SizedBox(height: NovaSpacing.xs),
        ],
        TextField(
          controller: controller,
          focusNode: focusNode,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          textCapitalization: textCapitalization,
          style: _getTextStyle(),
          strutStyle: strutStyle,
          textAlign: textAlign,
          textAlignVertical: textAlignVertical,
          textDirection: textDirection,
          readOnly: readOnly,
          showCursor: showCursor,
          autofocus: autofocus,
          obscuringCharacter: obscuringCharacter,
          obscureText: obscureText,
          autocorrect: autocorrect,
          smartDashesType: smartDashesType,
          smartQuotesType: smartQuotesType,
          enableSuggestions: enableSuggestions,
          maxLines: maxLines,
          minLines: minLines,
          expands: expands,
          maxLength: maxLength,
          maxLengthEnforcement: maxLengthEnforcement,
          onChanged: onChanged,
          onEditingComplete: onEditingComplete,
          onSubmitted: onSubmitted,
          onAppPrivateCommand: onAppPrivateCommand,
          inputFormatters: inputFormatters,
          enabled: isEnabled,
          cursorWidth: cursorWidth,
          cursorHeight: cursorHeight,
          cursorRadius: cursorRadius,
          cursorColor: cursorColor ?? NovaColors.primary,
          selectionHeightStyle: selectionHeightStyle,
          selectionWidthStyle: selectionWidthStyle,
          keyboardAppearance: keyboardAppearance,
          scrollPadding: scrollPadding,
          enableInteractiveSelection: enableInteractiveSelection,
          selectionControls: selectionControls,
          onTap: onTap,
          mouseCursor: mouseCursor,
          buildCounter: buildCounter,
          scrollController: scrollController,
          scrollPhysics: scrollPhysics,
          autofillHints: autofillHints,
          clipBehavior: clipBehavior,
          restorationId: restorationId,
          stylusHandwritingEnabled: scribbleEnabled,
          enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
          decoration: InputDecoration(
            hintText: hintText,
            helperText: helperText,
            errorText: errorText,
            prefixIcon: prefixIcon,
            suffixIcon: isLoading
                ? SizedBox(
                    width: _getIconSize(),
                    height: _getIconSize(),
                    child: const CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        NovaColors.primary,
                      ),
                    ),
                  )
                : suffixIcon,
            filled: variant == NovaTextFieldVariant.filled,
            fillColor: _getBackgroundColor(),
            contentPadding: _getContentPadding(),
            border: _getBorder(hasError),
            enabledBorder: _getBorder(hasError),
            focusedBorder: _getFocusedBorder(hasError),
            errorBorder: _getErrorBorder(),
            focusedErrorBorder: _getErrorBorder(),
            disabledBorder: _getDisabledBorder(),
            errorStyle: _getErrorStyle(),
            helperStyle: _getHelperStyle(),
            hintStyle: _getHintStyle(),
            prefixIconConstraints: BoxConstraints(
              minWidth: _getIconSize(),
              minHeight: _getIconSize(),
            ),
            suffixIconConstraints: BoxConstraints(
              minWidth: _getIconSize(),
              minHeight: _getIconSize(),
            ),
          ),
        ),
      ],
    );
  }

  TextStyle _getLabelStyle(bool hasError) {
    final baseStyle = size == NovaTextFieldSize.small
        ? NovaTypography.labelSmall
        : NovaTypography.labelMedium;

    return baseStyle.copyWith(
      color: hasError
          ? NovaColors.error
          : isDisabled
              ? NovaColors.neutral400
              : NovaColors.neutral700,
    );
  }

  TextStyle _getTextStyle() {
    final baseStyle = size == NovaTextFieldSize.small
        ? NovaTypography.bodySmall
        : NovaTypography.bodyMedium;

    return baseStyle.copyWith(
      color: isDisabled ? NovaColors.neutral400 : NovaColors.textPrimary,
    );
  }

  TextStyle _getHintStyle() {
    final baseStyle = size == NovaTextFieldSize.small
        ? NovaTypography.bodySmall
        : NovaTypography.bodyMedium;

    return baseStyle.copyWith(
      color: NovaColors.neutral400,
    );
  }

  TextStyle _getHelperStyle() {
    final baseStyle = size == NovaTextFieldSize.small
        ? NovaTypography.labelSmall
        : NovaTypography.labelMedium;

    return baseStyle.copyWith(
      color: NovaColors.neutral500,
    );
  }

  TextStyle _getErrorStyle() {
    final baseStyle = size == NovaTextFieldSize.small
        ? NovaTypography.labelSmall
        : NovaTypography.labelMedium;

    return baseStyle.copyWith(
      color: NovaColors.error,
    );
  }

  Color _getBackgroundColor() {
    if (isDisabled) return NovaColors.neutral100;
    if (variant == NovaTextFieldVariant.filled) return NovaColors.neutral100;
    return Colors.transparent;
  }

  EdgeInsets _getContentPadding() {
    final horizontal = size == NovaTextFieldSize.small
        ? NovaSpacing.sm
        : NovaSpacing.md;
    final vertical = size == NovaTextFieldSize.small
        ? NovaSpacing.xs
        : NovaSpacing.sm;

    return EdgeInsets.symmetric(
      horizontal: horizontal,
      vertical: vertical,
    );
  }

  InputBorder _getBorder(bool hasError) {
    final color = hasError
        ? NovaColors.error
        : isDisabled
            ? NovaColors.neutral300
            : NovaColors.neutral400;

    switch (variant) {
      case NovaTextFieldVariant.outlined:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(NovaRadius.md),
          borderSide: BorderSide(
            color: color,
            width: 1,
          ),
        );
      case NovaTextFieldVariant.filled:
        return UnderlineInputBorder(
          borderRadius: BorderRadius.circular(NovaRadius.md),
          borderSide: BorderSide(
            color: color,
            width: 1,
          ),
        );
    }
  }

  InputBorder _getFocusedBorder(bool hasError) {
    final color = hasError ? NovaColors.error : NovaColors.primary;

    switch (variant) {
      case NovaTextFieldVariant.outlined:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(NovaRadius.md),
          borderSide: BorderSide(
            color: color,
            width: 2,
          ),
        );
      case NovaTextFieldVariant.filled:
        return UnderlineInputBorder(
          borderRadius: BorderRadius.circular(NovaRadius.md),
          borderSide: BorderSide(
            color: color,
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

  double _getIconSize() {
    switch (size) {
      case NovaTextFieldSize.small:
        return 16;
      case NovaTextFieldSize.medium:
        return 20;
    }
  }
}

/// Visual style variants for the Nova text field
enum NovaTextFieldVariant {
  /// Outlined text field style
  outlined,

  /// Filled text field style
  filled,
}

/// Size variants for the Nova text field
enum NovaTextFieldSize {
  /// Small text field size
  small,

  /// Medium text field size
  medium,
} 