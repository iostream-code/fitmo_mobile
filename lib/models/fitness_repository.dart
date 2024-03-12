import 'package:health/health.dart';

class FitnessRepository {
  final health = HealthFactory(useHealthConnectIfAvailable: true);

  Future<bool> getHeartRate() async {
    bool requested = await health.requestAuthorization([
      HealthDataType.HEART_RATE,
    ]);

    if (requested) {
      List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
        DateTime.now().subtract(const Duration(days: 7)),
        DateTime.now(),
        [
          HealthDataType.HEART_RATE,
        ],
      );

      return healthData.isNotEmpty;
    }

    return false;
  }

  Future<bool> getBloodOxygen() async {
    bool requested = await health.requestAuthorization([
      HealthDataType.BLOOD_OXYGEN,
    ]);

    if (requested) {
      List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
        DateTime.now().subtract(const Duration(days: 7)),
        DateTime.now(),
        [
          HealthDataType.BLOOD_OXYGEN,
        ],
      );

      return healthData.isNotEmpty;
    }

    return false;
  }
}

// Future<void> getData() async {
//     // create a HealthFactory for use in the app, choose if HealthConnect should be used or not
//     HealthFactory health = HealthFactory(useHealthConnectIfAvailable: true);

//     // define the types to get
//     var types = [
//       HealthDataType.STEPS,
//       HealthDataType.BLOOD_GLUCOSE,
//       HealthDataType.HEART_RATE,
//       HealthDataType.BLOOD_OXYGEN,
//       HealthDataType.BODY_TEMPERATURE,
//     ];

//     // requesting access to the data types before reading them
//     bool requested = await health.requestAuthorization(types);

//     var now = DateTime.now();

//     // fetch health data from the last 24 hours
//     List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
//         now.subtract(const Duration(days: 1)), now, types);

//     // request permissions to write steps and blood glucose
//     types = [HealthDataType.STEPS, HealthDataType.BLOOD_GLUCOSE];
//     var permissions = [
//       HealthDataAccess.READ_WRITE,
//       HealthDataAccess.READ_WRITE
//     ];
//     await health.requestAuthorization(types, permissions: permissions);

//     // write steps and blood glucose
//     bool success =
//         await health.writeHealthData(10, HealthDataType.STEPS, now, now);
//     success = await health.writeHealthData(
//         3.1, HealthDataType.BLOOD_GLUCOSE, now, now);

//     // get the number of steps for today
//     var midnight = DateTime(now.year, now.month, now.day);
//     int? steps = await health.getTotalStepsInInterval(midnight, now);

//     print(healthData);
//   }