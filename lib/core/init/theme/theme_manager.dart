import 'dart:convert';

import 'package:bloc_base_project/core/constants/app/preferences_constants.dart';
import 'package:bloc_base_project/core/init/preferences/preferences_manager.dart';
import 'package:bloc_base_project/core/init/theme/theme.dart';

import 'IThemeManager.dart';

class ThemeManager implements IThemeManager {
  static ThemeManager _instance = ThemeManager._init();

  static ThemeManager get instance => _instance;

  ThemeManager._init();

  @override
  AppTheme getTheme() {
    String theme = PreferencesManager.instance
        .getStringValue(PreferencesKeys.SELECTED_THEME);
    if (theme == null || theme.isEmpty) {
      return AppTheme.LIGHT_THEME;
    }
    return getThemeFromString(jsonDecode(theme));
  }

  @override
  AppTheme getThemeFromString(String themeString) {
    for (AppTheme theme in AppTheme.values) {
      if (theme.toString() == themeString) {
        return theme;
      }
    }
    return null;
  }

  @override
  void saveTheme(AppTheme selectedTheme) {
    if (selectedTheme == null) {
      selectedTheme = AppTheme.LIGHT_THEME;
    }
    String theme = jsonEncode(selectedTheme.toString());
    PreferencesManager.instance
        .setStringValue(PreferencesKeys.SELECTED_THEME, theme);
  }
}
