import 'package:fitmo_mobile/pages/activity_page/widgets/activity_banner.dart';
import 'package:fitmo_mobile/pages/activity_page/widgets/activity_header.dart';
import 'package:fitmo_mobile/pages/activity_page/widgets/activity_list.dart';
import 'package:fitmo_mobile/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          ActivityHeader(),
          ActivityBanner(),
          ActivityList(),
          BottomNav(),
        ],
      ),
    );
  }
}
