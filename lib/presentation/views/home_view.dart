import 'package:bloc_base_project/core/init/lang/language_manager.dart';
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
              child: LocaleText(value: "ENGLISH")),
          ElevatedButton(
              onPressed: () {
                context.setLocale(LanguageManager.instance.trLocale);
              },
              child: LocaleText(value: "TÜRKÇE")),
        ],
      ),
    );
  }
}
