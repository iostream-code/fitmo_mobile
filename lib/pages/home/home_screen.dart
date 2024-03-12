import 'package:fitmo_mobile/pages/home/home_controller.dart';
import 'package:fitmo_mobile/pages/home/widgets/activity.dart';
import 'package:fitmo_mobile/pages/home/widgets/current.dart';
import 'package:fitmo_mobile/pages/home/widgets/header.dart';
import 'package:fitmo_mobile/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  // @override
  // void initState() {
  //   super.initState();
  //   controller.getData();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.getData(),
        child: const Icon(Icons.refresh),
      ),
      body: const Column(
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
