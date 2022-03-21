import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../root.dart';
import 'theme_provider.dart';

class AppStateProvider extends StatelessWidget {
  const AppStateProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
      child: const MyApp(),
    );
  }
}
