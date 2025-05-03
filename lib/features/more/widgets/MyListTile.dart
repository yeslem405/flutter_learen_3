import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  const MyListTile(
      {super.key,
      required this.title,
      this.subtitle,
      required this.icon,
      this.onTap});
  final String title;
  final String? subtitle;
  final IconData icon;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text("${title}"),
      subtitle: Text("${subtitle}"),
      trailing: Icon(icon),
      leading: Icon(Icons.arrow_back_ios_rounded),
    );
  }
}
