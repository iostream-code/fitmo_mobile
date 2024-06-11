import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitmo_mobile/models/activity_data.dart';

const String collection = 'activity_data';

class ActivityDatabase {
  final _firestore = FirebaseFirestore.instance;

  late final CollectionReference _activityRef;

  ActivityDatabase() {
    _activityRef =
        _firestore.collection(collection).withConverter<ActivityData>(
              fromFirestore: (snapshots, _) => ActivityData.fromJson(
                snapshots.data()!,
              ),
              toFirestore: (activityData, _) => activityData.toJson(),
            );
  }

  Stream<QuerySnapshot> getActivityData() {
    return _activityRef.snapshots();
  }

  void addActivityData(ActivityData data) async {
    _activityRef.add(data);
  }

  void updateActivityData(ActivityData data, String dataId) {
    _activityRef.doc(dataId).update(data.toJson());
  }

  void deleteActivityData(String dataId) {
    _activityRef.doc(dataId).delete();
  }
}
