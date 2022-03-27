import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'navigator/my_navigator.dart';
import 'providers/theme_provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
     final myNavigator = Provider.of<MyNavigator>(context);
    return MaterialApp(
      title: 'Navigator 2.0 with provider demo',
      theme: themeProvider.theme,
      home: Router(
        routerDelegate: myNavigator.myRouterDelegate,
        backButtonDispatcher: RootBackButtonDispatcher(),
      ),
    );
  }
}
