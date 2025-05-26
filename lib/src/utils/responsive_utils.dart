import 'package:flutter/material.dart';

enum ScreenSize { xs, sm, md, lg, xl }

class ResponsiveUtils {
  static ScreenSize getScreenSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) return ScreenSize.xs;
    if (width < 900) return ScreenSize.sm;
    if (width < 1200) return ScreenSize.md;
    if (width < 1600) return ScreenSize.lg;
    return ScreenSize.xl;
  }

  static bool isMobile(BuildContext context) => getScreenSize(context) == ScreenSize.xs;
  static bool isTablet(BuildContext context) => getScreenSize(context) == ScreenSize.sm;
  static bool isDesktop(BuildContext context) => getScreenSize(context).index >= ScreenSize.md.index;
} 