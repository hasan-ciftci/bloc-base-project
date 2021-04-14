import 'package:bloc_base_project/core/constants/navigation/navigation_constants.dart';
import 'package:bloc_base_project/core/init/lang/language_manager.dart';
import 'package:bloc_base_project/core/init/navigation/navigation_service.dart';
import 'package:bloc_base_project/core/init/theme/theme.dart';
import 'package:bloc_base_project/core/init/theme/theme_manager.dart';
import 'package:bloc_base_project/presentation/blocs/theme/theme_bloc.dart';
import 'package:bloc_base_project/presentation/blocs/theme/theme_event.dart';
import 'package:bloc_base_project/presentation/widgets/locale_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
              onPressed: () {
                context.setLocale(LanguageManager.instance.enLocale);
              },
              child: Text("ENGLISH")),
          ElevatedButton(
              onPressed: () {
                context.setLocale(LanguageManager.instance.trLocale);
              },
              child: Text("TÜRKÇE")),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Switch(
                    value: ThemeManager.instance.getTheme() ==
                        AppTheme.LIGHT_THEME,
                    onChanged: (val) async {
                      _setTheme(val);
                    }),
                Text(
                  ThemeManager.instance.getTheme() == AppTheme.LIGHT_THEME
                      ? "Aydınlık"
                      : "Karanlık",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                await NavigationService.instance
                    .navigateToPageClear(path: NavigationConstants.LOGIN_VIEW);
              },
              child: LocaleText(value: "Geri Dön")),
        ],
      ),
    );
  }
}
