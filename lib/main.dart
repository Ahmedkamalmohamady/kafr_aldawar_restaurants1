import 'package:flutter/material.dart';

import 'screens/home/home_screen.dart';
import 'themes/themes.dart';


void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      title: 'مطاعم كفرالدوار',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      home: const HomeScreen(),
    );
  }
}