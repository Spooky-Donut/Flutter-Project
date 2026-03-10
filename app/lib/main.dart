import 'package:flutter/material.dart';
import 'ui/pages/login/login_page.dart';
import 'ui/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eva',
      theme: AppTheme.theme,
      home: const LoginPage(title: 'Flutter Demo Home Page'),
    );
  }
}