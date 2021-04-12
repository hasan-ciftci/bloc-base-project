import 'package:bloc_base_project/core/constants/app/app_constants.dart';
import 'package:bloc_base_project/core/init/lang/language_manager.dart';
import 'package:bloc_base_project/presentation/views/login_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: LanguageManager.instance.supportedLocales,
      path: ApplicationConstants.LANG_ASSET_PATH,
      fallbackLocale: LanguageManager.instance.supportedLocales.first,
      child: BLoCBaseProject(),
    ),
  );
}

class BLoCBaseProject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      home: LoginView(),
    );
  }
}
