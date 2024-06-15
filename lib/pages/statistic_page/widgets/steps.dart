import 'package:fitmo_mobile/pages/reports_page/controller/fitness_report_controller.dart';
import 'package:flutter/material.dart';

class Steps extends StatefulWidget {
  const Steps({Key? key}) : super(key: key);

  @override
  State<Steps> createState() => _StepsState();
}

class _StepsState extends State<Steps> {
  // final controller = FitnessReportController();

  // @override
  // void initState() {
  //   controller.getFootSteps();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    double totalSteps = 0;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Text(
            "No Data Available",
            // "Data",
            style: TextStyle(
              fontSize: totalSteps == 0 ? 14 : 32,
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
    );
  }
}
