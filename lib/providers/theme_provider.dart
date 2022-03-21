import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDark = false;
  ThemeData theme = ThemeData.from(
      colorScheme: lightColorScheme,
      textTheme: GoogleFonts.pacificoTextTheme());

  void switchLightAdnDarkTheme() {
    isDark = !isDark;
    isDark
        ? theme = theme.copyWith(
            colorScheme: darkColorScheme,
            textTheme: GoogleFonts.robotoTextTheme())
        : theme = theme.copyWith(
            colorScheme: lightColorScheme,
            textTheme: GoogleFonts.pacificoTextTheme());
    notifyListeners();
  }

  void setTextTheme(TextTheme? textTheme) {
    theme =
        theme.copyWith(textTheme: textTheme ?? GoogleFonts.robotoTextTheme());
    notifyListeners();
  }
}

const seed = Color(0xFF6750A4);

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF974800),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFFFDBC4),
  onPrimaryContainer: Color(0xFF321300),
  secondary: Color(0xFF8E4F00),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFFFDCBD),
  onSecondaryContainer: Color(0xFF2D1600),
  tertiary: Color(0xFF006D3D),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFF95F7B8),
  onTertiaryContainer: Color(0xFF00210E),
  error: Color(0xFFB3261E),
  errorContainer: Color(0xFFF9DEDC),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410E0B),
  background: Color(0xFFFFFBFE),
  onBackground: Color(0xFF1C1B1F),
  surface: Color(0xFFFFFBFE),
  onSurface: Color(0xFF1C1B1F),
  surfaceVariant: Color(0xFFE7E0EC),
  onSurfaceVariant: Color(0xFF49454F),
  outline: Color(0xFF79747E),
  onInverseSurface: Color(0xFFF4EFF4),
  inverseSurface: Color(0xFF313033),
  inversePrimary: Color(0xFFFFB683),
  shadow: Color(0xFF000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFFFB683),
  onPrimary: Color(0xFF512400),
  primaryContainer: Color(0xFF733500),
  onPrimaryContainer: Color(0xFFFFDBC4),
  secondary: Color(0xFFFFB772),
  onSecondary: Color(0xFF4B2700),
  secondaryContainer: Color(0xFF6C3B00),
  onSecondaryContainer: Color(0xFFFFDCBD),
  tertiary: Color(0xFF79DA9D),
  onTertiary: Color(0xFF00391D),
  tertiaryContainer: Color(0xFF00522C),
  onTertiaryContainer: Color(0xFF95F7B8),
  error: Color(0xFFF2B8B5),
  errorContainer: Color(0xFF8C1D18),
  onError: Color(0xFF601410),
  onErrorContainer: Color(0xFFF9DEDC),
  background: Color(0xFF1C1B1F),
  onBackground: Color(0xFFE6E1E5),
  surface: Color(0xFF1C1B1F),
  onSurface: Color(0xFFE6E1E5),
  surfaceVariant: Color(0xFF49454F),
  onSurfaceVariant: Color(0xFFCAC4D0),
  outline: Color(0xFF938F99),
  onInverseSurface: Color(0xFF1C1B1F),
  inverseSurface: Color(0xFFE6E1E5),
  inversePrimary: Color(0xFF974800),
  shadow: Color(0xFF000000),
);
