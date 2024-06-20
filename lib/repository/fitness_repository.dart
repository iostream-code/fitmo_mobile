import 'package:fitmo_mobile/models/blood_oxygen.dart';
import 'package:fitmo_mobile/models/fitness_stats.dart';
import 'package:fitmo_mobile/models/foot_steps.dart';
import 'package:fitmo_mobile/models/heart_rate.dart';
import 'package:health/health.dart';

class FitnessRepository {
  final health = HealthFactory();

  Future<List<HeartRate>> getHeartRate() async {
    bool requested =
        await health.requestAuthorization([HealthDataType.HEART_RATE]);

    if (requested) {
      var now = DateTime.now();

      List<HealthDataPoint> fitnessData = await health.getHealthDataFromTypes(
        now.subtract(const Duration(days: 1)),
        now,
        [HealthDataType.HEART_RATE],
      );

      return fitnessData.map((e) {
        var b = e;
        print(b.value.toJson()['numericValue']);
        return HeartRate(
          double.parse(b.value.toJson()['numericValue']),
          b.unitString,
          b.dateFrom,
          b.dateTo,
          b.typeString,
        );
      }).toList();
    }
    return [];
  }

  Future<List<BloodOxygen>> getBloodOxygen() async {
    bool requested =
        await health.requestAuthorization([HealthDataType.BLOOD_OXYGEN]);

    if (requested) {
      var now = DateTime.now();

      List<HealthDataPoint> fitnessData = await health.getHealthDataFromTypes(
        now.subtract(const Duration(days: 7)),
        now,
        [HealthDataType.BLOOD_OXYGEN],
      );

      return fitnessData.map((e) {
        var b = e;
        print(b.value.toJson()['numericValue']);
        return BloodOxygen(
          double.parse(b.value.toJson()['numericValue']),
          b.unit.toString(),
          b.dateFrom,
          b.dateTo,
          b.typeString,
        );
      }).toList();
    }

    return [];
  }

  Future<List<FootSteps>> getFootSteps() async {
    bool requested = await health.requestAuthorization([HealthDataType.STEPS]);

    if (requested) {
      var now = DateTime.now();

      List<HealthDataPoint> fitnessData = await health.getHealthDataFromTypes(
        now.subtract(const Duration(days: 1)),
        now,
        [HealthDataType.STEPS],
      );
      print(fitnessData);
      return fitnessData.map((e) {
        var b = e;
        // print(b.value.toJson()['numericValue']);
        return FootSteps(
          double.parse(b.value.toJson()['numericValue']),
          b.unit.toString(),
          b.dateFrom,
          b.dateTo,
          b.typeString,
        );
      }).toList();
    }

    return [];
  }

  Future<List<FitnessStats>> getFitnessStats() async {
    bool requested = await health.requestAuthorization([
      HealthDataType.HEART_RATE,
      HealthDataType.STEPS,
      HealthDataType.BLOOD_OXYGEN,
      HealthDataType.SLEEP_ASLEEP,
      HealthDataType.ACTIVE_ENERGY_BURNED,
      HealthDataType.DISTANCE_DELTA,
    ]);

    if (requested) {
      var now = DateTime.now();

      List<HealthDataPoint> fitnessData = await health.getHealthDataFromTypes(
        now.subtract(const Duration(hours: 24)),
        now,
        [
          HealthDataType.HEART_RATE,
          HealthDataType.STEPS,
          HealthDataType.BLOOD_OXYGEN,
          HealthDataType.SLEEP_ASLEEP,
          HealthDataType.ACTIVE_ENERGY_BURNED,
          HealthDataType.DISTANCE_DELTA,
        ],
        // types,
      );

      print(fitnessData);

      return fitnessData.map((e) {
        var b = e;
        // print(b.value.toJson()['numericValue']);
        return FitnessStats(
          double.parse(b.value.toJson()['numericValue']),
          b.unit.toString(),
          b.dateFrom,
          b.dateTo,
          b.typeString,
        );
      }).toList();
    }

    return [];
  }
}
