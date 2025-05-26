import 'package:flutter/material.dart';
import '../../tokens/colors.dart';
import 'nova_text_field.dart';

/// A password field component for the Nova design system
class NovaPasswordField extends StatefulWidget {
  /// Creates a Nova password field
  const NovaPasswordField({
    super.key,
    this.controller,
    this.focusNode,
    this.hintText = 'Password',
    this.labelText = 'Password',
    this.helperText,
    this.errorText,
    this.onChanged,
    this.onSubmitted,
    this.onEditingComplete,
    this.textInputAction = TextInputAction.done,
    this.keyboardType = TextInputType.visiblePassword,
    this.autocorrect = false,
    this.enableSuggestions = false,
    this.variant = NovaTextFieldVariant.outlined,
    this.size = NovaTextFieldSize.medium,
    this.isDisabled = false,
    this.isLoading = false,
    this.showPasswordToggle = true,
    this.onTogglePasswordVisibility,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onEditingComplete;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool autocorrect;
  final bool enableSuggestions;
  final NovaTextFieldVariant variant;
  final NovaTextFieldSize size;
  final bool isDisabled;
  final bool isLoading;
  final bool showPasswordToggle;
  final ValueChanged<bool>? onTogglePasswordVisibility;

  @override
  State<NovaPasswordField> createState() => _NovaPasswordFieldState();
}

class _NovaPasswordFieldState extends State<NovaPasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return NovaTextField(
      key: widget.key,
      controller: widget.controller,
      focusNode: widget.focusNode,
      hintText: widget.hintText,
      labelText: widget.labelText,
      helperText: widget.helperText,
      errorText: widget.errorText,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      onEditingComplete: widget.onEditingComplete,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      autocorrect: widget.autocorrect,
      enableSuggestions: widget.enableSuggestions,
      obscureText: _obscureText,
      variant: widget.variant,
      size: widget.size,
      isDisabled: widget.isDisabled,
      isLoading: widget.isLoading,
      prefixIcon: const Icon(
        Icons.lock_outline,
        color: NovaColors.neutral500,
      ),
      suffixIcon: widget.showPasswordToggle
          ? IconButton(
              icon: Icon(
                _obscureText
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: NovaColors.neutral500,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
                widget.onTogglePasswordVisibility?.call(_obscureText);
              },
            )
          : null,
    );
  }
} 