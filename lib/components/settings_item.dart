import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({super.key, required this.title, required this.subtitle, required this.trailing, required this.leading, required this.onTap});

  final String title;
  final String? subtitle;
  final Widget trailing;
  final IconData leading;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () { onTap(); },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(2))),
        child: ListTile(
          leading: Icon(leading),
          title: Text(title),
          subtitle: subtitle == null ? null : Text(subtitle!),
          trailing: trailing,
        ),
      ),
    );
  }
}
