import 'package:fitmo_mobile/pages/home/home_controller.dart';
import 'package:fitmo_mobile/pages/home/widgets/current.dart';
import 'package:fitmo_mobile/pages/home/widgets/header.dart';
import 'package:fitmo_mobile/pages/home/widgets/testing.dart';
import 'package:fitmo_mobile/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => controller.getData(),
      //   child: const Icon(Icons.refresh),
      // ),
      body: Column(
        children: [
          AppHeader(),
          CurrentPrograms(),
          // RecentActivities(),
          Testing(),
          BottomNav(),
        ],
      ),
      // body: ValueListenableBuilder(
      //   valueListenable: controller.bloodGlucose,
      //   builder: (context, value, child) {
      //     return GridView(
      //       padding: const EdgeInsets.all(5),
      //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //           crossAxisCount: 2,
      //           childAspectRatio: 1,
      //           mainAxisSpacing: 15,
      //           crossAxisSpacing: 15),
      //       children: [
      //         for (final bloodGlucose in value)
      //           MyCard(
      //             bloodGlucose: bloodGlucose,
      //           ),
      //       ],
      //     );
      //   },
      // ),
    );
  }
}
