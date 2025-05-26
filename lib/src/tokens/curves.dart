import 'package:flutter/material.dart';

/// Class containing all animation curve tokens for the Nova design system
class NovaCurves {
  // Standard curves
  static const Curve standard = Curves.easeInOut;
  static const Curve standardAccelerate = Curves.easeIn;
  static const Curve standardDecelerate = Curves.easeOut;

  // Emphasis curves
  static const Curve emphasized = Curves.easeInOutCubic;
  static const Curve emphasizedAccelerate = Curves.easeInCubic;
  static const Curve emphasizedDecelerate = Curves.easeOutCubic;

  // Interactive curves
  static const Curve interactive = Curves.easeInOutCirc;
  static const Curve interactiveAccelerate = Curves.easeInCirc;
  static const Curve interactiveDecelerate = Curves.easeOutCirc;

  // Special curves
  static const Curve linear = Curves.linear;
  static const Curve bounce = Curves.bounceOut;
  static const Curve elastic = Curves.elasticOut;
  static const Curve sharp = Curves.easeInOutBack;
} 