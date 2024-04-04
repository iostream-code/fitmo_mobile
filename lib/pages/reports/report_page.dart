import 'package:fitmo_mobile/pages/reports/widgets/fitness_report_api.dart';
import 'package:fitmo_mobile/pages/reports/widgets/fitness_report.dart';
import 'package:fitmo_mobile/pages/reports/widgets/header.dart';
import 'package:fitmo_mobile/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          ReportHeader(),
          FitnessReport(),
          FitnessReportApi(),
          BottomNav(),
        ],
      ),
    );
  }
}