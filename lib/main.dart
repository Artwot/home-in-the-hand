import 'package:animated_splash/animated_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_in_the_hand/Screens/welcome_screen/welcome_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplash(
        imagePath: 'assets/images/logo.jpeg',
        home: WelcomeScreen(),
        duration: 2500,
        type: AnimatedSplashType.StaticDuration,
      ),
    );
  }
}
