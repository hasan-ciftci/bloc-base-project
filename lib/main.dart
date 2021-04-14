import 'package:bloc_base_project/core/constants/app/app_constants.dart';
import 'package:bloc_base_project/core/init/lang/language_manager.dart';
import 'package:bloc_base_project/presentation/blocs/theme/theme_bloc.dart';
import 'package:bloc_base_project/presentation/blocs/theme/theme_state.dart';
import 'package:bloc_base_project/presentation/views/login_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/init/navigation/navigation_routes.dart';
import 'core/init/navigation/navigation_service.dart';

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
    return BlocProvider(
      create: (BuildContext context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (BuildContext context, ThemeState themeState) {
          return MaterialApp(
            theme: themeState.themeData,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            navigatorKey: NavigationService.instance.navigatorKey,
            onGenerateRoute: NavigationRoutes.instance.generateRoute,
            home: LoginView(),
          );
        },
      ),
    );
  }
}
