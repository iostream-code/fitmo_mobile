import 'package:fitmo_mobile/models/calories_burned.dart';
import 'package:fitmo_mobile/pages/reports_page/controller/fitness_report_controller.dart';
import 'package:fitmo_mobile/pages/statistic_page/widgets/appbar.dart';
import 'package:fitmo_mobile/pages/statistic_page/widgets/stats.dart';
import 'package:fitmo_mobile/pages/statistic_page/widgets/dates.dart';
import 'package:fitmo_mobile/pages/statistic_page/widgets/graph.dart';
import 'package:fitmo_mobile/pages/statistic_page/widgets/info.dart';
import 'package:fitmo_mobile/pages/statistic_page/widgets/steps.dart';
import 'package:fitmo_mobile/widgets/bottom_nav.dart';

import 'dart:async';

import 'package:carp_serializable/carp_serializable.dart';
import 'package:flutter/material.dart';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';

class StatisticPage extends StatefulWidget {
  const StatisticPage({Key? key}) : super(key: key);

  @override
  State<StatisticPage> createState() => _StatisticPageState();
}

enum AppState {
  DATA_NOT_FETCHED,
  FETCHING_DATA,
  DATA_READY,
  NO_DATA,
}

class _StatisticPageState extends State<StatisticPage> {
  final List<HealthDataPoint> _healthDataList = [];
  AppState _state = AppState.DATA_NOT_FETCHED;
  var health = HealthFactory();

  /// All the data types that are available on Android and iOS.
  /* List<HealthDataType> get types => (Platform.isAndroid)
      ? dataTypeKeysAndroid
      : (Platform.isIOS)
          ? dataTypeKeysIOS
          : []; */

  static final types = [
    HealthDataType.STEPS,
    HealthDataType.HEART_RATE,
    HealthDataType.SLEEP_ASLEEP,
    HealthDataType.ACTIVE_ENERGY_BURNED,
  ];

  List<HealthDataAccess> get permissions =>
      types.map((e) => HealthDataAccess.READ_WRITE).toList();

  @override
  void initState() {
    health.useHealthConnectIfAvailable == true;
    authorize();
    // fetchData();
    super.initState();
  }

  Future<void> authorize() async {
    await Permission.activityRecognition.request();
    await Permission.location.request();

    bool? hasPermissions =
        await health.hasPermissions(types, permissions: permissions);
    hasPermissions = false;
    bool authorized = false;
    if (!hasPermissions) {
      try {
        authorized =
            await health.requestAuthorization(types, permissions: permissions);
      } catch (error) {
        debugPrint("Exception in authorize: $error");
      }
    }
    setState(() => _state =
        (authorized) ? AppState.FETCHING_DATA : AppState.DATA_NOT_FETCHED);
  }

  Future<void> fetchData() async {
    setState(() => _state = AppState.FETCHING_DATA);

    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(hours: 24));
    _healthDataList.clear();

    try {
      List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
        yesterday,
        now,
        types,
      );

      _healthDataList.addAll(
          (healthData.length < 100) ? healthData : healthData.sublist(0, 100));
    } catch (error) {
      debugPrint("Exception in getHealthDataFromTypes: $error");
    }
    // _healthDataList = health.removeDuplicates(_healthDataList);
    for (var data in _healthDataList) {
      debugPrint(toJsonString(data));
    }
    setState(() {
      _state = _healthDataList.isEmpty ? AppState.NO_DATA : AppState.DATA_READY;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        appBar: AppBar(),
      ),
      body: Column(
        children: [
          Dates(),
          Expanded(
            child: Center(
              child: _content,
            ),
          ),
          BottomNav(),
        ],
      ),
    );
  }

  Widget get _contentFetchingData => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              padding: const EdgeInsets.all(20),
              child: const CircularProgressIndicator(
                strokeWidth: 10,
                color: Colors.blue,
              )),
          const Text('Memuat Data...')
        ],
      );

  Widget get _contentDataReady => ListView.builder(
      itemCount: _healthDataList.length,
      itemBuilder: (_, index) {
        HealthDataPoint p = _healthDataList[index];
        print("this is content ready widget!");
        if (p.value is AudiogramHealthValue) {
          return ListTile(
            title: Text("${p.typeString}: ${p.value}"),
            trailing: Text(p.unitString),
            subtitle: Text('${p.dateFrom} - ${p.dateTo}'),
          );
        }
        if (p.value is WorkoutHealthValue) {
          return ListTile(
            title: Text(
                "${p.typeString}: ${(p.value as WorkoutHealthValue).totalEnergyBurned} ${(p.value as WorkoutHealthValue).totalEnergyBurnedUnit?.name}"),
            trailing:
                Text((p.value as WorkoutHealthValue).workoutActivityType.name),
            subtitle: Text('${p.dateFrom} - ${p.dateTo}'),
          );
        }
        if (p.value is NutritionHealthValue) {
          return ListTile(
            title: Text(
                "${p.typeString} ${(p.value as NutritionHealthValue).mealType}: ${(p.value as NutritionHealthValue).name}"),
            trailing:
                Text('${(p.value as NutritionHealthValue).calories} kcal'),
            subtitle: Text('${p.dateFrom} - ${p.dateTo}'),
          );
        }
        return ListTile(
          title: Text("${p.typeString}: ${p.value}"),
          trailing: Text(p.unitString),
          subtitle: Text('${p.dateFrom} - ${p.dateTo}'),
        );
      });

  final Widget _contentNoData = const Text('No Data to show');

  final Widget _contentNotFetched = const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Steps(),
      Graph(),
      Info(),
      Stats(),
    ],
  );

  // final Widget _authorized = setState(() => _state = AppState.FETCHING_DATA);

  Widget get _content => switch (_state) {
        AppState.DATA_READY => _contentDataReady,
        AppState.DATA_NOT_FETCHED => _contentNotFetched,
        AppState.FETCHING_DATA => _contentFetchingData,
        AppState.NO_DATA => _contentNoData,
      };
}
