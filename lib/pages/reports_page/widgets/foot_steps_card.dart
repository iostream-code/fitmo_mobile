import 'package:fitmo_mobile/models/foot_steps.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FootStepsCard extends StatelessWidget {
  final FootSteps footSteps;

  const FootStepsCard({super.key, required this.footSteps});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 115,
      child: Card(
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.orange,
                Colors.amber,
                Colors.yellow,
              ],
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.info_outline,
                    size: 18,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      Icons.directions_walk,
                      size: 32,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          footSteps.dataType,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${footSteps.value.toStringAsFixed(0)} count",
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    DateFormat('MMM d, kk:mm').format(footSteps.dateFrom),
                    // footSteps.dateFrom.toString(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
