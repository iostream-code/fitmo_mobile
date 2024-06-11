import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ActivityStatusDetail extends StatelessWidget {
  const ActivityStatusDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Detail Activity",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              height: 12.0,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      "This is Detail Status",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      "This is Detail Status",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
