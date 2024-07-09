import 'package:fitmo_mobile/pages/reports_page/controller/fitness_report_controller.dart';
import 'package:flutter/material.dart';

class ReportHeader extends StatefulWidget {
  const ReportHeader({super.key});

  @override
  State<ReportHeader> createState() => _ReportHeaderState();
}

class _ReportHeaderState extends State<ReportHeader> {
  final controller = FitnessReportController();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/");
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: 16,
        ),
      ),
      title: const Text(
        "Measurement",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      centerTitle: true,
    );
  }
}
