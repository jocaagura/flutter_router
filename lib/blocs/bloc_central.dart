import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class BlocProvidersCentral {
  BlocProvidersCentral(BuildContext context) {
    _context = context;
    themeProvider = Provider.of<ThemeProvider>(_context);
  }

  late BuildContext _context;
  late ThemeProvider themeProvider;

  BuildContext get context => _context;

  void goToRoute(String route) {

  }

  void goNamed(String route,
      {Map<String, String> params = const {},
      Map<String, String> queryParams = const {}}) {

  }

  void setContext(BuildContext context) {
    _context = context;
  }
}
