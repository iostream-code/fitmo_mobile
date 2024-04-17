import 'package:cloud_firestore/cloud_firestore.dart';

class FitnessData {
  int value;
  String unit;
  Timestamp dateFrom;
  Timestamp dateTo;
  String fitnessType;

  FitnessData({
    required this.value,
    required this.unit,
    required this.dateFrom,
    required this.dateTo,
    required this.fitnessType,
  });

  FitnessData.fromJson(Map<String, Object?> json)
      : this(
          value: json['value']! as int,
          unit: json['unit']! as String,
          dateFrom: json['dateFrom']! as Timestamp,
          dateTo: json['dateTo']! as Timestamp,
          fitnessType: json['fitnessType']! as String,
        );

  FitnessData copyWith({
    int? value,
    String? unit,
    Timestamp? dateFrom,
    Timestamp? dateTo,
    String? fitnessType,
  }) {
    return FitnessData(
      value: value ?? this.value,
      unit: unit ?? this.unit,
      dateFrom: dateFrom ?? this.dateFrom,
      dateTo: dateTo ?? this.dateTo,
      fitnessType: fitnessType ?? this.fitnessType,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'value': value,
      'unit': unit,
      'dateFrom': dateFrom,
      'dateTo': dateTo,
      'fitnessType': fitnessType,
    };
  }
}
