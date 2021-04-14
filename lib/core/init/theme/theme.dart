import 'package:bloc_base_project/core/init/theme/themedatas/red_dark_theme.dart';
import 'package:bloc_base_project/core/init/theme/themedatas/red_theme.dart';

class AppThemes {
  static final appThemeData = {
    AppTheme.LIGHT_THEME: redTheme,
    AppTheme.DARK_THEME: redDarkTheme,
  };
}

enum AppTheme {
  LIGHT_THEME,
  DARK_THEME,
}
