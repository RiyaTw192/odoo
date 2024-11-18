import 'package:bloc/bloc.dart';
import 'package:oddo_fe/config/theme/app_theme/theme.dart';
import 'package:oddo_fe/config/theme/app_theme/theme_event.dart';
import 'package:oddo_fe/config/theme/app_theme/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ThemeState(themeData: AppThemes.lightTheme, isDarkMode: false)) {
    on<AppThemeEvent>((event, emit) {
      if (event.isDarkMode) {
        emit(ThemeState(themeData: AppThemes.darkTheme, isDarkMode: true));
      } else {
        emit(ThemeState(themeData: AppThemes.lightTheme, isDarkMode: false));
      }
    });
  }
}
