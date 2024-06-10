import 'package:fitmo_mobile/pages/home_page/home_controller.dart';
import 'package:fitmo_mobile/pages/home_page/widgets/recent_activity.dart';
import 'package:fitmo_mobile/pages/home_page/widgets/programs.dart';
import 'package:fitmo_mobile/pages/home_page/widgets/header.dart';
import 'package:fitmo_mobile/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          AppHeader(),
          CurrentPrograms(),
          RecentActivities(),
          BottomNav(),
        ],
      ),
    );
  }
}
