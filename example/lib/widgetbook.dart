import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'widgetbook/tokens/colors_showcase.dart';
import 'widgetbook/tokens/typography_showcase.dart';
import 'widgetbook/tokens/durations_showcase.dart';
import 'widgetbook/tokens/spacing_showcase.dart';
import 'widgetbook/tokens/shadows_showcase.dart';
import 'widgetbook/tokens/radius_showcase.dart';
import 'widgetbook/tokens/elevations_showcase.dart';
import 'widgetbook/tokens/opacities_showcase.dart';
import 'widgetbook/tokens/curves_showcase.dart';
import 'widgetbook/tokens/breakpoints_showcase.dart';
import 'widgetbook/tokens/zindex_showcase.dart';
import 'widgetbook/components/basics/buttons_showcase.dart';
import 'widgetbook/components/basics/avatar_showcase.dart';
import 'widgetbook/components/basics/badge_chip_showcase.dart';
import 'widgetbook/components/basics/controls_showcase.dart';
import 'widgetbook/components/basics/misc_showcase.dart';
import 'widgetbook/components/overlay/overlay_showcase.dart';

class NovaDesignSystemApp extends StatelessWidget {
  const NovaDesignSystemApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      addons: [
        MaterialThemeAddon( 
          themes: [ 
            WidgetbookTheme( 
              name: 'Light', 
              data: ThemeData.light(), 
            ), 
            WidgetbookTheme( 
              name: 'Dark', 
              data: ThemeData.dark(), 
            ), 
          ], 
        ), 
      ],
      directories: [
        WidgetbookCategory(
          name: 'Tokens',
          children: [
            colorStories,
            typographyStories,
            spacingStories,
            radiusStories,
            shadowsStories,
            elevationsStories,
            opacitiesStories,
            durationsStories,
            curvesStories,
            breakpointsStories,
            zIndexStories,
          ],
        ),
        WidgetbookCategory(
          name: 'Components',
          children: [
            WidgetbookFolder(
              name: 'Basics',
              children: [
                buttonsStories,
                avatarStories,
                badgeChipStories,
                controlsStories,
                miscStories,
              ],
            ),
            WidgetbookFolder(
              name: 'Overlay',
              children: [
                overlayStories,
              ],
            ),
          ],
        ),
      ],
    );
  }
} 