import 'package:d_widget_app/presentation/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeScreen extends ConsumerWidget {
  static const name = "theme_screen";
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isDarkmode = ref.watch(themeNotifierProvider).isDarkmode;
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme change'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                ref.read(themeNotifierProvider.notifier).toggleDarkmode();
                // ref.read(isDarkModeProvider.notifier).update((state) => !state);
              },
              icon: isDarkmode
                  ? Icon(Icons.dark_mode_outlined)
                  : Icon(Icons.light_mode_outlined),
            ),
          )
        ],
      ),
      body: _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, ref) {
    // final selectedColor = ref.watch(selectedColorProvider);
    final selectedColor = ref.watch(themeNotifierProvider).selectedColor;
    final List<Color> colors = ref.watch(colorListProvider);
    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final color = colors[index];
        return RadioListTile(
          title: Text(
            'This color',
            style: TextStyle(color: color),
          ),
          subtitle: Text('${color.value}'),
          activeColor: color,
          value: index,
          groupValue: selectedColor,
          onChanged: (value) {
            // ref.read(selectedColorProvider.notifier).state = index;
            ref.read(themeNotifierProvider.notifier).changeColorIndex(index);
          },
        );
      },
    );
  }
}
