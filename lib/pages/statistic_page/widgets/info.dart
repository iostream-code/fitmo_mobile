import 'package:flutter/material.dart';
import 'package:health/health.dart';

class Info extends StatelessWidget {
  final List<HealthDataPoint> fitnessData;
  const Info({Key? key, required this.fitnessData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 78,
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (_, index) {
          HealthDataPoint data = fitnessData[index];
          // return Text(data.deviceId);
          return const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              StatsInfo(
                // value: "${data.value}",
                value: "-",
                unit: 'Kkal',
                label: 'Calories',
              ),
              StatsInfo(
                value: '-',
                unit: 'Km',
                label: 'Distance',
              ),
              StatsInfo(
                value: '-',
                unit: 'hr',
                label: 'Hours',
              ),
            ],
          );
        },
      ),
    );
    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
    //   children: [
    //     StatsInfo(
    //       // value: "-",
    //       value: "-",
    //       unit: 'Kkal',
    //       label: 'Calories',
    //     ),
    //     StatsInfo(
    //       value: '-',
    //       unit: 'Km',
    //       label: 'Distance',
    //     ),
    //     StatsInfo(
    //       value: '-',
    //       unit: 'hr',
    //       label: 'Hours',
    //     ),
    //   ],
    // );
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
