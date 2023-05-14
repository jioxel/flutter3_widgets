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
      title: 'Cards',
      subTitle: 'a container styled',
      link: '/cards',
      icon: Icons.credit_card),
  MenuItems(
      title: 'Cards',
      subTitle: 'a container styled',
      link: '/cards',
      icon: Icons.credit_card),
  MenuItems(
      title: 'Cards',
      subTitle: 'a container styled',
      link: '/cards',
      icon: Icons.credit_card),
  MenuItems(
      title: 'Cards',
      subTitle: 'a container styled',
      link: '/cards',
      icon: Icons.credit_card),
];
