import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../pages/base/base_page.dart';
// import '../../pages/chat/chat_page.dart';
import '../../pages/gyms/gym_details_page.dart';
import '../../pages/gyms/gyms_page.dart';
import '../../pages/gyms/models/gym_model.dart';
import '../../pages/gyms/models/gyms_model.dart';
import '../../pages/map/map_page.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);

// GoRouter configuration
final router = GoRouter(
  debugLogDiagnostics: true,
  observers: [AnalyticsRouteObserver()],
  initialLocation: BasePage.path,
  navigatorKey: rootNavigatorKey,
  routes: [
    GoRoute(
      path: BasePage.path,
      name: BasePage.name,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return _pageBuilder(child: const BasePage(), state: state);
      },
    ),
    GoRoute(
      path: GymsPage.path,
      name: GymsPage.name,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return _pageBuilder(child: const GymsPage(), state: state);
      },
      routes: [
        GoRoute(
          path: GymDetailsPage.path,
          name: GymDetailsPage.name,
          pageBuilder: (BuildContext context, GoRouterState state) {
            final GymModel gymModel = state.extra as GymModel;

            return _pageBuilder(
              child: GymDetailsPage(gymModel: gymModel),
              state: state,
            );
          },
        ),
      ],
    ),

    // GoRoute(
    //   path: ChatPage.path,
    //   name: ChatPage.name,
    //   pageBuilder: (BuildContext context, GoRouterState state) {
    //     return _pageBuilder(child: const ChatPage(), state: state);
    //   },
    // ),
    GoRoute(
      path: MapsScreen.path,
      name: MapsScreen.name,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return _pageBuilder(child: MapsScreen(), state: state);
      },
    ),
  ],
);

Page<dynamic> _pageBuilder<T>({
  required GoRouterState state,
  required Widget child,
}) => Platform.isIOS
    ? CupertinoPage<T>(child: child, name: state.name, key: state.pageKey)
    : MaterialPage<T>(child: child, name: state.name, key: state.pageKey);

class AnalyticsRouteObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) async {}

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
  }
}

extension GoRouterBX on GoRouter {
  BuildContext get context => routerDelegate.navigatorKey.currentContext!;
}

extension GoRouterExtension on GoRouter {
  // Navigate back to a specific route
  void popUntilPath(String ancestorPath) {
    while (routerDelegate.currentConfiguration.matches.last.matchedLocation !=
        ancestorPath) {
      if (!canPop()) {
        return;
      }
      pop();
    }
  }
}
