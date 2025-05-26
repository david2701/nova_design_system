import 'package:flutter/material.dart';

/// A responsive builder component for the Nova design system
class NovaResponsiveBuilder extends StatelessWidget {
  /// Creates a Nova responsive builder
  const NovaResponsiveBuilder({
    super.key,
    required this.builder,
    this.breakpoints = const NovaBreakpoints(),
  });

  /// The builder function that returns a widget based on the screen size
  final Widget Function(BuildContext context, NovaScreenSize size) builder;

  /// The breakpoints for different screen sizes
  final NovaBreakpoints breakpoints;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final size = _getScreenSize(width);

        return builder(context, size);
      },
    );
  }

  NovaScreenSize _getScreenSize(double width) {
    if (width < breakpoints.small) {
      return NovaScreenSize.xs;
    } else if (width < breakpoints.medium) {
      return NovaScreenSize.sm;
    } else if (width < breakpoints.large) {
      return NovaScreenSize.md;
    } else if (width < breakpoints.xlarge) {
      return NovaScreenSize.lg;
    } else {
      return NovaScreenSize.xl;
    }
  }
}

/// Screen size variants for the Nova responsive builder
enum NovaScreenSize {
  /// Extra small screen size
  xs,

  /// Small screen size
  sm,

  /// Medium screen size
  md,

  /// Large screen size
  lg,

  /// Extra large screen size
  xl,
}

/// Breakpoints for different screen sizes
class NovaBreakpoints {
  /// Creates breakpoints for different screen sizes
  const NovaBreakpoints({
    this.small = 600,
    this.medium = 900,
    this.large = 1200,
    this.xlarge = 1600,
  });

  /// The breakpoint for small screens
  final double small;

  /// The breakpoint for medium screens
  final double medium;

  /// The breakpoint for large screens
  final double large;

  /// The breakpoint for extra large screens
  final double xlarge;
} 