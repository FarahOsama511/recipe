import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  CustomAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.green[800],
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: Icon(
        Icons.sort,
        size: 30,
        color: Colors.green[800],
      ),
      actions: [
        Icon(
          Icons.search,
          color: Colors.green[800],
          size: 30,
        )
      ],
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight); // Standard height for AppBar
}
