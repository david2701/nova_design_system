/// Class containing all breakpoint tokens for the Nova design system
class NovaBreakpoints {
  // Base breakpoint in logical pixels
  static const double base = 320.0;

  // Small breakpoints
  static const double xs = base; // 320px
  static const double sm = base * 1.5; // 480px
  static const double md = base * 2; // 640px

  // Medium breakpoints
  static const double lg = base * 3; // 960px
  static const double xl = base * 4; // 1280px
  static const double xxl = base * 5; // 1600px

  // Large breakpoints
  static const double xxxl = base * 6; // 1920px
  static const double xxxxl = base * 7; // 2240px
  static const double xxxxxl = base * 8; // 2560px

  // Special breakpoints
  static const double none = 0;
  static const double max = double.infinity;
} 