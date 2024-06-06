import 'package:firebase_core/firebase_core.dart';
import 'package:fitmo_mobile/firebase_options.dart';
import 'package:fitmo_mobile/pages/profile/profile_page.dart';
import 'package:fitmo_mobile/pages/records/record_page.dart';
import 'package:fitmo_mobile/pages/reports/report_page.dart';
import 'package:fitmo_mobile/pages/records/widgets/record_data_add.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:fitmo_mobile/pages/activity/activity_page.dart';
import 'package:fitmo_mobile/pages/home/home_page.dart';
import 'package:fitmo_mobile/splash_screen.dart';

void main() async {
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
        useMaterial3: true,
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
        '/record': (context) => const RecordPage(),
        '/record/add': (context) => const RecordDataAdd(),
        '/report': (context) => const ReportPage(),
        '/activity': (context) => const ActivityPage(),
        '/profile': (context) => const ProfilePage(),
      },
      initialRoute: '/loader',
    );
  }
}
