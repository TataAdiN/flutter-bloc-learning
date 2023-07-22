import 'package:bloc_learning/modules/auth/auth_page.dart';
import 'package:bloc_learning/modules/home/home_page.dart';
import 'package:bloc_learning/modules/post/post_page.dart';
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
                  child: const PostPage(),
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
