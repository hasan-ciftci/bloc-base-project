import 'package:bloc_base_project/core/constants/navigation/navigation_constants.dart';
import 'package:bloc_base_project/core/init/lang/language_manager.dart';
import 'package:bloc_base_project/core/init/lang/locale_keys.g.dart';
import 'package:bloc_base_project/core/init/navigation/navigation_service.dart';
import 'package:bloc_base_project/core/init/theme/theme.dart';
import 'package:bloc_base_project/core/init/theme/theme_manager.dart';
import 'package:bloc_base_project/presentation/blocs/theme/theme_bloc.dart';
import 'package:bloc_base_project/presentation/blocs/theme/theme_event.dart';
import 'package:bloc_base_project/presentation/widgets/locale_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/navigation/navigation_constants.dart';
import '../../core/init/navigation/navigation_service.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  _loadTheme() {
    context
        .read<ThemeBloc>()
        .add(ThemeEvent(appTheme: ThemeManager.instance.getTheme()));
  }

  _setTheme(bool isDarkTheme) async {
    AppTheme selectedTheme =
        isDarkTheme ? AppTheme.LIGHT_THEME : AppTheme.DARK_THEME;
    context.read<ThemeBloc>().add(ThemeEvent(appTheme: selectedTheme));
    ThemeManager.instance.saveTheme(selectedTheme);
  }

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: LocaleText(value: LocaleKeys.settings_settings),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildThemeSettingsCard(),
          buildLanguageSettingsCard(context),
          GestureDetector(
            onTap: () {
              NavigationService.instance
                  .navigateToPage(path: NavigationConstants.PROFILE_VIEW);
            },
            child: Card(
              child: ListTile(
                title: Text("Profil"),
                subtitle: Text("Bilgilerimi g??r??nt??le"),
                trailing: Icon(
                  Icons.person,
                ),
              ),
            ),
          ),
          buildExitButton(),
        ],
      ),
    );
  }

  Card buildThemeSettingsCard() {
    return Card(
      child: ListTile(
        title: LocaleText(
          value: LocaleKeys.settings_themeSettings_themePreference,
        ),
        subtitle: LocaleText(
          value: LocaleKeys.settings_themeSettings_themeSubtitle,
        ),
        trailing: buildThemeSwitch(),
      ),
    );
  }

  Column buildThemeSwitch() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(
          child: Switch(
              value: ThemeManager.instance.getTheme() == AppTheme.LIGHT_THEME,
              onChanged: (val) async {
                _setTheme(val);
              }),
        ),
        Flexible(
          child: LocaleText(
            value: ThemeManager.instance.getTheme() == AppTheme.LIGHT_THEME
                ? LocaleKeys.settings_themeSettings_light
                : LocaleKeys.settings_themeSettings_dark,
          ),
        ),
      ],
    );
  }

  Card buildLanguageSettingsCard(BuildContext context) {
    return Card(
      child: ListTile(
        title: LocaleText(
          value: LocaleKeys.settings_languageSettings_LanguagePreference,
        ),
        subtitle: LocaleText(
          value: LocaleKeys.settings_languageSettings_languageSubtitle,
        ),
        trailing: buildLanguageDropdownButton(context),
      ),
    );
  }

  DropdownButton<Locale> buildLanguageDropdownButton(BuildContext context) {
    return DropdownButton(
      items: [
        DropdownMenuItem<Locale>(
          child: Text(
              LanguageManager.instance.trLocale.languageCode.toUpperCase()),
          value: LanguageManager.instance.trLocale,
        ),
        DropdownMenuItem(
          child: Text(
              LanguageManager.instance.enLocale.languageCode.toUpperCase()),
          value: LanguageManager.instance.enLocale,
        ),
      ],
      value: context.locale,
      onChanged: (value) {
        context.setLocale(value);
      },
    );
  }

  ElevatedButton buildExitButton() {
    return ElevatedButton(
        onPressed: () async {
          await NavigationService.instance
              .navigateToPageClear(path: NavigationConstants.LOGIN_VIEW);
        },
        child: LocaleText(value: LocaleKeys.settings_exit));
  }
}
