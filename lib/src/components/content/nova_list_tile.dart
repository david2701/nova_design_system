import 'package:flutter/material.dart';
import '../../tokens/colors.dart';
import '../../tokens/typography.dart';

/// A list tile component for the Nova design system
class NovaListTile extends StatelessWidget {
  /// Creates a Nova list tile
  const NovaListTile({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.isThreeLine = false,
    this.dense = false,
    this.visualDensity,
    this.shape,
    this.selected = false,
    this.onTap,
    this.onLongPress,
    this.mouseCursor,
    this.selectedTileColor,
    this.iconColor,
    this.textColor,
    this.variant = NovaListTileVariant.primary,
    this.size = NovaListTileSize.medium,
  });

  /// A widget to display before the title
  final Widget? leading;

  /// The primary content of the list tile
  final Widget? title;

  /// Additional content displayed below the title
  final Widget? subtitle;

  /// A widget to display after the title
  final Widget? trailing;

  /// Whether this list tile is intended to display three lines of text
  final bool isThreeLine;

  /// Whether this list tile is part of a vertically dense list
  final bool dense;

  /// Defines how compact the list tile's layout will be
  final VisualDensity? visualDensity;

  /// The shape of the list tile
  final ShapeBorder? shape;

  /// Whether this list tile is selected
  final bool selected;

  /// Called when the list tile is tapped
  final VoidCallback? onTap;

  /// Called when the list tile is long-pressed
  final VoidCallback? onLongPress;

  /// The cursor for a mouse pointer when it enters or is hovering over the list tile
  final MouseCursor? mouseCursor;

  /// The tile's background color when selected
  final Color? selectedTileColor;

  /// The color to use for the icon
  final Color? iconColor;

  /// The color to use for the text
  final Color? textColor;

  /// The visual style variant of the list tile
  final NovaListTileVariant variant;

  /// The size of the list tile
  final NovaListTileSize size;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: title != null
          ? Text(
              (title as Text).data!,
              style: _getTitleStyle(),
            )
          : null,
      subtitle: subtitle != null
          ? Text(
              (subtitle as Text).data!,
              style: _getSubtitleStyle(),
            )
          : null,
      trailing: trailing,
      isThreeLine: isThreeLine,
      dense: dense,
      visualDensity: visualDensity ?? _getVisualDensity(),
      shape: shape,
      selected: selected,
      onTap: onTap,
      onLongPress: onLongPress,
      mouseCursor: mouseCursor,
      selectedTileColor: selectedTileColor ?? _getSelectedTileColor(),
      iconColor: iconColor ?? _getIconColor(),
      textColor: textColor ?? _getTextColor(),
    );
  }

  VisualDensity _getVisualDensity() {
    switch (size) {
      case NovaListTileSize.small:
        return VisualDensity.compact;
      case NovaListTileSize.medium:
        return VisualDensity.standard;
    }
  }

  Color _getSelectedTileColor() {
    switch (variant) {
      case NovaListTileVariant.primary:
        return NovaColors.primary.withValues(alpha: 0.1);
      case NovaListTileVariant.secondary:
        return NovaColors.secondary.withValues(alpha: 0.1);
      case NovaListTileVariant.surface:
        return NovaColors.neutral100;
      case NovaListTileVariant.transparent:
        return Colors.transparent;
    }
  }

  Color _getIconColor() {
    switch (variant) {
      case NovaListTileVariant.primary:
        return NovaColors.primary;
      case NovaListTileVariant.secondary:
        return NovaColors.secondary;
      case NovaListTileVariant.surface:
      case NovaListTileVariant.transparent:
        return NovaColors.textPrimary;
    }
  }

  Color _getTextColor() {
    switch (variant) {
      case NovaListTileVariant.primary:
      case NovaListTileVariant.secondary:
      case NovaListTileVariant.surface:
      case NovaListTileVariant.transparent:
        return NovaColors.textPrimary;
    }
  }

  TextStyle _getTitleStyle() {
    final baseStyle = size == NovaListTileSize.small
        ? NovaTypography.titleSmall
        : NovaTypography.titleMedium;

    return baseStyle.copyWith(
      color: _getTextColor(),
    );
  }

  TextStyle _getSubtitleStyle() {
    final baseStyle = size == NovaListTileSize.small
        ? NovaTypography.bodySmall
        : NovaTypography.bodyMedium;

    return baseStyle.copyWith(
      color: NovaColors.textSecondary,
    );
  }
}

/// Visual style variants for the Nova list tile
enum NovaListTileVariant {
  /// Primary list tile style
  primary,

  /// Secondary list tile style
  secondary,

  /// Surface list tile style
  surface,

  /// Transparent list tile style
  transparent,
}

/// Size variants for the Nova list tile
enum NovaListTileSize {
  /// Small list tile size
  small,

  /// Medium list tile size
  medium,
} 