/// FlutterBluePrint App
/// By Matt Walters
///!!Make sure to cite Open Source libraries!!

import 'package:flutter/material.dart';
import 'package:flutterblueprint/bloc/color_scheme.dart';
import 'package:flutterblueprint/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
