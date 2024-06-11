import 'package:fitmo_mobile/pages/activity_page/widgets/activity_header.dart';
import 'package:flutter/material.dart';

class ActivityDetailPage extends StatefulWidget {
  const ActivityDetailPage({super.key});

  @override
  State<ActivityDetailPage> createState() => _ActivityDetailPageState();
}

class _ActivityDetailPageState extends State<ActivityDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ActivityHeader(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 86.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey.shade300,
                      width: 3,
                    ),
                  ),
                  child: Image.asset('assets/emoticon/smile.png'),
                ),
                Container(
                  margin: EdgeInsets.only(left: 4.0),
                  child: Text("Container 2"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
