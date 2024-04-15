import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> actions;

  final String label;

  const CustomAppBar({
    super.key,
    this.actions = const [],
    required this.label,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        toolbarHeight: 60,
        actions: actions,
        title: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.normal),
        ));
  }
}
