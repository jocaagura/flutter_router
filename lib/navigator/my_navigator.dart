import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../ui/pages/onboarding_page.dart';
import '../ui/pages/queries_page.dart';
import '../ui/pages/responsive_page.dart';

class MyNavigator extends ChangeNotifier {
  MyNavigator() {
    _router = GoRouter(
        urlPathStrategy: UrlPathStrategy.path,
        debugLogDiagnostics: true, // turn off in release mode
        routes: _routes);
  }

  late GoRouter _router;

  GoRouter get myRouter => _router;
  final history = <String>[];

  void testNewRoute() {
    notifyListeners();
  }

  goToRoute(BuildContext context, String route) {
    if (!history.contains(route)) {
      history.add(route);
      context.go(route);
      print(history);
    }
  }

  goBack(BuildContext context) {
    Navigator.maybePop(context);
  }
}

final List<GoRoute> _routes = [
  GoRoute(path: '/', builder: (context, state) => const OnBoardingPage()),
  GoRoute(path: '/home', builder: (context, state) => const ResponsivePage()),
  GoRoute(
      path: '/queries',
      builder: (context, state) {
        return QueriesPage(
            queries: state.params.toString(),
            value: state.queryParams.toString());
      }),
  GoRoute(
      path: '/segments/:hola',
      builder: (context, state) {
        return QueriesPage(
            queries: state.params.toString(),
            value: state.queryParams.toString());
      })
];
