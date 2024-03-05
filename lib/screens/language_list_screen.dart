import 'package:flag/flag.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:weather/l10n/locale_provider.dart';

class LanguageListScreen extends StatelessWidget {
  const LanguageListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleProvider localeProvider =
        Provider.of<LocaleProvider>(context, listen: false);

    final languages = L10n.allWithDescription;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(AppLocalizations.of(context)!.languages),
      ),
      body: ListView.builder(
        itemCount: languages.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              localeProvider.setLocale(L10n.allWithDescription[index].locale);
            },
            leading: Flag.fromCode(languages[index].flag, width: 32, height: 32,),
            title: Text(languages[index].language),
          );
        },
      ),
    );
  }
}
