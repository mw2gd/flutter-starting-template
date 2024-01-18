/// FlutterBluePrint App
/// By Matt Walters
///!!Make sure to cite Open Source libraries!!

import 'package:flutter/material.dart';
import 'package:flutterblueprint/util/scaffold_with_navbar.dart';
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
          return ScaffoldWithNavBar(navigationShell: navigationShell);
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'FlutterBlueprint',
    );
  }
}

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
          const SliverAppBar(
            stretch: true,
            expandedHeight: 160,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text('Flight Report'),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
