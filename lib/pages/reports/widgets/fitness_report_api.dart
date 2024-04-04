import 'package:flutter/material.dart';

class FitnessReportApi extends StatefulWidget {
  const FitnessReportApi({super.key});

  @override
  State<FitnessReportApi> createState() => _FitnessReportApiState();
}

class _FitnessReportApiState extends State<FitnessReportApi> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text("data"),
            ],
          ),
        ),
      ],
    );
  }
}
