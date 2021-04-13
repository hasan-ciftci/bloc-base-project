import 'package:bloc_base_project/core/constants/navigation/navigation_constants.dart';
import 'package:bloc_base_project/core/init/lang/language_manager.dart';
import 'package:bloc_base_project/core/init/navigation/navigation_service.dart';
import 'package:bloc_base_project/presentation/widgets/locale_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
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
          ElevatedButton(
              onPressed: () {
                NavigationService.instance
                    .navigateToPage(path: NavigationConstants.LOGIN_VIEW);
              },
              child: LocaleText(value: "Geri Dön")),
        ],
      ),
    );
  }
}
