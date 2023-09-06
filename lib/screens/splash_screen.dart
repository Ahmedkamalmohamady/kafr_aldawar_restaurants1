import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kafr_aldawar_restaurants/screens/detils_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<Offset>? _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Curves.easeInOut,
      ),
    );

    _animationController!.forward();
    ///this hide status bar and navigation bar during splash screen
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    Future.delayed(const Duration(milliseconds: 3000), () {
      ///this restore navbar and status bar
     // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DetailsScreen()),
      );
    });
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SlideTransition(
        position: _slideAnimation!,
        child: Center(
          child: Image.asset(
            'assets/images/categories/pizza.png',width: 150,height: 150, // Replace 'your_photo.png' with the path to your photo
            // Specify the desired height
          ),
        ),
      ),
    );
  }
}