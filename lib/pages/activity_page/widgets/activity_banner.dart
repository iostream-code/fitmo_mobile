import 'package:flutter/material.dart';

class ActivityBanner extends StatelessWidget {
  const ActivityBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> assetImage = [
      '/assets/running.jpg',
      '/assets/walking.jpeg',
      '/assets/body_workout.jpg',
    ];

    return Container(
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text('This is Banner'),
    );
  }
}
