import 'package:fitmo_mobile/pages/reports/controller/fitness_report_controller.dart';
import 'package:fitmo_mobile/pages/reports/widgets/fitness_api_card.dart';
import 'package:fitmo_mobile/services/fitness_database.dart';
import 'package:flutter/material.dart';

class FitnessReportApi extends StatefulWidget {
  const FitnessReportApi({super.key});

  @override
  State<FitnessReportApi> createState() => _FitnessReportApiState();
}

class _FitnessReportApiState extends State<FitnessReportApi> {
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
                  "Data from API",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    controller.getData();
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
                valueListenable: controller.heartRate,
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
                      for (final heartRate in value)
                        FitnessApiCard(heartRate: heartRate)
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

  Widget fitnessCard() {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
          height: 50,
          margin: const EdgeInsets.only(bottom: 5),
          color: Colors.amber[600],
          child: const Text("data 1"),
        ),
        Container(
          height: 50,
          margin: const EdgeInsets.only(bottom: 5),
          color: Colors.amber[500],
          child: const Text("data 2"),
        ),
        Container(
          height: 50,
          margin: const EdgeInsets.only(bottom: 5),
          color: Colors.amber[100],
          child: const Text("data 3"),
        ),
        Container(
          height: 50,
          margin: const EdgeInsets.only(bottom: 5),
          color: Colors.amberAccent[700],
          child: const Text("data 4"),
        ),
        Container(
          height: 50,
          margin: const EdgeInsets.only(bottom: 5),
          color: Colors.amberAccent[400],
          child: const Text("data 5"),
        ),
        Container(
          height: 50,
          margin: const EdgeInsets.only(bottom: 5),
          color: Colors.amberAccent[100],
          child: const Text("data 6"),
        ),
      ],
    );
  }
}
