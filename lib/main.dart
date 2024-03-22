import 'package:firebase_core/firebase_core.dart';
import 'package:fitmo_mobile/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:fitmo_mobile/pages/activity/activity_screen.dart';
import 'package:fitmo_mobile/pages/home/home_screen.dart';
import 'package:fitmo_mobile/splash_screen.dart';

void main() async {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Permission.activityRecognition.request();
  await Permission.location.request();

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
        '/activity': (context) => const ActivityPage(),
      },
      initialRoute: '/loader',
    );
  }
}
