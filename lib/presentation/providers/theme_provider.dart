import 'package:d_widget_app/config/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isDarkModeProvider = StateProvider<bool>((ref) => false);
final selectedColorProvider = StateProvider((ref) => 0);

//listado de colores inmutable
final colorListProvider = Provider((ref) => colorList);

// A object type AppTheme custom

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

class ThemeNotifier extends StateNotifier<AppTheme> {
  //Estado = new instance from AppTheme
  ThemeNotifier() : super(AppTheme());
  void toggleDarkmode() {
    state = state.copyWith(isDarkmode: !state.isDarkmode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
