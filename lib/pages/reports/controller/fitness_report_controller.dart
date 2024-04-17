import 'package:fitmo_mobile/models/blood_glucose.dart';
import 'package:fitmo_mobile/models/blood_oxygen.dart';
import 'package:fitmo_mobile/models/heart_rate.dart';
import 'package:fitmo_mobile/repository/fitness_repository.dart';
import 'package:flutter/material.dart';

class FitnessReportController {
  final repository = FitnessRepository();

  final heartRate = ValueNotifier(<HeartRate>[]);
  final bloodOxygen = ValueNotifier(<BloodOxygen>[]);
  final bloodGlucose = ValueNotifier(<BloodGlucose>[]);

  Future<void> getData() async {
    // await repository.getBloodGlucose();
    // await repository.getHeartRate();
    heartRate.value = await repository.getHeartRate();
    // bloodOxygen.value = await repository.getBloodOxygen();
  }
}
