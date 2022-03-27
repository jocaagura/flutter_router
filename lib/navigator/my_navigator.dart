import 'package:flutter/material.dart';

import '../ui/pages/onboarding_page.dart';
import '../ui/pages/queries_page.dart';
import '../ui/pages/segments_page.dart';

class MyNavigator extends ChangeNotifier {
  MyNavigator() {
    myRouterDelegate = MyRouterDelegate();
  }

  late MyRouterDelegate myRouterDelegate;

  List<Page<dynamic>> get listPages => myRouterDelegate.pages;
  int _count = 0;

  int get count => _count;

  void incrementCounter() {
    _count++;
    notifyListeners();
  }

  bool containsPageValueKey(String valueKey) {
    bool tmp = false;
    for (final page in listPages) {
      if (page.name == valueKey) {
        return true;
      }
    }
    return tmp;
  }

  int returnIndex(String valueKey) {
    int _index = -1;
    int _indexTmp = -1;
    for (final page in listPages) {
      _indexTmp++;
      if (page.name == valueKey) {
        _index = _indexTmp;
      }
    }
    return _index;
  }

  void pushNamed(String route, dynamic arguments) {
    myRouterDelegate.pushPage(name: route, arguments: arguments);
    _count++;
    notifyListeners();
  }

  void push(String valueKey, Widget widgetPage, [bool notifyListener = true]) {
    final page = MaterialPage(
        name: valueKey, key: ValueKey(valueKey), child: widgetPage);
    if (containsPageValueKey(valueKey)) {
      int _index = returnIndex(valueKey);
      if (_index > 0) {
        listPages.removeAt(_index);
      }
    }
    listPages.add(page);
  }

  void pop() {
    myRouterDelegate.popRoute();
  }
}

class MyRouterDelegate extends RouterDelegate<List<RouteSettings>>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<List<RouteSettings>> {
  final _pages = <Page>[];
  final _navigatorKey = GlobalKey<NavigatorState>();

  MyRouterDelegate() {
    pushPage(name: '/');
  }

  List<Page> get pages => _pages;

  @override
  List<Page> get currentConfiguration => List.of(_pages);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: currentConfiguration,
      onPopPage: _onPopPage,
    );
  }

  bool _onPopPage(Route route, dynamic result) {
    if (!route.didPop(result)) return false;
    popRoute();
    return true;
  }

  @override
  Future<bool> popRoute() {
    if (_pages.length > 1) {
      _pages.removeLast();
      notifyListeners();
      return Future.value(true);
    }
    return _confirmAppExit();
  }

  Future<bool> _confirmAppExit() async {
    Future<bool> tmp = Future.value(true);
    BuildContext? context = navigatorKey?.currentContext;
    if (context != null) {
      bool _tmp = await showDialog<bool>(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Exit app'),
                  content: const Text('Are you sure you want to exit the app?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text('Confrm'),
                    ),
                  ],
                );
              }) ??
          true;
      tmp = Future.value(_tmp);
    }
    return tmp;
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  @override
  Future<void> setNewRoutePath(List<RouteSettings> configuration) async {}

  MaterialPage _createPage(RouteSettings routeSettings) {
    Widget child = const OnBoardingPage();
    switch (routeSettings.name) {
      case '/':
        child = const OnBoardingPage();
        break;

      case '/segments':
        child = SegmentsPage(
            segment: routeSettings.arguments.toString(),
            value: routeSettings.arguments.toString());
        break;
      case '/queries':
        child = QueriesPage(
            queries: routeSettings.arguments.toString(),
            value: routeSettings.arguments.toString());
        break;
      default:
        child = Scaffold(
          appBar: AppBar(
            title: const Text('404 NOT FOUND'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '404',
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                routeSettings.arguments.toString(),
              ),
            ],
          ),
        );
        break;
    }
    return MaterialPage(
        child: child,
        key: ValueKey(routeSettings.name),
        name: routeSettings.name,
        arguments: routeSettings.arguments);
  }

  void pushPage({required String name, dynamic arguments}) {
    _pages.add(_createPage(RouteSettings(name: name, arguments: arguments)));
    notifyListeners();
  }
}
