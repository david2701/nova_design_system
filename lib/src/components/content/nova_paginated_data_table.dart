import 'package:flutter/material.dart';
import '../../tokens/colors.dart';
import '../../tokens/spacing.dart';
import '../../tokens/typography.dart';

/// Visual style variants for the Nova paginated data table
enum NovaPaginatedDataTableVariant {
  /// Primary paginated data table style
  primary,

  /// Secondary paginated data table style
  secondary,

  /// Surface paginated data table style
  surface,

  /// Transparent paginated data table style
  transparent,
}

/// Size variants for the Nova paginated data table
enum NovaPaginatedDataTableSize {
  /// Small paginated data table size
  small,

  /// Medium paginated data table size
  medium,
}

/// A paginated data table component for the Nova design system
class NovaPaginatedDataTable extends StatelessWidget {
  /// Creates a Nova paginated data table
  const NovaPaginatedDataTable({
    super.key,
    required this.columns,
    required this.source,
    this.header,
    this.actions,
    this.sortColumnIndex,
    this.sortAscending = true,
    this.onSelectAll,
    this.showCheckboxColumn = true,
    this.showFirstLastButtons = false,
    this.initialFirstRowIndex = 0,
    this.onPageChanged,
    this.rowsPerPage = 10,
    this.availableRowsPerPage = const [10, 20, 50],
    this.onRowsPerPageChanged,
    this.headingRowHeight = 56.0,
    this.dataRowHeight = 52.0,
    this.horizontalMargin = 24.0,
    this.columnSpacing = 56.0,
    this.dividerThickness = 1.0,
    this.variant = NovaPaginatedDataTableVariant.primary,
    this.size = NovaPaginatedDataTableSize.medium,
  });

  /// The columns of the data table
  final List<DataColumn> columns;

  /// The source of the data
  final DataTableSource source;

  /// The header of the data table
  final Widget? header;

  /// The actions of the data table
  final List<Widget>? actions;

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

  /// The initial first row index
  final int initialFirstRowIndex;

  /// Called when the page changes
  final ValueChanged<int>? onPageChanged;

  /// The number of rows per page
  final int rowsPerPage;

  /// The available rows per page options
  final List<int> availableRowsPerPage;

  /// Called when the rows per page changes
  final ValueChanged<int?>? onRowsPerPageChanged;

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
  final NovaPaginatedDataTableVariant variant;

  /// The size of the data table
  final NovaPaginatedDataTableSize size;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: _getDividerColor(),
        dividerTheme: DividerThemeData(
          color: _getDividerColor(),
          thickness: dividerThickness,
        ),
        textTheme: Theme.of(context).textTheme.copyWith(
          titleMedium: _getHeadingTextStyle(),
          bodyMedium: _getDataTextStyle(),
        ),
      ),
      child: PaginatedDataTable(
        columns: columns,
        source: source,
        header: header,
        actions: actions,
        sortColumnIndex: sortColumnIndex,
        sortAscending: sortAscending,
        onSelectAll: onSelectAll,
        showCheckboxColumn: showCheckboxColumn,
        showFirstLastButtons: showFirstLastButtons,
        initialFirstRowIndex: initialFirstRowIndex,
        onPageChanged: onPageChanged,
        rowsPerPage: rowsPerPage,
        availableRowsPerPage: availableRowsPerPage,
        onRowsPerPageChanged: onRowsPerPageChanged,
        headingRowHeight: headingRowHeight,
        dataRowMinHeight: dataRowHeight,
        horizontalMargin: horizontalMargin,
        columnSpacing: columnSpacing,
        dividerThickness: dividerThickness,
        checkboxHorizontalMargin: _getCheckboxMargin(),
      ),
    );
  }

  double _getCheckboxMargin() {
    switch (size) {
      case NovaPaginatedDataTableSize.small:
        return NovaSpacing.xs;
      case NovaPaginatedDataTableSize.medium:
        return NovaSpacing.sm;
      }
  }

  Color _getDividerColor() {
    switch (variant) {
      case NovaPaginatedDataTableVariant.primary:
      case NovaPaginatedDataTableVariant.secondary:
        return NovaColors.textInverse.withValues(alpha: 0.1);
      case NovaPaginatedDataTableVariant.surface:
      case NovaPaginatedDataTableVariant.transparent:
        return NovaColors.neutral200;
    }
  }

  TextStyle _getHeadingTextStyle() {
    final baseStyle = size == NovaPaginatedDataTableSize.small
        ? NovaTypography.titleSmall
        : NovaTypography.titleMedium;

    return baseStyle.copyWith(
      color: _getHeadingTextColor(),
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle _getDataTextStyle() {
    final baseStyle = size == NovaPaginatedDataTableSize.small
        ? NovaTypography.bodySmall
        : NovaTypography.bodyMedium;

    return baseStyle.copyWith(
      color: _getDataTextColor(),
    );
  }

  Color _getHeadingTextColor() {
    switch (variant) {
      case NovaPaginatedDataTableVariant.primary:
        return NovaColors.primary;
      case NovaPaginatedDataTableVariant.secondary:
        return NovaColors.secondary;
      case NovaPaginatedDataTableVariant.surface:
      case NovaPaginatedDataTableVariant.transparent:
        return NovaColors.textPrimary;
    }
  }

  Color _getDataTextColor() {
    switch (variant) {
      case NovaPaginatedDataTableVariant.primary:
      case NovaPaginatedDataTableVariant.secondary:
      case NovaPaginatedDataTableVariant.surface:
      case NovaPaginatedDataTableVariant.transparent:
        return NovaColors.textPrimary;
    }
  }
} 