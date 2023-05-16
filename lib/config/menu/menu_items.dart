import 'package:flutter/material.dart';

class MenuItems {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItems(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItems>[
  MenuItems(
      title: 'Counter',
      subTitle: 'Counter screen use Riverpot',
      link: '/counter',
      icon: Icons.add),
  MenuItems(
      title: 'Buttons',
      subTitle: 'Some buttons',
      link: '/buttons',
      icon: Icons.smart_button_outlined),
  MenuItems(
      title: 'Cards',
      subTitle: 'a container styled',
      link: '/cards',
      icon: Icons.credit_card),
  MenuItems(
      title: 'ProgressIndicator',
      subTitle: 'Generics and controller',
      link: '/progress',
      icon: Icons.refresh_rounded),
  MenuItems(
      title: 'Snackbar',
      subTitle: 'Snackbar',
      link: '/snackbar',
      icon: Icons.info_outline),
  MenuItems(
      title: 'Animated',
      subTitle: 'few animated',
      link: '/animated',
      icon: Icons.animation),
  MenuItems(
      title: 'Ui Controlls ',
      subTitle: 'controlled ui',
      link: '/ui-controls',
      icon: Icons.check_box_outlined),
  MenuItems(
      title: 'Cards',
      subTitle: 'a container styled',
      link: '/cards',
      icon: Icons.credit_card),
  MenuItems(
      title: 'Tutorial',
      subTitle: 'Introduction to app',
      link: '/tutorial',
      icon: Icons.tungsten),
  MenuItems(
      title: 'Infinity Scroll and Pull',
      subTitle: 'You could see a infinity scroll pages',
      link: '/infinityScroll',
      icon: Icons.list_alt_rounded),
];
