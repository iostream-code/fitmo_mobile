import 'package:health/health.dart';
import 'package:fitmo_mobile/models/fitness_repository.dart';

class HomeController {
  final repository = FitnessRepository();

  // Future<void> getDataFirebase() {
  //   print('hello world!');
  // }

  Future<void> getData() async {
    repository.getHeartRate();
    repository.getBloodOxygen();
  }
}
