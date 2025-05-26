/// Class containing all duration tokens for the Nova design system
class NovaDurations {
  // Base duration in milliseconds
  static const int base = 100;

  // Small durations
  static const Duration xs = Duration(milliseconds: base); // 100ms
  static const Duration sm = Duration(milliseconds: base * 2); // 200ms
  static const Duration md = Duration(milliseconds: base * 3); // 300ms

  // Medium durations
  static const Duration lg = Duration(milliseconds: base * 4); // 400ms
  static const Duration xl = Duration(milliseconds: base * 5); // 500ms
  static const Duration xxl = Duration(milliseconds: base * 6); // 600ms

  // Large durations
  static const Duration xxxl = Duration(milliseconds: base * 8); // 800ms
  static const Duration xxxxl = Duration(milliseconds: base * 10); // 1000ms
  static const Duration xxxxxl = Duration(milliseconds: base * 12); // 1200ms

  // Special durations
  static const Duration none = Duration.zero;
  static const Duration instant = Duration(milliseconds: 0);
  static const Duration slow = Duration(milliseconds: 2000);
  static const Duration verySlow = Duration(milliseconds: 3000);
} 