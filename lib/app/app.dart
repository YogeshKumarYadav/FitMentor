import 'package:fit_mentor/app/slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/theme/dark_theme.dart';
import '../core/theme/light_theme.dart';
import '../core/theme/theme_provider.dart';


class FitMentor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'My App',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeProvider.themeMode,
          debugShowCheckedModeBanner: false,
          home: const SliderWidget()
        );
      },
    );
  }
}