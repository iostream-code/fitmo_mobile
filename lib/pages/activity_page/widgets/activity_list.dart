import 'package:flutter/material.dart';

class ActivityList extends StatelessWidget {
  const ActivityList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(
          children: [
            Expanded(
              child: Text('This is Activity List'),
            ),
          ],
        ),
      ),
    );
  }
}
