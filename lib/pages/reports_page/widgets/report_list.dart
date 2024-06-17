import 'package:fitmo_mobile/pages/reports_page/controller/fitness_report_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReportList extends StatefulWidget {
  const ReportList({super.key});

  @override
  State<ReportList> createState() => _ReportListState();
}

class _ReportListState extends State<ReportList> {
  final controller = FitnessReportController();

  @override
  void initState() {
    controller.getHeartRateData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Report Measurements",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      DateFormat('EEEE, dd MMMM').format(
                        DateTime.now(),
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        controller.getHeartRateData();
                      },
                      child: Text(
                        "Sync Data",
                        selectionColor: Colors.black,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 64.0,
                      child: Image.asset('assets/icon/health_check.png'),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 16.0,
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: controller.heartRate,
                builder: (context, value, child) {
                  return ListView(
                    children: [
                      for (final data in value)
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed('/activity/details');
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xffe1e1e1),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                const SizedBox(width: 10),
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffcff2ff),
                                  ),
                                  height: 35,
                                  width: 35,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/icon/running_icon.png'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Text(
                                  data.dataType,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                const Expanded(
                                  child: SizedBox(),
                                ),
                                const Icon(
                                  Icons.date_range,
                                  size: 12,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  DateFormat('h:m a').format(
                                    data.dateFrom,
                                  ),
                                  style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w300),
                                ),
                                const SizedBox(width: 10),
                                Badge(
                                  backgroundColor: Colors.green,
                                  child: const Icon(
                                    Icons.monitor_heart_outlined,
                                    size: 12,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  "${data.value.toStringAsFixed(0)} Bpm",
                                  style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                )
                              ],
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
