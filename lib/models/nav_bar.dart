import 'package:flutter/material.dart';

class NavBarItem {
  final String title;
  final String main;

  const NavBarItem({
    required this.title,
    required this.main,
  });
}

class SubNavActionItem {
  final String title;
  final IconData icon;
  final VoidCallback onPress;

  const SubNavActionItem({
    required this.title,
    required this.icon,
    required this.onPress,
  });
}

class NavActionItem {
  final String title;
  final IconData icon;
  final VoidCallback? onTap;
  Offset position;
  ValueNotifier<bool> isHovered;
  final List<SubNavActionItem>? subNavActionItem;

  NavActionItem({
    required this.title,
    required this.icon,
    this.position = Offset.zero,
    required this.isHovered,
    this.onTap,
    this.subNavActionItem,
  });
}
