/// Class containing all z-index tokens for the Nova design system
class NovaZIndex {
  // Base z-index
  static const int base = 1;

  // Small z-indices
  static const int xs = base; // 1
  static const int sm = base * 10; // 10
  static const int md = base * 100; // 100

  // Medium z-indices
  static const int lg = base * 1000; // 1000
  static const int xl = base * 10000; // 10000
  static const int xxl = base * 100000; // 100000

  // Large z-indices
  static const int xxxl = base * 1000000; // 1000000
  static const int xxxxl = base * 10000000; // 10000000
  static const int xxxxxl = base * 100000000; // 100000000

  // Special z-indices
  static const int none = 0;
  static const int max = 999999999;
} 