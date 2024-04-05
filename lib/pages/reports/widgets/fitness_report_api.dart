import 'package:flutter/material.dart';

class FitnessReportApi extends StatefulWidget {
  const FitnessReportApi({super.key});

  @override
  State<FitnessReportApi> createState() => _FitnessReportApiState();
}

class _FitnessReportApiState extends State<FitnessReportApi> {
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
                  onPressed: () {},
                  icon: const Icon(Icons.refresh),
                  iconSize: 16,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: fitnessCard(),
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
          margin: EdgeInsets.only(bottom: 5),
          color: Colors.amber[600],
          child: const Text("data 1"),
        ),
        Container(
          height: 50,
          margin: EdgeInsets.only(bottom: 5),
          color: Colors.amber[500],
          child: const Text("data 2"),
        ),
        Container(
          height: 50,
          margin: EdgeInsets.only(bottom: 5),
          color: Colors.amber[100],
          child: const Text("data 3"),
        ),
        Container(
          height: 50,
          margin: EdgeInsets.only(bottom: 5),
          color: Colors.amberAccent[700],
          child: const Text("data 4"),
        ),
        Container(
          height: 50,
          margin: EdgeInsets.only(bottom: 5),
          color: Colors.amberAccent[400],
          child: const Text("data 5"),
        ),
        Container(
          height: 50,
          margin: EdgeInsets.only(bottom: 5),
          color: Colors.amberAccent[100],
          child: const Text("data 6"),
        ),
      ],
    );
  }
}
