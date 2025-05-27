import 'package:flutter/material.dart';
import '../../tokens/colors.dart';
import '../../tokens/radius.dart';
import '../../tokens/spacing.dart';

/// A carousel component for the Nova design system
class NovaCarousel extends StatefulWidget {
  /// Creates a Nova carousel
  const NovaCarousel({
    super.key,
    required this.items,
    this.autoPlay = false,
    this.autoPlayInterval = const Duration(seconds: 3),
    this.showIndicators = true,
    this.showControls = true,
    this.onPageChanged,
    this.variant = NovaCarouselVariant.primary,
    this.size = NovaCarouselSize.medium,
  });

  /// The items of the carousel
  final List<Widget> items;

  /// Whether to auto play the carousel
  final bool autoPlay;

  /// The interval between auto play transitions
  final Duration autoPlayInterval;

  /// Whether to show the page indicators
  final bool showIndicators;

  /// Whether to show the navigation controls
  final bool showControls;

  /// Called when the page changes
  final ValueChanged<int>? onPageChanged;

  /// The visual style variant of the carousel
  final NovaCarouselVariant variant;

  /// The size of the carousel
  final NovaCarouselSize size;

  @override
  State<NovaCarousel> createState() => _NovaCarouselState();
}

class _NovaCarouselState extends State<NovaCarousel> {
  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    if (widget.autoPlay) {
      _startAutoPlay();
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoPlay() {
    Future.delayed(widget.autoPlayInterval, () {
      if (mounted && widget.autoPlay) {
        if (_currentPage < widget.items.length - 1) {
          _pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        } else {
          _pageController.animateToPage(
            0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
        _startAutoPlay();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentPage = index;
            });
            widget.onPageChanged?.call(index);
          },
          itemCount: widget.items.length,
          itemBuilder: (context, index) {
            return widget.items[index];
          },
        ),
        if (widget.showIndicators)
          Positioned(
            left: 0,
            right: 0,
            bottom: _getIndicatorBottomPadding(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.items.length,
                (index) => Container(
                  width: _getIndicatorSize(),
                  height: _getIndicatorSize(),
                  margin: const EdgeInsets.symmetric(
                    horizontal: NovaSpacing.xs,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _getIndicatorColor(index == _currentPage),
                  ),
                ),
              ),
            ),
          ),
        if (widget.showControls) ...[
          Positioned(
            left: _getControlPadding(),
            top: 0,
            bottom: 0,
            child: Center(
              child: _buildControlButton(
                icon: Icons.chevron_left,
                onPressed: _currentPage > 0
                    ? () {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    : null,
              ),
            ),
          ),
          Positioned(
            right: _getControlPadding(),
            top: 0,
            bottom: 0,
            child: Center(
              child: _buildControlButton(
                icon: Icons.chevron_right,
                onPressed: _currentPage < widget.items.length - 1
                    ? () {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    : null,
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required VoidCallback? onPressed,
  }) {
    return Material(
      color: _getControlBackgroundColor(),
      borderRadius: BorderRadius.circular(NovaRadius.full),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(NovaRadius.full),
        child: Container(
          width: _getControlSize(),
          height: _getControlSize(),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: _getControlBorderColor(),
            ),
          ),
          child: Icon(
            icon,
            color: onPressed != null
                ? _getControlIconColor()
                : _getControlIconColor().withValues(alpha: 0.5),
            size: _getControlIconSize(),
          ),
        ),
      ),
    );
  }

  double _getIndicatorSize() {
    switch (widget.size) {
      case NovaCarouselSize.small:
        return 8.0;
      case NovaCarouselSize.medium:
        return 12.0;
    }
  }

  double _getIndicatorBottomPadding() {
    switch (widget.size) {
      case NovaCarouselSize.small:
        return NovaSpacing.sm;
      case NovaCarouselSize.medium:
        return NovaSpacing.md;
    }
  }

  double _getControlSize() {
    switch (widget.size) {
      case NovaCarouselSize.small:
        return 32.0;
      case NovaCarouselSize.medium:
        return 40.0;
    }
  }

  double _getControlIconSize() {
    switch (widget.size) {
      case NovaCarouselSize.small:
        return 20.0;
      case NovaCarouselSize.medium:
        return 24.0;
    }
  }

  double _getControlPadding() {
    switch (widget.size) {
      case NovaCarouselSize.small:
        return NovaSpacing.sm;
      case NovaCarouselSize.medium:
        return NovaSpacing.md;
    }
  }

  Color _getIndicatorColor(bool isActive) {
    if (isActive) {
      return _getStatusColor();
    }
    return _getStatusColor().withValues(alpha: 0.3);
  }

  Color _getControlBackgroundColor() {
    switch (widget.variant) {
      case NovaCarouselVariant.primary:
      case NovaCarouselVariant.secondary:
      case NovaCarouselVariant.surface:
        return NovaColors.surface;
      case NovaCarouselVariant.transparent:
        return Colors.transparent;
    }
  }

  Color _getControlBorderColor() {
    switch (widget.variant) {
      case NovaCarouselVariant.primary:
      case NovaCarouselVariant.secondary:
        return NovaColors.textInverse.withValues(alpha: 0.1);
      case NovaCarouselVariant.surface:
      case NovaCarouselVariant.transparent:
        return NovaColors.neutral200;
    }
  }

  Color _getControlIconColor() {
    switch (widget.variant) {
      case NovaCarouselVariant.primary:
        return NovaColors.primary;
      case NovaCarouselVariant.secondary:
        return NovaColors.secondary;
      case NovaCarouselVariant.surface:
      case NovaCarouselVariant.transparent:
        return NovaColors.textPrimary;
    }
  }

  Color _getStatusColor() {
    switch (widget.variant) {
      case NovaCarouselVariant.primary:
        return NovaColors.primary;
      case NovaCarouselVariant.secondary:
        return NovaColors.secondary;
      case NovaCarouselVariant.surface:
        return NovaColors.neutral500;
      case NovaCarouselVariant.transparent:
        return NovaColors.neutral500;
    }
  }
}

/// Visual style variants for the Nova carousel
enum NovaCarouselVariant {
  /// Primary carousel style
  primary,

  /// Secondary carousel style
  secondary,

  /// Surface carousel style
  surface,

  /// Transparent carousel style
  transparent,
}

/// Size variants for the Nova carousel
enum NovaCarouselSize {
  /// Small carousel size
  small,

  /// Medium carousel size
  medium,
} 