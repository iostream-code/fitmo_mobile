import 'package:fitmo_mobile/models/blood_glucose.dart';
import 'package:flutter/material.dart';
import 'package:fitmo_mobile/repository/fitness_repository.dart';
import 'package:fitmo_mobile/models/blood_oxygen.dart';
import 'package:fitmo_mobile/models/heart_rate.dart';

class HomeController {
  final repository = FitnessRepository();

  // Future<void> getDataFirebase() {
  //   print('hello world!');
  // }

  final heartRate = ValueNotifier(<HeartRate>[]);
  final bloodOxygen = ValueNotifier(<BloodOxygen>[]);
  final bloodGlucose = ValueNotifier(<BloodGlucose>[]);

  Future<void> getData() async {
    // repository.getBloodGlucose();
    // repository.getHeartRate();
    // heartRate.value = await repository.getHeartRate();
    // bloodOxygen.value = await repository.getBloodOxygen();
  }
}
