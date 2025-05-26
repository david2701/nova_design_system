import 'package:flutter/material.dart';
import '../../tokens/colors.dart';
import 'nova_text_field.dart';

/// A search bar component for the Nova design system
class NovaSearchBar extends NovaTextField {
  /// Creates a Nova search bar
  const NovaSearchBar({
    super.key,
    super.controller,
    super.focusNode,
    super.hintText = 'Buscar...',
    super.onChanged,
    super.onSubmitted,
    super.onEditingComplete,
    super.textInputAction = TextInputAction.search,
    super.keyboardType = TextInputType.text,
    super.autocorrect = false,
    super.enableSuggestions = false,
    super.variant = NovaTextFieldVariant.filled,
    super.size = NovaTextFieldSize.medium,
    super.isDisabled = false,
    super.isLoading = false,
    this.onClear,
    this.onSearch,
    this.debounceDuration = const Duration(milliseconds: 300),
  }) : super(
          prefixIcon: const Icon(
            Icons.search,
            color: NovaColors.neutral500,
          ),
        );

  /// Called when the clear button is pressed
  final VoidCallback? onClear;

  /// Called when the search button is pressed
  final VoidCallback? onSearch;

  /// The duration to wait before triggering the search
  final Duration debounceDuration;

  @override
  Widget build(BuildContext context) {
    return NovaTextField(
      key: key,
      controller: controller,
      focusNode: focusNode,
      hintText: hintText,
      onChanged: (value) {
        onChanged?.call(value);
        if (value.isEmpty) {
          onClear?.call();
        }
      },
      onSubmitted: (value) {
        onSubmitted?.call(value);
        onSearch?.call();
      },
      onEditingComplete: () {
        onEditingComplete?.call();
        onSearch?.call();
      },
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      autocorrect: autocorrect,
      enableSuggestions: enableSuggestions,
      variant: variant,
      size: size,
      isDisabled: isDisabled,
      isLoading: isLoading,
      suffixIcon: _buildSuffixIcon(),
    );
  }

  Widget? _buildSuffixIcon() {
    if (isLoading) {
      return SizedBox(
        width: _getIconSize(),
        height: _getIconSize(),
        child: const CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            NovaColors.primary,
          ),
        ),
      );
    }

    if (controller?.text.isNotEmpty == true) {
      return IconButton(
        icon: const Icon(
          Icons.clear,
          color: NovaColors.neutral500,
        ),
        onPressed: () {
          controller?.clear();
          onClear?.call();
        },
      );
    }

    return null;
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