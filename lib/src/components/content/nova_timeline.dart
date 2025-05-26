import 'package:flutter/material.dart';
import '../../tokens/colors.dart';
import '../../tokens/spacing.dart';
import '../../tokens/typography.dart';

/// A timeline component for the Nova design system
class NovaTimeline extends StatelessWidget {
  /// Creates a Nova timeline
  const NovaTimeline({
    super.key,
    required this.items,
    this.variant = NovaTimelineVariant.primary,
    this.size = NovaTimelineSize.medium,
  });

  /// The items of the timeline
  final List<NovaTimelineItem> items;

  /// The visual style variant of the timeline
  final NovaTimelineVariant variant;

  /// The size of the timeline
  final NovaTimelineSize size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(items.length, (index) {
        final item = items[index];
        final isLast = index == items.length - 1;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: _getTimelineWidth(),
              child: Column(
                children: [
                  Container(
                    width: _getDotSize(),
                    height: _getDotSize(),
                    decoration: BoxDecoration(
                      color: _getDotColor(item.status),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: _getDotBorderColor(item.status),
                        width: _getDotBorderWidth(),
                      ),
                    ),
                  ),
                  if (!isLast)
                    Container(
                      width: _getLineWidth(),
                      height: _getLineHeight(),
                      color: _getLineColor(),
                    ),
                ],
              ),
            ),
            const SizedBox(width: NovaSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (item.title != null)
                    Text(
                      item.title!,
                      style: _getTitleStyle(),
                    ),
                  if (item.subtitle != null) ...[
                    const SizedBox(height: NovaSpacing.xs),
                    Text(
                      item.subtitle!,
                      style: _getSubtitleStyle(),
                    ),
                  ],
                  if (item.content != null) ...[
                    const SizedBox(height: NovaSpacing.sm),
                    item.content!,
                  ],
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  double _getTimelineWidth() {
    switch (size) {
      case NovaTimelineSize.small:
        return 24.0;
      case NovaTimelineSize.medium:
        return 32.0;
    }
  }

  double _getDotSize() {
    switch (size) {
      case NovaTimelineSize.small:
        return 12.0;
      case NovaTimelineSize.medium:
        return 16.0;
    }
  }

  double _getDotBorderWidth() {
    switch (size) {
      case NovaTimelineSize.small:
        return 1.0;
      case NovaTimelineSize.medium:
        return 2.0;
    }
  }

  double _getLineWidth() {
    switch (size) {
      case NovaTimelineSize.small:
        return 1.0;
      case NovaTimelineSize.medium:
        return 2.0;
    }
  }

  double _getLineHeight() {
    switch (size) {
      case NovaTimelineSize.small:
        return 24.0;
      case NovaTimelineSize.medium:
        return 32.0;
    }
  }

  Color _getDotColor(NovaTimelineItemStatus status) {
    switch (status) {
      case NovaTimelineItemStatus.completed:
        return _getStatusColor();
      case NovaTimelineItemStatus.inProgress:
        return _getStatusColor().withValues(alpha: 0.5);
      case NovaTimelineItemStatus.pending:
        return NovaColors.surface;
    }
  }

  Color _getDotBorderColor(NovaTimelineItemStatus status) {
    switch (status) {
      case NovaTimelineItemStatus.completed:
      case NovaTimelineItemStatus.inProgress:
        return _getStatusColor();
      case NovaTimelineItemStatus.pending:
        return NovaColors.neutral300;
    }
  }

  Color _getLineColor() {
    switch (variant) {
      case NovaTimelineVariant.primary:
        return NovaColors.primary.withValues(alpha: 0.2);
      case NovaTimelineVariant.secondary:
        return NovaColors.secondary.withValues(alpha: 0.2);
      case NovaTimelineVariant.surface:
        return NovaColors.neutral200;
      case NovaTimelineVariant.transparent:
        return Colors.transparent;
    }
  }

  Color _getStatusColor() {
    switch (variant) {
      case NovaTimelineVariant.primary:
        return NovaColors.primary;
      case NovaTimelineVariant.secondary:
        return NovaColors.secondary;
      case NovaTimelineVariant.surface:
        return NovaColors.neutral500;
      case NovaTimelineVariant.transparent:
        return NovaColors.neutral500;
    }
  }

  TextStyle _getTitleStyle() {
    final baseStyle = size == NovaTimelineSize.small
        ? NovaTypography.titleSmall
        : NovaTypography.titleMedium;

    return baseStyle.copyWith(
      color: _getTitleColor(),
    );
  }

  TextStyle _getSubtitleStyle() {
    final baseStyle = size == NovaTimelineSize.small
        ? NovaTypography.bodySmall
        : NovaTypography.bodyMedium;

    return baseStyle.copyWith(
      color: _getSubtitleColor(),
    );
  }

  Color _getTitleColor() {
    switch (variant) {
      case NovaTimelineVariant.primary:
      case NovaTimelineVariant.secondary:
      case NovaTimelineVariant.surface:
      case NovaTimelineVariant.transparent:
        return NovaColors.textPrimary;
    }
  }

  Color _getSubtitleColor() {
    switch (variant) {
      case NovaTimelineVariant.primary:
      case NovaTimelineVariant.secondary:
      case NovaTimelineVariant.surface:
      case NovaTimelineVariant.transparent:
        return NovaColors.textSecondary;
    }
  }
}

/// A timeline item for the Nova timeline
class NovaTimelineItem {
  /// Creates a Nova timeline item
  const NovaTimelineItem({
    this.title,
    this.subtitle,
    this.content,
    this.status = NovaTimelineItemStatus.pending,
  });

  /// The title of the timeline item
  final String? title;

  /// The subtitle of the timeline item
  final String? subtitle;

  /// The content of the timeline item
  final Widget? content;

  /// The status of the timeline item
  final NovaTimelineItemStatus status;
}

/// The status of a Nova timeline item
enum NovaTimelineItemStatus {
  /// The timeline item is completed
  completed,

  /// The timeline item is in progress
  inProgress,

  /// The timeline item is pending
  pending,
}

/// Visual style variants for the Nova timeline
enum NovaTimelineVariant {
  /// Primary timeline style
  primary,

  /// Secondary timeline style
  secondary,

  /// Surface timeline style
  surface,

  /// Transparent timeline style
  transparent,
}

/// Size variants for the Nova timeline
enum NovaTimelineSize {
  /// Small timeline size
  small,

  /// Medium timeline size
  medium,
} 