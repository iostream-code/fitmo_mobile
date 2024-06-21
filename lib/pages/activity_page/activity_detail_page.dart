import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitmo_mobile/models/activity_data.dart';
import 'package:fitmo_mobile/pages/activity_page/widgets/activity_header.dart';
import 'package:fitmo_mobile/pages/activity_page/widgets/activity_status_banner.dart';
import 'package:fitmo_mobile/pages/activity_page/widgets/activity_status_detail.dart';
import 'package:fitmo_mobile/services/activity_database.dart';
// import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ActivityDetailPage extends StatefulWidget {
  final String dataId;
  const ActivityDetailPage({
    super.key,
    required this.dataId,
  });

  @override
  State<ActivityDetailPage> createState() => _ActivityDetailPageState();
}

class _ActivityDetailPageState extends State<ActivityDetailPage> {
  final controller = ActivityDatabase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ActivityHeader(),
          FutureBuilder<DocumentSnapshot>(
            future: controller.detailActivityData(widget.dataId).get(),
            builder: (context, snapshots) {
              if (snapshots.connectionState == ConnectionState.waiting) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 100),
                      padding: const EdgeInsets.all(20),
                      child: const CircularProgressIndicator(
                        color: Color(0xff18b0e8),
                        strokeWidth: 10,
                      ),
                    ),
                    const Text(
                      'Wait a minute...',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                );
              }
              final data = snapshots.data!.data() as ActivityData;
              return Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ActivityStatusBanner(
                      status: data.detail.status,
                    ),
                    ActivityStatusDetail(
                      maxHr: data.detail.maxHr,
                      restHr: data.detail.restHr,
                      avgHr: data.detail.avgHr,
                      vo2Max: data.detail.vo2Max,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
