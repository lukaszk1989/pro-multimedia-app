import 'package:flutter/material.dart';
import 'package:pro_multimedia_app/src/config/themes/app_theme.dart';
import 'package:pro_multimedia_app/src/presentation/view/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: const MyHomePage(),
    );
  }
}

