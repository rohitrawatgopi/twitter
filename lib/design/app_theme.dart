import 'package:flutter/material.dart';

class AppTheme {
  static ColorScheme darkTheme = MaterialTheme.lightScheme;
  static ColorScheme lightTheme = MaterialTheme.darkScheme;
}

class MaterialTheme {
  static ColorScheme lightScheme = const ColorScheme(
    brightness: Brightness.light,
    primary: Color(4278217319),
    surfaceTint: Color(4278217319),
    onPrimary: Color(4294967295),
    primaryContainer: Color(4288475629),
    onPrimaryContainer: Color(4278198303),
    secondary: Color(4283065186),
    onSecondary: Color(4294967295),
    secondaryContainer: Color(4291619046),
    onSecondaryContainer: Color(4278525727),
    tertiary: Colors.white,
    onTertiary: Color(4294967295),
    tertiaryContainer: Color(4291945727),
    onTertiaryContainer: Color(4278328629),
    error: Color(4290386458),
    onError: Color(4294967295),
    errorContainer: Color(4294957782),
    onErrorContainer: Color(4282449922),
    surface: Color(4294245369),
    onSurface: Color(4279639324),
    onSurfaceVariant: Color(4282337608),
    outline: Color(4285495672),
    outlineVariant: Color(4290693575),
    shadow: Color(4278190080),
    scrim: Color(4278190080),
    inverseSurface: Color(4281020977),
    inversePrimary: Color(4286633425),
    primaryFixed: Color(4288475629),
    onPrimaryFixed: Color(4278198303),
    primaryFixedDim: Color(4286633425),
    onPrimaryFixedVariant: Color(4278210638),
    secondaryFixed: Color(4291619046),
    onSecondaryFixed: Color(4278525727),
    secondaryFixedDim: Color(4289776842),
    onSecondaryFixedVariant: Color(4281486154),
    tertiaryFixed: Color(4291945727),
    onTertiaryFixed: Color(4278328629),
    tertiaryFixedDim: Color(4289841384),
    onTertiaryFixedVariant: Color(4281485410),
    surfaceDim: Color(4292205530),
    surfaceBright: Color(4294245369),
    surfaceContainerLowest: Color(4294967295),
    surfaceContainerLow: Color(4293916148),
    surfaceContainer: Color(4293521390),
    surfaceContainerHigh: Color(4293126632),
    surfaceContainerHighest: Color(4292732131),
  );

  static ColorScheme darkScheme = const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(4286633425),
    surfaceTint: Color(4286633425),
    onPrimary: Color(4278204214),
    primaryContainer: Color(4278210638),
    onPrimaryContainer: Color(4288475629),
    secondary: Color(4289776842),
    onSecondary: Color(4279973172),
    secondaryContainer: Color(4281486154),
    onSecondaryContainer: Color(4291619046),
    tertiary: Colors.black,
    onTertiary: Color(4279906891),
    tertiaryContainer: Color(4281485410),
    onTertiaryContainer: Color(4291945727),
    error: Color(4294948011),
    onError: Color(4285071365),
    errorContainer: Color(4287823882),
    onErrorContainer: Color(4294957782),
    surface: Color(4279112980),
    onSurface: Color(4292732131),
    onSurfaceVariant: Color(4290693575),
    outline: Color(4287140754),
    outlineVariant: Color(4282337608),
    shadow: Color(4278190080),
    scrim: Color(4278190080),
    inverseSurface: Color(4292732131),
    inversePrimary: Color(4278217319),
    primaryFixed: Color(4288475629),
    onPrimaryFixed: Color(4278198303),
    primaryFixedDim: Color(4286633425),
    onPrimaryFixedVariant: Color(4278210638),
    secondaryFixed: Color(4291619046),
    onSecondaryFixed: Color(4278525727),
    secondaryFixedDim: Color(4289776842),
    onSecondaryFixedVariant: Color(4281486154),
    tertiaryFixed: Color(4291945727),
    onTertiaryFixed: Color(4278328629),
    tertiaryFixedDim: Color(4289841384),
    onTertiaryFixedVariant: Color(4281485410),
    surfaceDim: Color(4279112980),
    surfaceBright: Color(4281612858),
    surfaceContainerLowest: Color(4278783759),
    surfaceContainerLow: Color(4279639324),
    surfaceContainer: Color(4279902496),
    surfaceContainerHigh: Color(4280625963),
    surfaceContainerHighest: Color(4281284149),
  );
}
