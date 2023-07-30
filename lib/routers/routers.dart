import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../modules/auth/auth_page.dart';
import '../modules/home/home_page.dart';
import '../modules/product/product_page.dart';

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
            name: 'auth',
            path: 'auth',
            pageBuilder: (BuildContext context, GoRouterState state) {
              return CustomTransitionPage(
                  child: const AuthPage(),
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
          GoRoute(
            name: 'post',
            path: 'post',
            pageBuilder: (BuildContext context, GoRouterState state) {
              return CustomTransitionPage(
                  child: const ProductPage(),
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
    ], redirect: (BuildContext context, GoRouterState state) {});
  }
}
