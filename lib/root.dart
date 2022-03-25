import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'navigator/my_navigator.dart';
import 'providers/theme_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final myNavigator = Provider.of<MyNavigator>(context);
    print('reconstruyendo');



    return MaterialApp.router(
      title: 'Navigator 2.0 with provider demo',
      theme: themeProvider.theme,
      routerDelegate: myNavigator.myRouter.routerDelegate,
      routeInformationParser: myNavigator.myRouter.routeInformationParser,
    );
  }
}
