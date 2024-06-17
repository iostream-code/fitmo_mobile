import 'package:flutter/material.dart';
import 'package:health/health.dart';

class Steps extends StatefulWidget {
  final List<HealthDataPoint> fitnessData;
  const Steps({Key? key, required this.fitnessData}) : super(key: key);

  @override
  State<Steps> createState() => _StepsState();
}

class _StepsState extends State<Steps> {
  @override
  Widget build(BuildContext context) {
    double totalSteps = 0;

    return Expanded(
      child: ListView.builder(
        itemCount: widget.fitnessData.length,
        itemBuilder: (_, index) {
          if (widget.fitnessData.isNotEmpty) {
            HealthDataPoint data = widget.fitnessData[index];
            if (data.typeString == "STEPS") {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Text(
                      data.typeString == "STEPS" ? "${data.value}" : "-",
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const Text(
                      'Total Steps',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        height: 2,
                      ),
                    ),
                  ],
                ),
              );
            }
          } else {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Text(
                    "-",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    'Total Steps',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      height: 2,
                    ),
                  ),
                ],
              ),
            );
          }
        },

        // child: ValueListenableBuilder(
        //   valueListenable: controller.footSteps,
        //   builder: (context, value, child) {
        //     for (final data in value) {
        //       (totalSteps += data.value);
        //     }

        //     return Column(
        //       children: [
        //         Text(
        //           "${totalSteps.toStringAsFixed(0)}",
        //           // "Data",
        //           style: const TextStyle(
        //             fontSize: 33,
        //             fontWeight: FontWeight.w900,
        //           ),
        //         ),
        //         const Text(
        //           'Total Steps',
        //           style: TextStyle(
        //             fontSize: 11,
        //             fontWeight: FontWeight.w500,
        //             height: 2,
        //           ),
        //         ),
        //       ],
        //     );
        //   },
        // ),
      ),
    );
  }
}
