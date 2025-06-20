import 'package:flutter/material.dart';
import 'package:garden_shop/routes/index.dart';
import 'package:garden_shop/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: appRouter, theme: AppTheme.lightTheme);
  }
}
