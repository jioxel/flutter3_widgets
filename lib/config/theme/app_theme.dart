import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.red,
  Colors.purple,
  Colors.pink,
  Colors.orange,
  Colors.black
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0, 'Solected color must be up 0'),
        assert(selectedColor < colorList.length,
            'Solected color must be less or equal than ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorList[selectedColor],
      appBarTheme: const AppBarTheme(centerTitle: true));
}
