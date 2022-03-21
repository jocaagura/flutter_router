import 'package:flutter/material.dart';
import 'package:flutter_router/providers/theme_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            onPressed: () {
              themeProvider.setTextTheme(GoogleFonts.pacificoTextTheme());
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
