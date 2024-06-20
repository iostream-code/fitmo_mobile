import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Info extends StatelessWidget {
  final double dataDistanceDelta;
  final double dataEnergyBurned;
  final DateTime dataTime;

  const Info({
    Key? key,
    required this.dataDistanceDelta,
    required this.dataEnergyBurned,
    required this.dataTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        StatsInfo(
          value: dataEnergyBurned.toStringAsFixed(0),
          unit: 'Kcal',
          label: 'Calories',
        ),
        StatsInfo(
          value: dataDistanceDelta.toStringAsFixed(0),
          unit: 'Meters',
          label: 'Distance',
        ),
        StatsInfo(
          value: DateFormat('h:mm').format(dataTime),
          unit: DateFormat('a').format(dataTime),
          label: 'Time',
        ),
      ],
    );
  }
}

class StatsInfo extends StatelessWidget {
  final String value;
  final String unit;
  final String label;

  const StatsInfo({
    Key? key,
    required this.value,
    required this.unit,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text.rich(
            TextSpan(
                text: value,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
                children: [
                  const TextSpan(text: ' '),
                  TextSpan(
                    text: unit,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ]),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
