import 'package:fitmo_mobile/pages/activity_page/widgets/activity_header.dart';
import 'package:fitmo_mobile/pages/activity_page/widgets/activity_status_banner.dart';
import 'package:fitmo_mobile/pages/activity_page/widgets/activity_status_detail.dart';
import 'package:flutter/material.dart';

class ActivityDetailPage extends StatefulWidget {
  const ActivityDetailPage({super.key});

  @override
  State<ActivityDetailPage> createState() => _ActivityDetailPageState();
}

class _ActivityDetailPageState extends State<ActivityDetailPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          ActivityHeader(),
          ActivityStatusBanner(),
          ActivityStatusDetail(),
        ],
      ),
    );
  }
}
