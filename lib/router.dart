///
/// GoRouter object for Material App
///
import 'package:flutterblueprint/screens/home_page.dart';
import 'package:flutterblueprint/screens/settings_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutterblueprint/util/scaffold_with_navbar.dart';
import 'package:flutterblueprint/util/scaffold_with_navrail.dart';

class GoRouterInit {
  ///
  /// Navigation Keys for Routing.
  ///
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');

  static GoRouter goRouter = _init();

  static GoRouter getInstance() {
    return goRouter;
  }

  static GoRouter _init() {
    return GoRouter(
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
                        const SettingsPage()),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
