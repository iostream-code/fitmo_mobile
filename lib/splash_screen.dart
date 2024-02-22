import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:fitmo_mobile/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Center(
            child: LottieBuilder.asset("assets/animations/splash.json"),
          ),
          const Text(
            "Welcome to FitMo",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 26,
              shadows: [
                Shadow(
                  blurRadius: 10.0,
                  color: Colors.black38,
                  offset: Offset(5, 5),
                )
              ],
            ),
          ),
        ],
      ),
      nextScreen: const HomePage(),
      splashIconSize: 400,
      backgroundColor: const Color.fromARGB(255, 107, 159, 248),
    );
  }
}
