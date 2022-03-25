import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../navigator/my_navigator.dart';
import '../../providers/theme_provider.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Onboarding');
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigator 2.0 onBoarding'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              themeProvider.switchLightAdnDarkTheme();
            },
            child: Icon(themeProvider.isDark
                ? Icons.radio_button_off
                : Icons.radio_button_checked),
          ),
          const SizedBox(
            height: 10.0,
          ),
          FloatingActionButton(
            heroTag: null,
            onPressed: () {
              Provider.of<MyNavigator>(context, listen: false).goToRoute(context, '/home');
            },
            child: const Icon(Icons.edit),
          ),
        ],
      ),
      body: Center(
        child: Text(
          'OnBoarding',
          style: themeProvider.theme.textTheme.bodyLarge,
        ),
      ),
    );
  }
}
