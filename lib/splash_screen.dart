import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:fitmo_mobile/pages/home/home_screen.dart';
import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Center(
            // child: LottieBuilder.asset("assets/animations/splash.json"),
            child: Image.asset(
              "assets/icon/fitness.png",
              scale: 2,
            ),
          ),
        ],
      ),
      nextScreen: const HomePage(),
      splashIconSize: 400,
      backgroundColor: Colors.white,
    );
  }
}
