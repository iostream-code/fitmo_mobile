import 'package:fitmo_mobile/models/blood_oxygen.dart';
import 'package:flutter/material.dart';

class BloodOxygenCard extends StatelessWidget {
  final BloodOxygen bloodOxygen;

  const BloodOxygenCard({super.key, required this.bloodOxygen});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            bloodOxygen.value.toStringAsFixed(2),
            style: const TextStyle(fontSize: 24),
          ),
          Text(bloodOxygen.dataType),
          Text(
            bloodOxygen.dateFrom.toString(),
          ),
        ],
      ),
    );
  }
}
