import 'package:flutter/material.dart';
import 'package:nova_design_system/nova_design_system.dart';

/// A multiline input component for the Nova design system
class NovaMultilineInput extends NovaTextField {
  /// Creates a Nova multiline input
  const NovaMultilineInput({
    super.key,
    super.controller,
    super.focusNode,
    super.hintText,
    super.labelText,
    super.helperText,
    super.errorText,
    super.onChanged,
    super.onSubmitted,
    super.onEditingComplete,
    super.textInputAction = TextInputAction.newline,
    super.keyboardType = TextInputType.multiline,
    super.autocorrect = true,
    super.enableSuggestions = true,
    super.maxLines = 5,
    super.minLines = 3,
    super.variant = NovaTextFieldVariant.outlined,
    super.size = NovaTextFieldSize.medium,
    super.isDisabled = false,
    super.isLoading = false,
    this.showCharacterCount = true,
    this.onMaxLengthReached,
  });

  /// Whether to show the character count
  final bool showCharacterCount;

  /// Called when the maximum length is reached
  final VoidCallback? onMaxLengthReached;

  @override
  Widget build(BuildContext context) {
    return NovaTextField(
      key: key,
      controller: controller,
      focusNode: focusNode,
      hintText: hintText,
      labelText: labelText,
      helperText: helperText,
      errorText: errorText,
      onChanged: (value) {
        onChanged?.call(value);
      },
      onSubmitted: onSubmitted,
      onEditingComplete: onEditingComplete,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      autocorrect: autocorrect,
      enableSuggestions: enableSuggestions,
      maxLines: maxLines,
      minLines: minLines,
      variant: variant,
      size: size,
      isDisabled: isDisabled,
      isLoading: isLoading,
      buildCounter: showCharacterCount
          ? (context, {
              required currentLength,
              required isFocused,
              required maxLength,
            }) {
              return Text(
                '$currentLength/$maxLength',
                style: TextStyle(
                  color: isFocused
                      ? NovaColors.primary
                      : NovaColors.neutral500,
                ),
              );
            }
          : null,
    );
  }
} 