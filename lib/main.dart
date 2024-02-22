import 'package:fitmo_mobile/pages/activity/activity_screen.dart';
import 'package:fitmo_mobile/pages/home/home_screen.dart';
import 'package:fitmo_mobile/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness Monitoring',
      theme: ThemeData(
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      // home: const SplashScreen(),
      routes: {
        '/loader': (context) => const SplashScreen(),
        '/': (context) => const HomePage(),
        '/activity': (context) => const DetailsPage(),
      },
      initialRoute: '/loader',
    );
  }
}
