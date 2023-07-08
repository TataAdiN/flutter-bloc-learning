import 'package:bloc_learning/modules/detail/detail_page.dart';
import 'package:bloc_learning/modules/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Routers {
  static GoRouter get() {
    return GoRouter(routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'detail',
            pageBuilder: (BuildContext context, GoRouterState state) {
              return CustomTransitionPage(
                  child: const DetailPage(),
                  transitionsBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child) {
                    return SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(-1.0, 0.0),
                          end: Offset.zero,
                        ).animate(animation),
                        child: child);
                  });
            },
          ),
        ],
      ),
    ]);
  }
}
