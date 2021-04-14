import 'package:bloc/bloc.dart';
import 'package:bloc_base_project/core/init/theme/theme.dart';
import 'package:bloc_base_project/presentation/blocs/theme/theme_event.dart';
import 'package:bloc_base_project/presentation/blocs/theme/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ThemeState(
            themeData: AppThemes.appThemeData[AppTheme.LIGHT_THEME]));

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if (event is ThemeEvent) {
      yield ThemeState(
        themeData: AppThemes.appThemeData[event.appTheme],
      );
    }
  }
}
