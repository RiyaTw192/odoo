abstract class ThemeEvent {}

class AppThemeEvent extends ThemeEvent {
  final bool isDarkMode;

  AppThemeEvent(this.isDarkMode);
}
