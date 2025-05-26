import 'package:flutter/material.dart';

class NovaAnimatedListHelpers {
  /// AnimatedList with Fade Effect
  static Widget fade({
    required List<Widget> children,
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
  }) {
    return ListView.builder(
      itemCount: children.length,
      itemBuilder: (context, index) {
        return TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.0, end: 1.0),
          duration: duration,
          curve: curve,
          builder: (context, value, child) {
            return Opacity(
              opacity: value,
              child: child,
            );
          },
          child: children[index],
        );
      },
    );
  }

  /// AnimatedList with Slide Effect
  static Widget slide({
    required List<Widget> children,
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
    Offset begin = const Offset(0.0, 0.1),
    Offset end = Offset.zero,
  }) {
    return ListView.builder(
      itemCount: children.length,
      itemBuilder: (context, index) {
        return TweenAnimationBuilder<Offset>(
          tween: Tween(begin: begin, end: end),
          duration: duration,
          curve: curve,
          builder: (context, value, child) {
            return Transform.translate(
              offset: value,
              child: child,
            );
          },
          child: children[index],
        );
      },
    );
  }

  /// AnimatedList with Scale Effect
  static Widget scale({
    required List<Widget> children,
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
    double begin = 0.8,
    double end = 1.0,
  }) {
    return ListView.builder(
      itemCount: children.length,
      itemBuilder: (context, index) {
        return TweenAnimationBuilder<double>(
          tween: Tween(begin: begin, end: end),
          duration: duration,
          curve: curve,
          builder: (context, value, child) {
            return Transform.scale(
              scale: value,
              child: child,
            );
          },
          child: children[index],
        );
      },
    );
  }

  /// AnimatedList with Staggered Effect
  static Widget staggered({
    required List<Widget> children,
    Duration itemDuration = const Duration(milliseconds: 300),
    Duration staggerDuration = const Duration(milliseconds: 50),
    Widget Function(BuildContext, int, Animation<double>, Widget)? builder,
  }) {
    return ListView.builder(
      itemCount: children.length,
      itemBuilder: (context, index) {
        final animation = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: AnimationController(
              vsync: Navigator.of(context),
              duration: itemDuration,
            )..forward(from: 0.0),
            curve: Interval(
              index * staggerDuration.inMilliseconds / itemDuration.inMilliseconds,
              1.0,
              curve: Curves.easeOut,
            ),
          ),
        );

        return builder?.call(context, index, animation, children[index]) ??
            FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.0, 0.1),
                  end: Offset.zero,
                ).animate(animation),
                child: children[index],
              ),
            );
      },
    );
  }
} 