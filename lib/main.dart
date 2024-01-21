/// FlutterBluePrint App
/// By Matt Walters
///!!Make sure to cite Open Source libraries!!

import 'package:flutter/material.dart';
import 'package:flutterblueprint/bloc/color_scheme.dart';
import 'package:flutterblueprint/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_ui/settings_ui.dart';

///
/// Entry Point of Application.
///
void main() {
  runApp(const Root());
}

///
/// Highest level widget. Implements routing.
///
class Root extends StatelessWidget {
  const Root({super.key});

  // Defines how to build Root
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) =>
                ColorSchemeBloc(MediaQuery.of(context).platformBrightness))
      ],
      child: BlocBuilder<ColorSchemeBloc, ColorSchemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            themeMode: state.brightness,
            theme: ThemeData.from(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(
                  brightness: Brightness.light, seedColor: state.color),
            ),
            darkTheme: ThemeData.from(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(
                  brightness: Brightness.dark, seedColor: state.color),
            ),
            routerConfig: GoRouterInit.getInstance(),
            title: 'FlutterBlueprint',
          );
        },
      ),
    );
  }
}

///
/// Sample Home Page
///
class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: <Widget>[
          SliverAppBar(
            forceElevated:
                false, // Set to True and set elevation to four surface tint on appbar
            scrolledUnderElevation: 0,
            elevation: 0,
            pinned: true,
            stretch: true,
            expandedHeight: 80,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                'Flutter Blueprint',
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onSurface),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              const <Widget>[
                ListTile(
                  leading: Icon(Icons.wb_sunny),
                  title: Text('Sunday'),
                  subtitle: Text('sunny, h: 80, l: 65'),
                ),
                ListTile(
                  leading: Icon(Icons.wb_sunny),
                  title: Text('Monday'),
                  subtitle: Text('sunny, h: 80, l: 65'),
                ),
                ListTile(
                  leading: Icon(Icons.wb_sunny),
                  title: Text('Sunday'),
                  subtitle: Text('sunny, h: 80, l: 65'),
                ),
                ListTile(
                  leading: Icon(Icons.wb_sunny),
                  title: Text('Monday'),
                  subtitle: Text('sunny, h: 80, l: 65'),
                ),
                ListTile(
                  leading: Icon(Icons.wb_sunny),
                  title: Text('Sunday'),
                  subtitle: Text('sunny, h: 80, l: 65'),
                ),
                ListTile(
                  leading: Icon(Icons.wb_sunny),
                  title: Text('Monday'),
                  subtitle: Text('sunny, h: 80, l: 65'),
                ),
                ListTile(
                  leading: Icon(Icons.wb_sunny),
                  title: Text('Sunday'),
                  subtitle: Text('sunny, h: 80, l: 65'),
                ),
                ListTile(
                  leading: Icon(Icons.wb_sunny),
                  title: Text('Monday'),
                  subtitle: Text('sunny, h: 80, l: 65'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

///
/// Sample Settings Page
///
class SettingsPage extends StatefulWidget {
  const SettingsPage({
    super.key,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    bool darkMode =
        context.read<ColorSchemeBloc>().state.brightness == ThemeMode.dark;

    Color? colorSeed = context.read<ColorSchemeBloc>().state.color;

    return Scaffold(
        body: ListView(
      children: [
        Column(
          children: [
            Card(
                elevation: 0,
                color: Colors.transparent,
                child: ListTile(
                  title: Text(
                    "Display",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                )),
            Card(
              child: ListTile(
                title: const Text("Dark Mode"),
                trailing: Switch(
                    value: darkMode,
                    onChanged: (bool value) {
                      setState(() {
                        darkMode = !darkMode;
                      });
                      context.read<ColorSchemeBloc>().add(BrightnessChange(
                          newBrightness:
                              value ? ThemeMode.dark : ThemeMode.light));
                    }),
              ),
            ),
            Card(
              child: ListTile(
                title: Row(
                  children: [
                    const Text("Theme Color"),
                    Spacer(),
                    Radio<Color>(
                        hoverColor: ColorSeeds.green.withOpacity(.5),
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => ColorSeeds.green),
                        value: ColorSeeds.green,
                        groupValue: colorSeed,
                        onChanged: (Color? color) {
                          setState(() {
                            colorSeed = color;
                          });
                          context.read<ColorSchemeBloc>().add(
                              ColorSchemeChange(newColor: ColorSeeds.green));
                        }),
                    Radio<Color>(
                        hoverColor: ColorSeeds.grey.withOpacity(.5),
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => ColorSeeds.grey),
                        value: ColorSeeds.grey,
                        groupValue: colorSeed,
                        onChanged: (Color? color) {
                          setState(() {
                            colorSeed = color;
                          });
                          context.read<ColorSchemeBloc>().add(
                              ColorSchemeChange(newColor: ColorSeeds.grey));
                        }),
                    Radio<Color>(
                        hoverColor: ColorSeeds.red.withOpacity(.5),
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => ColorSeeds.red),
                        value: ColorSeeds.red,
                        groupValue: colorSeed,
                        onChanged: (Color? color) {
                          setState(() {
                            colorSeed = color;
                          });
                          context
                              .read<ColorSchemeBloc>()
                              .add(ColorSchemeChange(newColor: ColorSeeds.red));
                        })
                  ],
                ),
              ),
            )
          ],
        )
      ],
    ));
  }
}
