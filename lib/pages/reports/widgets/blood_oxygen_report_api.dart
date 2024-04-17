import 'package:fitmo_mobile/pages/reports/controller/fitness_report_controller.dart';
import 'package:fitmo_mobile/pages/reports/widgets/blood_oxygen_card.dart';
import 'package:flutter/material.dart';

class BloodOxygenReportApi extends StatefulWidget {
  const BloodOxygenReportApi({super.key});

  @override
  State<BloodOxygenReportApi> createState() => _BloodOxygenReportApiState();
}

class _BloodOxygenReportApiState extends State<BloodOxygenReportApi> {
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
                  "Blood Oxygen Measurements",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    controller.getBloodOxygenData();
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
              // child: fitnessCard(),
              child: ValueListenableBuilder(
                valueListenable: controller.bloodOxygen,
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
                      for (final bloodOxygen in value)
                        BloodOxygenCard(bloodOxygen: bloodOxygen)
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
