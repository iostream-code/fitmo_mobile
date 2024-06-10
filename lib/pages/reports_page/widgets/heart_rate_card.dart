import 'package:fitmo_mobile/models/heart_rate.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HeartRateCard extends StatelessWidget {
  final HeartRate heartRate;

  const HeartRateCard({super.key, required this.heartRate});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 115,
      child: Card(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                // Color.fromRGBO(255, 128, 128, 100),
                Color.fromRGBO(255, 207, 150, 100),
                Color.fromRGBO(246, 253, 195, 100),
              ],
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.info_outline,
                    size: 18,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.monitor_heart_outlined,
                      size: 32,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          heartRate.dataType,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${heartRate.value.toStringAsFixed(0)} Bpm",
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    DateFormat('MMM d, kk:mm').format(heartRate.dateFrom),
                    // heartRate.dateFrom.toString(),
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
