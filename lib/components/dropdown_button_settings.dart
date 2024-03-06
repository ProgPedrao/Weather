import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/theme/theme_provider.dart';

class DropdownButtonSettings extends StatefulWidget {
  const DropdownButtonSettings({super.key});

  @override
  State<DropdownButtonSettings> createState() => _DrodDownButtonState();
}

class _DrodDownButtonState extends State<DropdownButtonSettings> {
  final listTheme = ThemeMode.values;

  ThemeMode _onChanged(
      ThemeMode dropdownValue, ThemeMode? value, ThemeProvider themeProvider) {
    setState(() {
      dropdownValue = value!;
      themeProvider.toggleTheme(dropdownValue);
    });
    return dropdownValue;
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    ThemeMode dropdownValue = themeProvider.themeMode;

    return DropdownButton<ThemeMode>(
      onChanged: (value) {
        dropdownValue = _onChanged(dropdownValue, value, themeProvider);
      },
      value: dropdownValue,
      icon: const Icon(Icons.chevron_right),
      underline: const SizedBox(
        height: 0,
        width: 0,
      ),
      items: listTheme.map(
        (theme) {
          return DropdownMenuItem<ThemeMode>(
            value: theme,
            child: Text(
              themeProvider.translateTheme(context, theme),
            ),
          );
        },
      ).toList(),
    );
  }
}
