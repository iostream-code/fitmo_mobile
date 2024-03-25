import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitmo_mobile/models/fitness_data.dart';

const String collection = "fitness_data";

class FitnessDatabase {
  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference _fitnessRef;

  FitnessDatabase() {
    _fitnessRef = _firestore.collection(collection).withConverter<FitnessData>(
          fromFirestore: (snapshots, _) => FitnessData.fromJson(
            snapshots.data()!,
          ),
          toFirestore: (fitnessData, _) => fitnessData.toJson(),
        );
  }

  Stream<QuerySnapshot> getFitnessData() {
    return _fitnessRef.snapshots();
  }

  void addFitnessData(FitnessData data) async {
    _fitnessRef.add(data);
  }

  void updateFitnessData(FitnessData data, String dataId) {
    _fitnessRef.doc(dataId).update(data.toJson());
  }

  void deleteFitnessData(String dataId) {
    _fitnessRef.doc(dataId).delete();
  }
}
