import 'package:flutter/material.dart';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';

import '../../../bloc/restaurants/restaurants_bloc.dart';
import '../home/home_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final RestaurantsBloc postsBloc = RestaurantsBloc();

  @override
  void initState() {
    postsBloc.add(CategoriesInitialFetchEvent());
    postsBloc.add(RestaurantsInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AnimatedSplashScreen(
      duration: 1000,
      splashIconSize: 200,
      splash: Lottie.asset(
          'assets/lottie/splash.json',
          width: size.width * 0.5,
          height: size.height * 0.5,
          fit: BoxFit.contain
      ),
      backgroundColor: Theme.of(context).splashColor,
      nextScreen: const HomeScreen(),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}