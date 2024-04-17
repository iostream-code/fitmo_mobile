import 'package:fitmo_mobile/models/heart_rate.dart';
import 'package:flutter/material.dart';

class HeartRateCard extends StatelessWidget {
  final HeartRate heartRate;

  const HeartRateCard({super.key, required this.heartRate});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            heartRate.value.toStringAsFixed(2),
            style: const TextStyle(fontSize: 24),
          ),
          Text(heartRate.dataType),
          Text(
            heartRate.dateFrom.toString(),
          ),
        ],
      ),
    );
  }
}
