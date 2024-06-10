import 'package:fitmo_mobile/pages/statistic_page/widgets/appbar.dart';
import 'package:fitmo_mobile/pages/statistic_page/widgets/stats.dart';
import 'package:fitmo_mobile/pages/statistic_page/widgets/dates.dart';
import 'package:fitmo_mobile/pages/statistic_page/widgets/graph.dart';
import 'package:fitmo_mobile/pages/statistic_page/widgets/info.dart';
import 'package:fitmo_mobile/pages/statistic_page/widgets/steps.dart';
import 'package:fitmo_mobile/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';

class StatisticPage extends StatelessWidget {
  const StatisticPage({Key? key}) : super(key: key);

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
