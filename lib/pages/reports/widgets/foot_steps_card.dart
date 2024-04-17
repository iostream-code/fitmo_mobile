import 'package:fitmo_mobile/models/foot_steps.dart';
import 'package:flutter/material.dart';

class FootStepsCard extends StatelessWidget {
  final FootSteps footSteps;

  const FootStepsCard({super.key, required this.footSteps});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${footSteps.value.toStringAsFixed(0)} step",
            style: const TextStyle(fontSize: 24),
          ),
          Text(footSteps.dataType),
          Text(
            footSteps.dateFrom.toString(),
          ),
        ],
      ),
    );
  }
}
