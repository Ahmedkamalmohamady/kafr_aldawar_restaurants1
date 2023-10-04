import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafr_aldawar_restaurants/bloc/restaurants/restaurants_bloc.dart';
import 'package:kafr_aldawar_restaurants/bloc/theme/theme_bloc.dart';
import 'package:kafr_aldawar_restaurants/shared/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

import 'presentation/screens/splash/splash_screen.dart';

import 'shared/themes/themes.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (ctx, state) =>
              MaterialApp(
                locale: const Locale('ar'),
                debugShowCheckedModeBanner: false,
                title: 'مطاعم كفرالدوار',
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: state.runtimeType == DarkThemeState ?
                ThemeMode.dark : ThemeMode.light,
                home: BlocProvider(
                  create: (context) => RestaurantsBloc(),
                  child: const SplashScreen(),
                ),
              )
      ),
    );
  }
}