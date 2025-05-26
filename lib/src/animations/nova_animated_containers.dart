import 'package:flutter/material.dart';

class NovaAnimatedContainers {
  /// Animated Container with Fade Effect
  static Widget fade({
    required Widget child,
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
    bool show = true,
  }) {
    return AnimatedOpacity(
      duration: duration,
      curve: curve,
      opacity: show ? 1.0 : 0.0,
      child: child,
    );
  }

  /// Animated Container with Slide Effect
  static Widget slide({
    required Widget child,
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
    bool show = true,
    Offset offset = const Offset(0, 20),
  }) {
    return AnimatedSlide(
      duration: duration,
      curve: curve,
      offset: show ? Offset.zero : offset,
      child: child,
    );
  }

  /// Animated Container with Scale Effect
  static Widget scale({
    required Widget child,
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
    bool show = true,
    double scale = 0.8,
  }) {
    return AnimatedScale(
      duration: duration,
      curve: curve,
      scale: show ? 1.0 : scale,
      child: child,
    );
  }

  /// Animated Container with Size Effect
  static Widget size({
    required Widget child,
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
    bool show = true,
    Size? size,
  }) {
    return AnimatedSize(
      duration: duration,
      curve: curve,
      child: SizedBox(
        width: show ? size?.width : 0,
        height: show ? size?.height : 0,
        child: child,
      ),
    );
  }

  /// Animated Container with Position Effect
  static Widget position({
    required Widget child,
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
    bool show = true,
    Offset offset = const Offset(0, 20),
  }) {
    return AnimatedPositioned(
      duration: duration,
      curve: curve,
      top: show ? 0 : offset.dy,
      left: show ? 0 : offset.dx,
      child: child,
    );
  }

  /// Animated Container with CrossFade Effect
  static Widget crossFade({
    required Widget firstChild,
    required Widget secondChild,
    Duration duration = const Duration(milliseconds: 300),
    bool showFirst = true,
  }) {
    return AnimatedCrossFade(
      duration: duration,
      firstChild: firstChild,
      secondChild: secondChild,
      crossFadeState: showFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }
} 