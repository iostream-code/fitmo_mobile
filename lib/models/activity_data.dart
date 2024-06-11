// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ActivityData {
  int value;
  String activity_name;
  String status;
  Timestamp timestamp;

  ActivityData({
    required this.value,
    required this.activity_name,
    required this.status,
    required this.timestamp,
  });

  ActivityData.fromJson(Map<String, Object?> json)
      : this(
          value: json['value']! as int,
          activity_name: json['activity_name']! as String,
          status: json['status'] as String,
          timestamp: json['timestamp']! as Timestamp,
        );

  ActivityData copyWith({
    int? value,
    String? activity_name,
    String? status,
    Timestamp? timestamp,
  }) {
    return ActivityData(
      value: value ?? this.value,
      activity_name: activity_name ?? this.activity_name,
      status: status ?? this.status,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'value': value,
      'activity_name': activity_name,
      'status': status,
      'timestamp': timestamp,
    };
  }
}
