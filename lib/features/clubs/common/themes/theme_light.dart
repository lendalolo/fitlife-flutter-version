import 'package:fitness/features/clubs/common/extension/color_extension.dart';
import 'package:flutter/material.dart';

import 'reference_color.dart';

ColorScheme get lightColorScheme => ColorScheme(
      brightness: Brightness.light,

      ///region Primary
      primary: ReferenceColor.p.shade50,
      onPrimary: ReferenceColor.p.shade100,
      primaryContainer: ReferenceColor.p.shade99,
      onPrimaryContainer: ReferenceColor.p.shade20,

      ///endregion

      ///region secondary
      secondary: ReferenceColor.s.shade60,
      onSecondary: ReferenceColor.s.shade5,
      secondaryContainer: ReferenceColor.s.shade90,
      onSecondaryContainer: ReferenceColor.s.shade5,

      ///endregion

      ///region error
      error: const Color(0xFFEF5135),
      onError: const Color(0xFF471A09),
      errorContainer: const Color(0xFFFDEEE9),
      onErrorContainer: const Color(0xFF471A09),
      ///endregion

      ///region surface
      surfaceContainerLowest: ReferenceColor.n.shade100,
      surfaceContainerLow: ReferenceColor.n.shade96,
      surface: ReferenceColor.n.shade94,
      surfaceContainer: ReferenceColor.n.shade94,
      surfaceContainerHigh: ReferenceColor.n.shade92,
      surfaceContainerHighest: ReferenceColor.n.shade90,
      outline: ReferenceColor.n.shade92,
      outlineVariant: ReferenceColor.n.shade90,
      onInverseSurface: ReferenceColor.n.shade100,
      onSurface: ReferenceColor.n.shade100,
      scrim: ReferenceColor.n.shade0.withOpacity(0.4),
      background: ReferenceColor.n.shade98,
      ///endregion
    );
