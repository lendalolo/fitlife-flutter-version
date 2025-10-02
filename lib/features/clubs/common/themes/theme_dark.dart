import 'package:fitness/features/clubs/common/extension/color_extension.dart';
import 'package:flutter/material.dart';

import 'reference_color.dart';

ColorScheme darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  ///region Primary
  primary: ReferenceColor.p.shade50,
  onPrimary: ReferenceColor.p.shade100,
  primaryContainer: ReferenceColor.p.shade10,
  onPrimaryContainer: ReferenceColor.p.shade99,
  ///endregion

  ///region secondary
  secondary: ReferenceColor.s.shade70,
  onSecondary: ReferenceColor.s.shade5,
  secondaryContainer: ReferenceColor.s.shade5,
  onSecondaryContainer: ReferenceColor.s.shade90,
  ///endregion

  ///region error
  error: const Color(0xFFEF5135),

  onError: const Color(0xFF4C3318),
  errorContainer: const Color(0xFF4C3318),
  onErrorContainer: const Color(0xFFFFFBF6),
  ///endregion

  ///region surface
  surfaceContainerLowest: ReferenceColor.n.shade0,
  surfaceContainerLow: Color(0xff1D1B20),
  surface: ReferenceColor.n.shade10,
  surfaceContainer: ReferenceColor.n.shade10,
  surfaceContainerHigh: ReferenceColor.n.shade15,
  surfaceContainerHighest: ReferenceColor.n.shade20,
  outline: ReferenceColor.n.shade35,
  outlineVariant: ReferenceColor.n.shade40,
  onInverseSurface: ReferenceColor.n.shade0,
  onSurface: ReferenceColor.n.shade100,
  scrim: ReferenceColor.n.shade100.withOpacity(0.4),
  background: ReferenceColor.n.shade0,
  ///endregion
);
