import 'package:fitmo_mobile/pages/home/widgets/activity.dart';
import 'package:fitmo_mobile/pages/home/widgets/current.dart';
import 'package:fitmo_mobile/pages/home/widgets/header.dart';
import 'package:fitmo_mobile/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
