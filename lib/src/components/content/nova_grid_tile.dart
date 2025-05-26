import 'package:flutter/material.dart';
import '../../tokens/colors.dart';
import '../../tokens/radius.dart';
import '../../tokens/spacing.dart';

/// A grid tile component for the Nova design system
class NovaGridTile extends StatelessWidget {
  /// Creates a Nova grid tile
  const NovaGridTile({
    super.key,
    required this.child,
    this.header,
    this.footer,
    this.onTap,
    this.variant = NovaGridTileVariant.primary,
    this.size = NovaGridTileSize.medium,
  });

  /// The main content of the grid tile
  final Widget child;

  /// The header of the grid tile
  final Widget? header;

  /// The footer of the grid tile
  final Widget? footer;

  /// Called when the grid tile is tapped
  final VoidCallback? onTap;

  /// The visual style variant of the grid tile
  final NovaGridTileVariant variant;

  /// The size of the grid tile
  final NovaGridTileSize size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: _getBackgroundColor(),
          borderRadius: BorderRadius.circular(
            size == NovaGridTileSize.small ? NovaRadius.sm : NovaRadius.md,
          ),
          border: Border.all(
            color: _getBorderColor(),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (header != null)
              Container(
                width: double.infinity,
                padding: _getHeaderPadding(),
                decoration: BoxDecoration(
                  color: _getHeaderBackgroundColor(),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      size == NovaGridTileSize.small ? NovaRadius.sm : NovaRadius.md,
                    ),
                    topRight: Radius.circular(
                      size == NovaGridTileSize.small ? NovaRadius.sm : NovaRadius.md,
                    ),
                  ),
                ),
                child: header,
              ),
            Expanded(
              child: Padding(
                padding: _getContentPadding(),
                child: child,
              ),
            ),
            if (footer != null)
              Container(
                width: double.infinity,
                padding: _getFooterPadding(),
                decoration: BoxDecoration(
                  color: _getFooterBackgroundColor(),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                      size == NovaGridTileSize.small ? NovaRadius.sm : NovaRadius.md,
                    ),
                    bottomRight: Radius.circular(
                      size == NovaGridTileSize.small ? NovaRadius.sm : NovaRadius.md,
                    ),
                  ),
                ),
                child: footer,
              ),
          ],
        ),
      ),
    );
  }

  EdgeInsetsGeometry _getHeaderPadding() {
    switch (size) {
      case NovaGridTileSize.small:
        return const EdgeInsets.all(NovaSpacing.xs);
      case NovaGridTileSize.medium:
        return const EdgeInsets.all(NovaSpacing.sm);
    }
  }

  EdgeInsetsGeometry _getContentPadding() {
    switch (size) {
      case NovaGridTileSize.small:
        return const EdgeInsets.all(NovaSpacing.sm);
      case NovaGridTileSize.medium:
        return const EdgeInsets.all(NovaSpacing.md);
    }
  }

  EdgeInsetsGeometry _getFooterPadding() {
    switch (size) {
      case NovaGridTileSize.small:
        return const EdgeInsets.all(NovaSpacing.xs);
      case NovaGridTileSize.medium:
        return const EdgeInsets.all(NovaSpacing.sm);
    }
  }

  Color _getBackgroundColor() {
    switch (variant) {
      case NovaGridTileVariant.primary:
      case NovaGridTileVariant.secondary:
      case NovaGridTileVariant.surface:
        return NovaColors.surface;
      case NovaGridTileVariant.transparent:
        return Colors.transparent;
    }
  }

  Color _getHeaderBackgroundColor() {
    switch (variant) {
      case NovaGridTileVariant.primary:
        return NovaColors.primary.withValues(alpha: 0.05);
      case NovaGridTileVariant.secondary:
        return NovaColors.secondary.withValues(alpha: 0.05);
      case NovaGridTileVariant.surface:
        return NovaColors.neutral100;
      case NovaGridTileVariant.transparent:
        return Colors.transparent;
    }
  }

  Color _getFooterBackgroundColor() {
    switch (variant) {
      case NovaGridTileVariant.primary:
        return NovaColors.primary.withValues(alpha: 0.05);
      case NovaGridTileVariant.secondary:
        return NovaColors.secondary.withValues(alpha: 0.05);
      case NovaGridTileVariant.surface:
        return NovaColors.neutral100;
      case NovaGridTileVariant.transparent:
        return Colors.transparent;
    }
  }

  Color _getBorderColor() {
    switch (variant) {
      case NovaGridTileVariant.primary:
      case NovaGridTileVariant.secondary:
        return NovaColors.textInverse.withValues(alpha: 0.1);
      case NovaGridTileVariant.surface:
      case NovaGridTileVariant.transparent:
        return NovaColors.neutral200;
    }
  }
}

/// Visual style variants for the Nova grid tile
enum NovaGridTileVariant {
  /// Primary grid tile style
  primary,

  /// Secondary grid tile style
  secondary,

  /// Surface grid tile style
  surface,

  /// Transparent grid tile style
  transparent,
}

/// Size variants for the Nova grid tile
enum NovaGridTileSize {
  /// Small grid tile size
  small,

  /// Medium grid tile size
  medium,
} 