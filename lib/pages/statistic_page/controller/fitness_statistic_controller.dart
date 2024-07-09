import 'package:fitmo_mobile/models/blood_oxygen.dart';
import 'package:fitmo_mobile/models/calories_burned.dart';
import 'package:fitmo_mobile/models/fitness_stats.dart';
import 'package:fitmo_mobile/models/foot_steps.dart';
import 'package:fitmo_mobile/models/heart_rate.dart';
import 'package:fitmo_mobile/repository/fitness_repository.dart';
import 'package:flutter/material.dart';

class FitnessStatisticController {
  final repository = FitnessRepository();

  final heartRate = ValueNotifier(<HeartRate>[]);
  final bloodOxygen = ValueNotifier(<BloodOxygen>[]);
  final footSteps = ValueNotifier(<FootSteps>[]);
  final caloriesBurned = ValueNotifier(<CaloriesBurned>[]);
  final fitnessStats = ValueNotifier(<FitnessStats>[]);

  Future<void> getHeartRateData() async {
    heartRate.value = await repository.getHeartRate();
  }

  Future<void> getBloodOxygenData() async {
    bloodOxygen.value = await repository.getBloodOxygen();
  }

  Future<void> getFootSteps() async {
    footSteps.value = await repository.getFootSteps();
  }

  Future<void> getFitnessStats() async {
    fitnessStats.value = await repository.getFitnessStats();
  }
}
