import 'package:fitmo_mobile/pages/reports_page/controller/fitness_report_controller.dart';
import 'package:fitmo_mobile/pages/reports_page/widgets/foot_steps_card.dart';
import 'package:flutter/material.dart';

class FootStepsReportApi extends StatefulWidget {
  const FootStepsReportApi({super.key});

  @override
  State<FootStepsReportApi> createState() => _FootStepsReportApiState();
}

class _FootStepsReportApiState extends State<FootStepsReportApi> {
  final controller = FitnessReportController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Foot Steps Count",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    controller.getFootSteps();
                  },
                  icon: const Icon(Icons.refresh),
                  iconSize: 16,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: controller.footSteps,
                builder: (context, value, child) {
                  return GridView(
                    padding: const EdgeInsets.all(15),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                    ),
                    children: [
                      for (final footSteps in value)
                        FootStepsCard(footSteps: footSteps)
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
