import 'package:d_widget_app/presentation/providers/counter_provider.dart';
import 'package:d_widget_app/presentation/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterScreen extends ConsumerWidget {
  static final name = 'counter-screen';
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int clickCounter = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch<bool>(isDarkModeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Scren use Riverpot'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                ref.read(isDarkModeProvider.notifier).update((state) => !state);
              },
              icon: isDarkMode
                  ? Icon(Icons.dark_mode_outlined)
                  : Icon(Icons.light_mode_outlined),
            ),
          )
        ],
      ),
      body: Center(
        child: Text(
          'Value: $clickCounter',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ref.read(counterProvider.notifier).state++;
          ref.read(counterProvider.notifier).update((state) => state + 1);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
