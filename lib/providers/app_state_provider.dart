import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../navigator/my_navigator.dart';
import '../root.dart';
import 'theme_provider.dart';

class AppStateProvider extends StatelessWidget {
  const AppStateProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context){
            return MyNavigator();
          },
        )
      ],
      child: const MyApp(),
    );
  }
}
