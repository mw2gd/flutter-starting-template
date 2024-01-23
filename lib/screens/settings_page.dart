import 'package:flutter/material.dart';
import 'package:flutterblueprint/bloc/color_scheme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//
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
        AppBar(
            centerTitle: true,
            scrolledUnderElevation: 0,
            title: const Text(
              "Settings",
            )),
        Column(
          children: [
            Card(
                elevation: 0,
                color: Colors.transparent,
                child: ListTile(
                  title: Text(
                    "Display",
                    style: Theme.of(context).textTheme.titleMedium,
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
                    const Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      flex: 5,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Wrap(
                          children: [
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
                                      ColorSchemeChange(
                                          newColor: ColorSeeds.green));
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
                                      ColorSchemeChange(
                                          newColor: ColorSeeds.grey));
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
                                  context.read<ColorSchemeBloc>().add(
                                      ColorSchemeChange(
                                          newColor: ColorSeeds.red));
                                }),
                            Radio<Color>(
                                hoverColor: ColorSeeds.yellow.withOpacity(.5),
                                fillColor: MaterialStateColor.resolveWith(
                                    (states) => ColorSeeds.yellow),
                                value: ColorSeeds.yellow,
                                groupValue: colorSeed,
                                onChanged: (Color? color) {
                                  setState(() {
                                    colorSeed = color;
                                  });
                                  context.read<ColorSchemeBloc>().add(
                                      ColorSchemeChange(
                                          newColor: ColorSeeds.yellow));
                                }),
                            Radio<Color>(
                                hoverColor: ColorSeeds.purple.withOpacity(.5),
                                fillColor: MaterialStateColor.resolveWith(
                                    (states) => ColorSeeds.purple),
                                value: ColorSeeds.purple,
                                groupValue: colorSeed,
                                onChanged: (Color? color) {
                                  setState(() {
                                    colorSeed = color;
                                  });
                                  context.read<ColorSchemeBloc>().add(
                                      ColorSchemeChange(
                                          newColor: ColorSeeds.purple));
                                }),
                            Radio<Color>(
                                hoverColor: ColorSeeds.blue.withOpacity(.5),
                                fillColor: MaterialStateColor.resolveWith(
                                    (states) => ColorSeeds.blue),
                                value: ColorSeeds.blue,
                                groupValue: colorSeed,
                                onChanged: (Color? color) {
                                  setState(() {
                                    colorSeed = color;
                                  });
                                  context.read<ColorSchemeBloc>().add(
                                      ColorSchemeChange(
                                          newColor: ColorSeeds.blue));
                                })
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
                elevation: 0,
                color: Colors.transparent,
                child: ListTile(
                  title: Text(
                    "Other",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                )),
            Card(
              child: ListTile(
                leading: const Icon(Icons.info),
                title: const Text("Credits"),
                trailing: const Icon(Icons.arrow_forward_ios_rounded),
                onTap: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    scrollable: true,
                    title: const Text(
                      'Acknowledgements',
                      softWrap: false,
                    ),
                    content: const Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    ));
  }
}
