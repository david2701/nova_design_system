import 'package:flutter/material.dart';
import '../../tokens/colors.dart';
import '../../tokens/spacing.dart';
import '../../tokens/typography.dart';

/// A data table component for the Nova design system
class NovaDataTable extends StatelessWidget {
  /// Creates a Nova data table
  const NovaDataTable({
    super.key,
    required this.columns,
    required this.rows,
    this.sortColumnIndex,
    this.sortAscending = true,
    this.onSelectAll,
    this.showCheckboxColumn = true,
    this.showFirstLastButtons = false,
    this.headingRowHeight = 56.0,
    this.dataRowHeight = 52.0,
    this.horizontalMargin = 24.0,
    this.columnSpacing = 56.0,
    this.dividerThickness = 1.0,
    this.variant = NovaDataTableVariant.primary,
    this.size = NovaDataTableSize.medium,
  });

  /// The columns of the data table
  final List<DataColumn> columns;

  /// The rows of the data table
  final List<DataRow> rows;

  /// The index of the column to sort by
  final int? sortColumnIndex;

  /// Whether the sort is ascending
  final bool sortAscending;

  /// Called when all rows are selected or deselected
  final ValueSetter<bool?>? onSelectAll;

  /// Whether to show the checkbox column
  final bool showCheckboxColumn;

  /// Whether to show the first and last page buttons
  final bool showFirstLastButtons;

  /// The height of the heading row
  final double headingRowHeight;

  /// The height of each data row
  final double dataRowHeight;

  /// The horizontal margin of the table
  final double horizontalMargin;

  /// The spacing between columns
  final double columnSpacing;

  /// The thickness of the divider
  final double dividerThickness;

  /// The visual style variant of the data table
  final NovaDataTableVariant variant;

  /// The size of the data table
  final NovaDataTableSize size;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: _getDividerColor(),
        dividerTheme: DividerThemeData(
          color: _getDividerColor(),
          thickness: dividerThickness,
        ),
      ),
      child: DataTable(
        columns: columns,
        rows: rows,
        sortColumnIndex: sortColumnIndex,
        sortAscending: sortAscending,
        onSelectAll: onSelectAll,
        showCheckboxColumn: showCheckboxColumn,
        headingRowHeight: headingRowHeight,
        dataRowHeight: dataRowHeight,
        horizontalMargin: horizontalMargin,
        columnSpacing: columnSpacing,
        dividerThickness: dividerThickness,
        headingTextStyle: _getHeadingTextStyle(),
        dataTextStyle: _getDataTextStyle(),
        checkboxHorizontalMargin: _getCheckboxMargin(),
      ),
    );
  }

  TextStyle _getHeadingTextStyle() {
    final baseStyle = size == NovaDataTableSize.small
        ? NovaTypography.titleSmall
        : NovaTypography.titleMedium;

    return baseStyle.copyWith(
      color: _getHeadingTextColor(),
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle _getDataTextStyle() {
    final baseStyle = size == NovaDataTableSize.small
        ? NovaTypography.bodySmall
        : NovaTypography.bodyMedium;

    return baseStyle.copyWith(
      color: _getDataTextColor(),
    );
  }

  double _getCheckboxMargin() {
    switch (size) {
      case NovaDataTableSize.small:
        return NovaSpacing.xs;
      case NovaDataTableSize.medium:
        return NovaSpacing.sm;
    }
  }

  Color _getHeadingTextColor() {
    switch (variant) {
      case NovaDataTableVariant.primary:
        return NovaColors.primary;
      case NovaDataTableVariant.secondary:
        return NovaColors.secondary;
      case NovaDataTableVariant.surface:
      case NovaDataTableVariant.transparent:
        return NovaColors.textPrimary;
    }
  }

  Color _getDataTextColor() {
    switch (variant) {
      case NovaDataTableVariant.primary:
      case NovaDataTableVariant.secondary:
      case NovaDataTableVariant.surface:
      case NovaDataTableVariant.transparent:
        return NovaColors.textPrimary;
    }
  }

  Color _getDividerColor() {
    switch (variant) {
      case NovaDataTableVariant.primary:
      case NovaDataTableVariant.secondary:
        return NovaColors.textInverse.withOpacity(0.1);
      case NovaDataTableVariant.surface:
      case NovaDataTableVariant.transparent:
        return NovaColors.neutral200;
    }
  }
}

/// Visual style variants for the Nova data table
enum NovaDataTableVariant {
  /// Primary data table style
  primary,

  /// Secondary data table style
  secondary,

  /// Surface data table style
  surface,

  /// Transparent data table style
  transparent,
}

/// Size variants for the Nova data table
enum NovaDataTableSize {
  /// Small data table size
  small,

  /// Medium data table size
  medium,
} 