import 'package:d_widget_app/config/menu/menu_items.dart';
import 'package:d_widget_app/presentation/screens/buttons/buttons_screen.dart';
import 'package:d_widget_app/presentation/screens/cards/cards_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter + Materia UI')),
      body: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color colorPrimary = Theme.of(context).colorScheme.primary;
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (BuildContext context, int index) {
        final menuItem = appMenuItems[index];
        return _CustomListTitle(menuItem: menuItem, colorPrimary: colorPrimary);
      },
    );
  }
}

class _CustomListTitle extends StatelessWidget {
  const _CustomListTitle({
    required this.menuItem,
    required this.colorPrimary,
  });

  final MenuItems menuItem;
  final Color colorPrimary;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        menuItem.icon,
        color: colorPrimary,
      ),
      title: Text(menuItem.title),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: colorPrimary,
      ),
      subtitle: Text(menuItem.subTitle),
      onTap: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(builder: (context) => ButtonsScreen()),
        // );
        // Navigator.pushNamed(context, menuItem.link);

        context.push(menuItem.link);

        // context.pushNamed(CardsScreen.name);
      },
    );
  }
}
