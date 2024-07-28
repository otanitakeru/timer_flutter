import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:timer_flutter/page/count_down/count_down.dart';
import 'package:timer_flutter/page/count_up/count_up_page.dart';
import 'package:timer_flutter/page/home/home_page.dart';

void main() {
  return runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
    GoRoute(
        path: '/count_up',
        builder: (BuildContext context, GoRouterState state) {
          return const CountUpPage();
        }),
    GoRoute(
        path: '/count_down',
        builder: (BuildContext context, GoRouterState state) {
          return const CountDownPage();
        }),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: false,
      ),
      routerConfig: _router,
      debugShowCheckedModeBanner: true,
    );
  }
}
