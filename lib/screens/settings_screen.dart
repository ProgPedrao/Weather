import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/components/app_drawer.dart';
import 'package:weather/components/dropdown_button_settings.dart';
import 'package:weather/components/settings_item.dart';
import 'package:weather/theme/theme_provider.dart';
import 'package:weather/utils/app_routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);

    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        //   title: const Text("Weather"),
        //   actions: [
        //     IconButton(onPressed: () {

        //     }, icon: const Icon(Icons.location_on))
        //   ],
        // ),
        drawer: const AppDrawer(),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(AppRoutes.home);
                    },
                    icon: const Icon(Icons.close)),
              ],
              // expandedHeight: 150,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 48.0),
                title: Padding(
                  padding: const EdgeInsets.only(top: 14.0, bottom: 0.0),
                  child: Text(
                    AppLocalizations.of(context)!.settings,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                centerTitle: false,
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      AppLocalizations.of(context)!.general_settings,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SettingsItem(
                    title: AppLocalizations.of(context)!.languages,
                    subtitle: null,
                    trailing: const Icon(Icons.chevron_right),
                    leading: Icons.language,
                    onTap: () {
                      Navigator.of(context).pushNamed(AppRoutes.languages);
                    },
                  ),
                  Consumer<ThemeProvider>(
                    builder: (context, value, child) => SettingsItem(
                      title: AppLocalizations.of(context)!.appearance,
                      subtitle: null,
                      trailing: const DropdownButtonSettings(),
                      leading: themeProvider.themeDataIcon,
                      onTap: () {},
                    ),
                  ),
                  SettingsItem(
                    title: AppLocalizations.of(context)!.rate_app,
                    subtitle: null,
                    trailing: const Icon(Icons.chevron_right),
                    leading: Icons.star_border,
                    onTap: () {},
                  ),
                  SettingsItem(
                    title: AppLocalizations.of(context)!.privacy_term,
                    subtitle: null,
                    trailing: const Icon(Icons.chevron_right),
                    leading: Icons.description_outlined,
                    onTap: () {},
                  ),
                  SettingsItem(
                    title: AppLocalizations.of(context)!.about_us,
                    subtitle: null,
                    trailing: const Icon(Icons.chevron_right),
                    leading: Icons.info_outline,
                    onTap: () {},
                  ),
                ],
              )
            ]))
          ],
        ));
  }
}
