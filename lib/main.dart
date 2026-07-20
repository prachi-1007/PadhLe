import 'package:flutter/material.dart';
import 'screens/splash.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const PadhLe());
}

class PadhLe extends StatelessWidget {
  const PadhLe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PadhLe',

      theme: AppTheme.lightTheme,

      home: const SplashScreen(),
    );
  }
}