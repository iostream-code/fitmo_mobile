import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitmo_mobile/models/calories_burned.dart';
import 'package:fitmo_mobile/models/fitness_stats.dart';
import 'package:fitmo_mobile/pages/reports_page/controller/fitness_report_controller.dart';
import 'package:fitmo_mobile/pages/statistic_page/controller/fitness_statistic_controller.dart';
import 'package:fitmo_mobile/pages/statistic_page/widgets/appbar.dart';
import 'package:fitmo_mobile/pages/statistic_page/widgets/stats.dart';
import 'package:fitmo_mobile/pages/statistic_page/widgets/dates.dart';
import 'package:fitmo_mobile/pages/statistic_page/widgets/graph.dart';
import 'package:fitmo_mobile/pages/statistic_page/widgets/info.dart';
import 'package:fitmo_mobile/pages/statistic_page/widgets/steps.dart';
import 'package:fitmo_mobile/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';

class StatisticPage extends StatefulWidget {
  const StatisticPage({super.key});

  @override
  State<StatisticPage> createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
  final controller = FitnessStatisticController();

  @override
  void initState() {
    controller.getFitnessStats();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        appBar: AppBar(),
      ),
      // body: Column(
      //   children: [
      //     Dates(),
      //     Steps(),
      //     Graph(),
      //     Info(),
      //     Stats(),
      //     BottomNav(),
      //   ],
      // ),
      body: Column(
        children: [
          Dates(),
          ValueListenableBuilder(
            valueListenable: controller.fitnessStats,
            builder: (context, value, child) {
              double steps = 0;
              DateTime time;
              double energyBurned = 0;
              double distanceDelta = 0;
              double hr = 0;
              double countHr = 0;
              double avgHr;

              for (final data in value) {
                print(data.dataType);
                if (data.dataType == "STEPS") {
                  time = data.dateFrom;
                  print(time);
                  steps += data.value;
                } else if (data.dataType == "HEART_RATE") {
                  hr += data.value;
                  countHr++;
                } else if (data.dataType == "ACTIVE_ENERGY_BURNED") {
                  energyBurned += data.value;
                } else if (data.dataType == "DISTANCE_DELTA") {
                  distanceDelta += data.value;
                }
              }

              avgHr = hr / countHr;

              return Expanded(
                child: Column(
                  children: [
                    Steps(data: steps),
                    Graph(),
                    Info(
                      dataDistanceDelta: distanceDelta,
                      dataEnergyBurned: energyBurned,
                    ),
                    Stats(),
                  ],
                ),
              );
            },
          ),
          BottomNav(),
        ],
      ),
    );
  }
}
