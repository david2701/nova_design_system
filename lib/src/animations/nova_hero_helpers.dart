import 'package:flutter/material.dart';

class NovaHeroHelpers {
  /// Hero with Fade Effect
  static Widget fade({
    required String tag,
    required Widget child,
    bool createRectTween = false,
  }) {
    return Hero(
      tag: tag,
      createRectTween: createRectTween ? (begin, end) => MaterialRectArcTween(begin: begin, end: end) : null,
      child: child,
    );
  }

  /// Hero with Scale Effect
  static Widget scale({
    required String tag,
    required Widget child,
    double beginScale = 0.8,
    double endScale = 1.0,
  }) {
    return Hero(
      tag: tag,
      flightShuttleBuilder: (
        BuildContext flightContext,
        Animation<double> animation,
        HeroFlightDirection flightDirection,
        BuildContext fromHeroContext,
        BuildContext toHeroContext,
      ) {
        return AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Transform.scale(
              scale: beginScale + (endScale - beginScale) * animation.value,
              child: child,
            );
          },
          child: child,
        );
      },
      child: child,
    );
  }

  /// Hero with Slide Effect
  static Widget slide({
    required String tag,
    required Widget child,
    Offset beginOffset = const Offset(0, 20),
    Offset endOffset = Offset.zero,
  }) {
    return Hero(
      tag: tag,
      flightShuttleBuilder: (
        BuildContext flightContext,
        Animation<double> animation,
        HeroFlightDirection flightDirection,
        BuildContext fromHeroContext,
        BuildContext toHeroContext,
      ) {
        return AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Transform.translate(
              offset: beginOffset + (endOffset - beginOffset) * animation.value,
              child: child,
            );
          },
          child: child,
        );
      },
      child: child,
    );
  }

  /// Hero with Combined Effects
  static Widget combined({
    required String tag,
    required Widget child,
    bool fade = true,
    bool scale = true,
    bool slide = true,
  }) {
    return Hero(
      tag: tag,
      flightShuttleBuilder: (
        BuildContext flightContext,
        Animation<double> animation,
        HeroFlightDirection flightDirection,
        BuildContext fromHeroContext,
        BuildContext toHeroContext,
      ) {
        Widget result = child;
        if (fade) {
          result = FadeTransition(
            opacity: animation,
            child: result,
          );
        }
        if (scale) {
          result = ScaleTransition(
            scale: animation,
            child: result,
          );
        }
        if (slide) {
          result = SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.1),
              end: Offset.zero,
            ).animate(animation),
            child: result,
          );
        }
        return result;
      },
      child: child,
    );
  }
} 