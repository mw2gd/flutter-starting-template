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
            )
          ],
        )
      ],
    ));
  }
}
