/// FlutterBluePrint App
/// By Matt Walters
///!!Make sure to cite Open Source libraries!!

import 'package:flutter/material.dart';
import 'package:flutterblueprint/util/scaffold_with_navbar.dart';
import 'package:flutterblueprint/util/scaffold_with_navrail.dart';
import 'package:go_router/go_router.dart';

///
/// Entry Point of Application.
///
void main() {
  runApp(Root());
}

///
/// Navigation Keys for Routing.
///
final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

///
/// Highest level widget. Implements routing.
///
class Root extends StatelessWidget {
  Root({super.key});

  final GoRouter _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/home',
    routes: [
      // Shell creates a shell, where a screen will be placed into.
      // Even when the screens are changed (routing). Shell
      // remains in place!
      // StatefulShellRoute creates a seperate navigator for each screen.
      // Which is great when you want to preserve seperate navigation stacks
      // between screens.
      // I believe the indexedStack constuctor uses an indexed stack to maintain the
      // state of widgets.
      StatefulShellRoute.indexedStack(
        builder: (BuildContext context, GoRouterState state,
            StatefulNavigationShell navigationShell) {
          return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth < 450) {
                return ScaffoldWithNavBar(navigationShell: navigationShell);
              } else {
                return ScaffoldWithNavRail(navigationShell: navigationShell);
              }
            },
          );
        },
        branches: [
          // define branch and routes within branch (you can have routes in routes). Each branch has a navigator.
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                builder: (BuildContext context, GoRouterState state) =>
                    const HomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            // It's not necessary to provide a navigatorKey if it isn't also
            // needed elsewhere. If not provided, a default key will be used.
            routes: [
              GoRoute(
                  path: '/settings',
                  builder: (BuildContext context, GoRouterState state) =>
                      const Center(child: Text('settings'))),
            ],
          ),
        ],
      ),
    ],
  );

  // Defines how to build Root
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      themeMode: ThemeMode.dark,
      theme: ThemeData.from(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.light, seedColor: Colors.green),
      ),
      darkTheme: ThemeData.from(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.dark, seedColor: Colors.green),
      ),
      routerConfig: _router,
      title: 'FlutterBlueprint',
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
