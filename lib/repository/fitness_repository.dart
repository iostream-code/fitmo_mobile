import 'package:fitmo_mobile/models/blood_glucose.dart';
import 'package:fitmo_mobile/models/blood_oxygen.dart';
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
        now.subtract(const Duration(days: 7)),
        now,
        [HealthDataType.HEART_RATE],
      );

      return fitnessData.map((e) {
        var b = e;
        // print(b.value.toJson()['numericValue']);
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

  // Future<bool> getHeartRate() async {
  //   bool requested =
  //       await health.requestAuthorization([HealthDataType.HEART_RATE]);

  //   if (requested) {
  //     var now = DateTime.now();

  //     List<HealthDataPoint> fitnessData = await health.getHealthDataFromTypes(
  //       now.subtract(const Duration(days: 7)),
  //       now,
  //       [HealthDataType.HEART_RATE],
  //     );

  //     return fitnessData.isNotEmpty;
  //   }

  //   return false;
  // }

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

  // Future<bool> getBloodOxygen() async {
  //   bool requested =
  //       await health.requestAuthorization([HealthDataType.BLOOD_OXYGEN]);

  //   if (requested) {
  //     var now = DateTime.now();

  //     List<HealthDataPoint> fitnessData = await health.getHealthDataFromTypes(
  //       now.subtract(const Duration(days: 7)),
  //       now,
  //       [HealthDataType.BLOOD_OXYGEN],
  //     );

  //     print(fitnessData);

  //     return fitnessData.isNotEmpty;
  //   }

  //   return false;
  // }

  Future<List<FootSteps>> getFootSteps() async {
    bool requested = await health.requestAuthorization([HealthDataType.STEPS]);

    if (requested) {
      var now = DateTime.now();

      List<HealthDataPoint> fitnessData = await health.getHealthDataFromTypes(
        now.subtract(const Duration(days: 7)),
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

  Future<List<BloodGlucose>> getBloodGlucose() async {
    bool requested = await health.requestAuthorization([
      HealthDataType.BLOOD_GLUCOSE,
    ]);

    if (requested) {
      print('Class has been accessed!');
      print(requested);

      List<HealthDataPoint> fitnessData = await health.getHealthDataFromTypes(
        DateTime.now().subtract(const Duration(days: 7)),
        DateTime.now(),
        [
          HealthDataType.BLOOD_GLUCOSE,
        ],
      );

      return fitnessData.map((e) {
        var b = e;
        print(b.value.toJson()['numericValue']);
        return BloodGlucose(
          double.parse(b.value.toJson()['numericValue']),
          b.unit.toString(),
          b.dateFrom,
          b.dateTo,
        );
      }).toList();
    }

    return [];
  }
}
