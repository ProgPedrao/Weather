import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/components/app_drawer.dart';
import 'package:weather/components/settings_item.dart';
import 'package:weather/theme/theme_provider.dart';
import 'package:weather/utils/app_routes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context, listen: false);

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
                    "Configurações",
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
                      "Configuração geral",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SettingsItem(
                    title: "Línguas",
                    subtitle: null,
                    trailing: Icons.chevron_right,
                    leading: Icons.language,
                    onTap: (){},
                  ),
                  SettingsItem(
                    title: "Aparência",
                    subtitle: null,
                    trailing: Icons.chevron_right,
                    leading: themeProvider.themeDataIcon,
                    onTap: () => themeProvider.toggleTheme(),
                  ),
                  SettingsItem(
                    title: "Avalie o aplicativo",
                    subtitle: null,
                    trailing: Icons.chevron_right,
                    leading: Icons.star_border,
                    onTap: (){},
                  ),
                  SettingsItem(
                    title: "Privacidade e prazo",
                    subtitle: null,
                    trailing: Icons.chevron_right,
                    leading: Icons.description_outlined,
                    onTap: (){},
                  ),
                  SettingsItem(
                    title: "Sobre nós",
                    subtitle: null,
                    trailing: Icons.chevron_right,
                    leading: Icons.info_outline,
                    onTap: (){},
                  ),
                ],
              )
            ]))
          ],
        ));
  }
}