import 'package:cloud_firestore/cloud_firestore.dart';

class ActivityData {
  String activityName;
  int age;
  Detail detail;
  int targetHr;
  Timestamp timestamp;

  ActivityData({
    required this.activityName,
    required this.age,
    required this.detail,
    required this.targetHr,
    required this.timestamp,
  });

  ActivityData.fromJson(Map<String, dynamic> json)
      : this(
          activityName: json['activityName']! as String,
          age: json['age']! as int,
          detail: Detail.fromJson(json['detail']),
          targetHr: json['targetHr']! as int,
          timestamp: json['timestamp']! as Timestamp,
        );

  ActivityData copyWith({
    String? activityName,
    int? age,
    Detail? detail,
    int? targetHr,
    Timestamp? timestamp,
  }) {
    return ActivityData(
      activityName: activityName ?? this.activityName,
      age: age ?? this.age,
      detail: detail ?? this.detail,
      targetHr: targetHr ?? this.targetHr,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'activityName': activityName,
      'age': age,
      'detail': detail.toJson(),
      'targetHr': targetHr,
      'timestamp': timestamp,
    };
  }
}

class Detail {
  int avgHr;
  int maxHr;
  int restHr;
  String status;
  int vo2Max;

  Detail({
    required this.avgHr,
    required this.maxHr,
    required this.restHr,
    required this.status,
    required this.vo2Max,
  });

  Detail.fromJson(Map<String, Object?> json)
      : this(
          avgHr: json['avgHr']! as int,
          maxHr: json['maxHr']! as int,
          restHr: json['restHr']! as int,
          status: json['status']! as String,
          vo2Max: json['vo2Max']! as int,
        );

  Detail copyWith({
    int? avgHr,
    int? maxHr,
    int? restHr,
    String? status,
    int? vo2Max,
  }) {
    return Detail(
      avgHr: avgHr ?? this.avgHr,
      maxHr: maxHr ?? this.maxHr,
      restHr: restHr ?? this.restHr,
      status: status ?? this.status,
      vo2Max: vo2Max ?? this.vo2Max,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'avgHr': avgHr,
      'maxHr': maxHr,
      'restHr': restHr,
      'status': status,
      'vo2Max': vo2Max,
    };
  }
}
