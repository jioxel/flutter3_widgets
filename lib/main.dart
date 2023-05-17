import 'package:d_widget_app/config/router/app_router.dart';
import 'package:d_widget_app/config/theme/app_theme.dart';
import 'package:d_widget_app/presentation/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(child: MainApp()),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final selectColor = ref.watch(selectedColorProvider);
    // final isDarkmode = ref.watch(isDarkModeProvider);
    final appTheme = ref.watch(themeNotifierProvider);
    return MaterialApp.router(
      title: 'Futter Widgets',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: appTheme.getTheme(),
    );
  }
}
