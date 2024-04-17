import 'package:fitmo_mobile/pages/activity/widgets/appbar.dart';
import 'package:fitmo_mobile/pages/activity/widgets/stats.dart';
import 'package:fitmo_mobile/pages/activity/widgets/dates.dart';
import 'package:fitmo_mobile/pages/activity/widgets/graph.dart';
import 'package:fitmo_mobile/pages/activity/widgets/info.dart';
import 'package:fitmo_mobile/pages/activity/widgets/steps.dart';
import 'package:fitmo_mobile/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        appBar: AppBar(),
      ),
      body: const Column(
        children: [
          Dates(),
          Steps(),
          Graph(),
          Info(),
          Stats(),
          BottomNav(),
        ],
      ),
    );
  }
}
