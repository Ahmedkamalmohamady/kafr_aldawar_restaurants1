import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafr_aldawar_restaurants/bloc/theme/theme_bloc.dart';
import 'package:kafr_aldawar_restaurants/shared/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

import 'presentation/screens/splash/splash_screen.dart';

import 'shared/themes/themes.dart';


void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeBloc themeBloc = ThemeBloc();

  @override
  void initState() {
    themeBloc.add(InitialThemeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (ctx, state) {
        return state.runtimeType == DarkThemeState?
        MaterialApp(
          locale: const Locale('ar'),
          debugShowCheckedModeBanner: false,
          title: 'مطاعم كفرالدوار',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.dark,
          home: const SplashScreen(),
        ) :
        MaterialApp(
          locale: const Locale('ar'),
          debugShowCheckedModeBanner: false,
          title: 'مطاعم كفرالدوار',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.light,
          home: const SplashScreen(),
        );
      },
    );
  }
}