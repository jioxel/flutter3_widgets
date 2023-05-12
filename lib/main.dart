import 'package:d_widget_app/config/theme/app_theme.dart';
import 'package:d_widget_app/presentation/screens/buttons/buttons_screen.dart';
import 'package:d_widget_app/presentation/screens/cards/cards_screen.dart';
import 'package:d_widget_app/presentation/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 1).getTheme(),
      home: const Scaffold(body: HomeScreen()),
      routes: {
        '/buttons': (context) => const ButtonsScreen(),
        '/card': (context) => const CardsScreen()
      },
    );
  }
}
