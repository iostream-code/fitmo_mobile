import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitmo_mobile/models/fitness_data.dart';
import 'package:fitmo_mobile/services/fitness_database.dart';
import 'package:flutter/material.dart';

class ReportHeader extends StatefulWidget {
  const ReportHeader({super.key});

  @override
  State<ReportHeader> createState() => _ReportHeaderState();
}

class _ReportHeaderState extends State<ReportHeader> {
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
        "Record Measurements",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      centerTitle: true,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/report/add");
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(5),
            maximumSize: const Size(30, 30),
            minimumSize: const Size(30, 30),
            shape: const CircleBorder(),
            backgroundColor: Colors.white,
            foregroundColor: Colors.blue[800],
          ),
          child: const Icon(
            Icons.add,
            size: 18,
          ),
        ),
      ],
    );
  }
}
