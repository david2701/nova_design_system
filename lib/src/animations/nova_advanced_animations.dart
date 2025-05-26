import 'package:flutter/material.dart';
import 'dart:math' show sin;

class NovaAdvancedAnimations {
  /// Parallax Scroll Effect
  static Widget parallaxScroll({
    required Widget child,
    required ScrollController scrollController,
    double factor = 0.5,
    bool horizontal = false,
  }) {
    return AnimatedBuilder(
      animation: scrollController,
      builder: (context, child) {
        final offset = scrollController.offset * factor;
        return Transform.translate(
          offset: horizontal ? Offset(offset, 0) : Offset(0, offset),
          child: child,
        );
      },
      child: child,
    );
  }

  /// Pulse Animation
  static Widget pulse({
    required Widget child,
    Duration duration = const Duration(milliseconds: 1500),
    double minScale = 0.95,
    double maxScale = 1.05,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: minScale, end: maxScale),
      duration: duration,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: child,
        );
      },
      child: child,
    );
  }

  /// Wave Animation
  static Widget wave({
    required Widget child,
    Duration duration = const Duration(milliseconds: 2000),
    double amplitude = 10.0,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 2 * 3.14159),
      duration: duration,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, sin(value) * amplitude),
          child: child,
        );
      },
      child: child,
    );
  }

  /// Flip Animation
  static Widget flip({
    required Widget child,
    Duration duration = const Duration(milliseconds: 500),
    bool horizontal = true,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 3.14159),
      duration: duration,
      builder: (context, value, child) {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateX(horizontal ? 0 : value)
            ..rotateY(horizontal ? value : 0),
          child: child,
        );
      },
      child: child,
    );
  }

  /// Elastic Animation
  static Widget elastic({
    required Widget child,
    Duration duration = const Duration(milliseconds: 1000),
    double overshoot = 0.2,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: duration,
      curve: Curves.elasticOut,
      builder: (context, value, child) {
        return Transform.scale(
          scale: 1.0 + (value * overshoot),
          child: child,
        );
      },
      child: child,
    );
  }

  /// Glow Effect
  static Widget glow({
    required Widget child,
    Duration duration = const Duration(milliseconds: 1500),
    Color color = Colors.white,
    double radius = 10.0,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: duration,
      builder: (context, value, child) {
        return Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(value * 0.5),
                blurRadius: radius * value,
                spreadRadius: radius * value,
              ),
            ],
          ),
          child: child,
        );
      },
      child: child,
    );
  }

  /// Morphing Animation
  static Widget morph({
    required Widget child,
    Duration duration = const Duration(milliseconds: 500),
    BorderRadius beginRadius = BorderRadius.zero,
    BorderRadius endRadius = const BorderRadius.all(Radius.circular(20)),
  }) {
    return TweenAnimationBuilder<BorderRadius>(
      tween: Tween(begin: beginRadius, end: endRadius),
      duration: duration,
      builder: (context, value, child) {
        return ClipRRect(
          borderRadius: value,
          child: child,
        );
      },
      child: child,
    );
  }

  /// 3D Rotation
  static Widget rotate3D({
    required Widget child,
    Duration duration = const Duration(milliseconds: 500),
    double x = 0.0,
    double y = 0.0,
    double z = 0.0,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 2 * 3.14159),
      duration: duration,
      builder: (context, value, child) {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateX(x * value)
            ..rotateY(y * value)
            ..rotateZ(z * value),
          child: child,
        );
      },
      child: child,
    );
  }
} 