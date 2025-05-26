import 'package:flutter/material.dart';
import '../../tokens/colors.dart';
import '../../tokens/radius.dart';
import '../../tokens/spacing.dart';
import '../../tokens/typography.dart';

/// An alert dialog component for the Nova design system
class NovaAlertDialog extends StatelessWidget {
  /// Creates a Nova alert dialog
  const NovaAlertDialog({
    super.key,
    required this.title,
    this.content,
    this.actions,
    this.variant = NovaAlertDialogVariant.standard,
    this.size = NovaAlertDialogSize.medium,
  });

  /// The title of the dialog
  final String title;

  /// The content of the dialog
  final Widget? content;

  /// The actions of the dialog
  final List<Widget>? actions;

  /// The visual style variant of the dialog
  final NovaAlertDialogVariant variant;

  /// The size of the dialog
  final NovaAlertDialogSize size;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: _getTitleStyle(),
      ),
      content: content,
      actions: actions,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_getBorderRadius()),
      ),
      backgroundColor: _getBackgroundColor(),
      titlePadding: _getTitlePadding(),
      contentPadding: _getContentPadding(),
      actionsPadding: _getActionsPadding(),
      actionsAlignment: MainAxisAlignment.end,
    );
  }

  TextStyle _getTitleStyle() {
    final baseStyle = size == NovaAlertDialogSize.small
        ? NovaTypography.titleMedium
        : NovaTypography.titleLarge;

    return baseStyle.copyWith(
      color: _getTitleColor(),
    );
  }

  double _getBorderRadius() {
    switch (size) {
      case NovaAlertDialogSize.small:
        return NovaRadius.sm;
      case NovaAlertDialogSize.medium:
        return NovaRadius.md;
      case NovaAlertDialogSize.large:
        return NovaRadius.lg;
    }
  }

  Color _getBackgroundColor() {
    switch (variant) {
      case NovaAlertDialogVariant.standard:
      case NovaAlertDialogVariant.info:
      case NovaAlertDialogVariant.success:
      case NovaAlertDialogVariant.warning:
      case NovaAlertDialogVariant.error:
        return NovaColors.surface;
    }
  }

  Color _getTitleColor() {
    switch (variant) {
      case NovaAlertDialogVariant.standard:
        return NovaColors.textPrimary;
      case NovaAlertDialogVariant.info:
        return NovaColors.info;
      case NovaAlertDialogVariant.success:
        return NovaColors.success;
      case NovaAlertDialogVariant.warning:
        return NovaColors.warning;
      case NovaAlertDialogVariant.error:
        return NovaColors.error;
    }
  }

  EdgeInsetsGeometry _getTitlePadding() {
    switch (size) {
      case NovaAlertDialogSize.small:
        return const EdgeInsets.all(NovaSpacing.md);
      case NovaAlertDialogSize.medium:
        return const EdgeInsets.all(NovaSpacing.lg);
      case NovaAlertDialogSize.large:
        return const EdgeInsets.all(NovaSpacing.xl);
    }
  }

  EdgeInsetsGeometry _getContentPadding() {
    switch (size) {
      case NovaAlertDialogSize.small:
        return const EdgeInsets.symmetric(
          horizontal: NovaSpacing.md,
          vertical: NovaSpacing.sm,
        );
      case NovaAlertDialogSize.medium:
        return const EdgeInsets.symmetric(
          horizontal: NovaSpacing.lg,
          vertical: NovaSpacing.md,
        );
      case NovaAlertDialogSize.large:
        return const EdgeInsets.symmetric(
          horizontal: NovaSpacing.xl,
          vertical: NovaSpacing.lg,
        );
    }
  }

  EdgeInsetsGeometry _getActionsPadding() {
    switch (size) {
      case NovaAlertDialogSize.small:
        return const EdgeInsets.all(NovaSpacing.sm);
      case NovaAlertDialogSize.medium:
        return const EdgeInsets.all(NovaSpacing.md);
      case NovaAlertDialogSize.large:
        return const EdgeInsets.all(NovaSpacing.lg);
    }
  }
}

/// Visual style variants for the Nova alert dialog
enum NovaAlertDialogVariant {
  /// Standard dialog style
  standard,

  /// Info dialog style
  info,

  /// Success dialog style
  success,

  /// Warning dialog style
  warning,

  /// Error dialog style
  error,
}

/// Size variants for the Nova alert dialog
enum NovaAlertDialogSize {
  /// Small dialog size
  small,

  /// Medium dialog size
  medium,

  /// Large dialog size
  large,
} 