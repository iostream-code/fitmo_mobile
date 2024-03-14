import 'package:flutter/material.dart';
import 'package:fitmo_mobile/models/fitness_repository.dart';
import 'package:fitmo_mobile/models/blood_oxygen.dart';
import 'package:fitmo_mobile/models/heart_rate.dart';
import 'package:health/health.dart';

class HomeController {
  final repository = FitnessRepository();

  // Future<void> getDataFirebase() {
  //   print('hello world!');
  // }

  final heartRate = ValueNotifier(<HeartRate>[]);
  final bloodOxygen = ValueNotifier(<BloodOxygen>[]);

  Future<void> getData() async {
    // heartRate.value = repository.getHeartRate();
    // bloodOxygen.value = repository.getBloodOxygen();
    // heartRate.value = repository.getHeartRate() as List<HeartRate>;
    // bloodOxygen.value = repository.getBloodOxygen() as List<BloodOxygen>;

    // create a HealthFactory for use in the app, choose if HealthConnect should be used or not
    HealthFactory health = HealthFactory(useHealthConnectIfAvailable: true);

    // define the types to get
    var types = [
      HealthDataType.STEPS,
      HealthDataType.BLOOD_GLUCOSE,
      HealthDataType.HEART_RATE,
      HealthDataType.BLOOD_OXYGEN,
      HealthDataType.BODY_TEMPERATURE,
    ];

    // requesting access to the data types before reading them
    bool requested = await health.requestAuthorization(types);

    var now = DateTime.now();

    // fetch health data from the last 24 hours
    List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
        now.subtract(const Duration(days: 1)), now, types);

    // request permissions to write steps and blood glucose
    types = [HealthDataType.STEPS, HealthDataType.BLOOD_GLUCOSE];
    var permissions = [
      HealthDataAccess.READ_WRITE,
      HealthDataAccess.READ_WRITE
    ];
    await health.requestAuthorization(types, permissions: permissions);

    // write steps and blood glucose
    bool success =
        await health.writeHealthData(10, HealthDataType.STEPS, now, now);
    success = await health.writeHealthData(
        3.1, HealthDataType.BLOOD_GLUCOSE, now, now);

    // get the number of steps for today
    var midnight = DateTime(now.year, now.month, now.day);
    int? steps = await health.getTotalStepsInInterval(midnight, now);

    print(healthData);
  }
}
