import 'package:bloc_base_project/core/init/theme/theme.dart';

abstract class IThemeManager {
  AppTheme getTheme();
  AppTheme getThemeFromString(String themeString);
  void saveTheme(AppTheme selectedTheme);
}
