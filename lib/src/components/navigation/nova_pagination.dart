import 'package:flutter/material.dart';
import 'dart:math';
import '../../tokens/colors.dart';
import '../../tokens/spacing.dart';
import '../../tokens/typography.dart';

/// A pagination component for the Nova design system
class NovaPagination extends StatelessWidget {
  /// Creates a Nova pagination
  const NovaPagination({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
    this.showFirstLast = true,
    this.showNumbers = true,
    this.maxVisiblePages = 5,
    this.variant = NovaPaginationVariant.primary,
    this.size = NovaPaginationSize.medium,
  });

  /// The current page
  final int currentPage;

  /// The total number of pages
  final int totalPages;

  /// Called when the page changes
  final ValueChanged<int> onPageChanged;

  /// Whether to show first and last page buttons
  final bool showFirstLast;

  /// Whether to show page numbers
  final bool showNumbers;

  /// The maximum number of visible page numbers
  final int maxVisiblePages;

  /// The visual style variant of the pagination
  final NovaPaginationVariant variant;

  /// The size of the pagination
  final NovaPaginationSize size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showFirstLast) ...[
          _buildPageButton(
            icon: Icons.first_page,
            onPressed: currentPage > 1 ? () => onPageChanged(1) : null,
          ),
          const SizedBox(width: NovaSpacing.xs),
        ],
        _buildPageButton(
          icon: Icons.chevron_left,
          onPressed: currentPage > 1 ? () => onPageChanged(currentPage - 1) : null,
        ),
        if (showNumbers) ...[
          const SizedBox(width: NovaSpacing.xs),
          ..._buildPageNumbers(),
          const SizedBox(width: NovaSpacing.xs),
        ],
        _buildPageButton(
          icon: Icons.chevron_right,
          onPressed: currentPage < totalPages ? () => onPageChanged(currentPage + 1) : null,
        ),
        if (showFirstLast) ...[
          const SizedBox(width: NovaSpacing.xs),
          _buildPageButton(
            icon: Icons.last_page,
            onPressed: currentPage < totalPages ? () => onPageChanged(totalPages) : null,
          ),
        ],
      ],
    );
  }

  List<Widget> _buildPageNumbers() {
    final pages = <Widget>[];
    final halfVisible = (maxVisiblePages - 1) ~/ 2;
    var start = currentPage - halfVisible;
    var end = currentPage + halfVisible;

    if (start < 1) {
      start = 1;
      end = min(maxVisiblePages, totalPages);
    } else if (end > totalPages) {
      end = totalPages;
      start = max(1, totalPages - maxVisiblePages + 1);
    }

    for (var i = start; i <= end; i++) {
      pages.add(
        _buildPageNumber(i),
      );
      if (i < end) {
        pages.add(
          const SizedBox(width: NovaSpacing.xs),
        );
      }
    }

    return pages;
  }

  Widget _buildPageNumber(int page) {
    final isCurrentPage = page == currentPage;

    return GestureDetector(
      onTap: isCurrentPage ? null : () => onPageChanged(page),
      child: Container(
        width: _getButtonSize(),
        height: _getButtonSize(),
        decoration: BoxDecoration(
          color: isCurrentPage ? _getActiveColor() : Colors.transparent,
          borderRadius: BorderRadius.circular(
            size == NovaPaginationSize.small ? 4 : 8,
          ),
          border: Border.all(
            color: isCurrentPage ? _getActiveColor() : _getBorderColor(),
          ),
        ),
        child: Center(
          child: Text(
            page.toString(),
            style: _getTextStyle(isCurrentPage),
          ),
        ),
      ),
    );
  }

  Widget _buildPageButton({
    required IconData icon,
    VoidCallback? onPressed,
  }) {
    return IconButton(
      icon: Icon(icon),
      onPressed: onPressed,
      iconSize: _getIconSize(),
      color: onPressed != null ? _getIconColor() : _getDisabledColor(),
      padding: EdgeInsets.zero,
      constraints: BoxConstraints(
        minWidth: _getButtonSize(),
        minHeight: _getButtonSize(),
      ),
    );
  }

  Color _getActiveColor() {
    switch (variant) {
      case NovaPaginationVariant.primary:
        return NovaColors.primary;
      case NovaPaginationVariant.secondary:
        return NovaColors.secondary;
      case NovaPaginationVariant.surface:
        return NovaColors.surface;
      case NovaPaginationVariant.transparent:
        return Colors.transparent;
    }
  }

  Color _getBorderColor() {
    switch (variant) {
      case NovaPaginationVariant.primary:
      case NovaPaginationVariant.secondary:
        return NovaColors.textInverse.withValues(alpha: 0.1);
      case NovaPaginationVariant.surface:
      case NovaPaginationVariant.transparent:
        return NovaColors.neutral200;
    }
  }

  Color _getIconColor() {
    switch (variant) {
      case NovaPaginationVariant.primary:
      case NovaPaginationVariant.secondary:
        return NovaColors.textInverse;
      case NovaPaginationVariant.surface:
      case NovaPaginationVariant.transparent:
        return NovaColors.textPrimary;
    }
  }

  Color _getDisabledColor() {
    switch (variant) {
      case NovaPaginationVariant.primary:
      case NovaPaginationVariant.secondary:
        return NovaColors.textInverse.withValues(alpha: 0.3);
      case NovaPaginationVariant.surface:
      case NovaPaginationVariant.transparent:
        return NovaColors.neutral400;
    }
  }

  TextStyle _getTextStyle(bool isCurrentPage) {
    final baseStyle = size == NovaPaginationSize.small
        ? NovaTypography.labelSmall
        : NovaTypography.labelMedium;

    return baseStyle.copyWith(
      color: isCurrentPage ? _getTextColor(isCurrentPage) : _getTextColor(isCurrentPage),
    );
  }

  Color _getTextColor(bool isCurrentPage) {
    if (isCurrentPage) {
      switch (variant) {
        case NovaPaginationVariant.primary:
        case NovaPaginationVariant.secondary:
          return NovaColors.textInverse;
        case NovaPaginationVariant.surface:
        case NovaPaginationVariant.transparent:
          return NovaColors.primary;
      }
    }

    switch (variant) {
      case NovaPaginationVariant.primary:
      case NovaPaginationVariant.secondary:
        return NovaColors.textInverse;
      case NovaPaginationVariant.surface:
      case NovaPaginationVariant.transparent:
        return NovaColors.textPrimary;
    }
  }

  double _getButtonSize() {
    switch (size) {
      case NovaPaginationSize.small:
        return 32;
      case NovaPaginationSize.medium:
        return 40;
    }
  }

  double _getIconSize() {
    switch (size) {
      case NovaPaginationSize.small:
        return 20;
      case NovaPaginationSize.medium:
        return 24;
    }
  }
}

/// Visual style variants for the Nova pagination
enum NovaPaginationVariant {
  /// Primary pagination style
  primary,

  /// Secondary pagination style
  secondary,

  /// Surface pagination style
  surface,

  /// Transparent pagination style
  transparent,
}

/// Size variants for the Nova pagination
enum NovaPaginationSize {
  /// Small pagination size
  small,

  /// Medium pagination size
  medium,
} 