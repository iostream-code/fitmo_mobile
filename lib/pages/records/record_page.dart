import 'package:fitmo_mobile/pages/records/widgets/record_header.dart';
import 'package:fitmo_mobile/pages/records/widgets/records_show.dart';
import 'package:fitmo_mobile/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({super.key});

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          RecordHeader(),
          RecordList(),
          BottomNav(),
        ],
      ),
    );
  }
}
