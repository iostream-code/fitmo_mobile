import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitmo_mobile/models/activity_data.dart';
import 'package:fitmo_mobile/pages/activity_page/widgets/activity_header.dart';
import 'package:fitmo_mobile/pages/statistic_page/controller/fitness_statistic_controller.dart';
import 'package:fitmo_mobile/services/activity_database.dart';
import 'package:flutter/material.dart';

const List<String> activityType = <String>[
  'RUNNING',
  'WALKING',
  'DAILY',
];

class ActivityAddPage extends StatefulWidget {
  const ActivityAddPage({super.key});

  @override
  State<ActivityAddPage> createState() => _ActivityAddPageState();
}

class _ActivityAddPageState extends State<ActivityAddPage> {
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _activityNameController = TextEditingController();

  final ActivityDatabase _database = ActivityDatabase();
  final controller = FitnessStatisticController();

  String dropdownValue = activityType.first;

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future<void> fetchData() async {
    await Future.delayed(const Duration(seconds: 3));
    controller.getHeartRateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ActivityHeader(),
          ValueListenableBuilder(
            valueListenable: controller.heartRate,
            builder: (context, value, child) {
              double hr = 0;
              double avgHr = 0;
              double maxHr = 0;
              double restHr = 0;
              double countHr = 0;
              double vo2Max = 0;

              if (value.isNotEmpty) restHr = value[0].value;

              for (final data in value) {
                hr += data.value;
                if (maxHr < data.value) maxHr = data.value;
                if (data.value < restHr) restHr = data.value;
                countHr++;
              }

              avgHr = hr / countHr;

              return formField(
                avgHr: avgHr,
                maxHr: maxHr,
                restHr: restHr,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget formField({
    required double maxHr,
    required double restHr,
    required double avgHr,
  }) {
    return FormField(builder: (state) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20.0,
                        ),
                        DropdownMenu(
                          width: 296,
                          controller: _activityNameController,
                          label: const Text("Activity"),
                          initialSelection: activityType.first,
                          onSelected: (String? value) {
                            setState(() {
                              dropdownValue = value!;
                            });
                          },
                          dropdownMenuEntries: activityType
                              .map<DropdownMenuEntry<String>>((String value) {
                            return DropdownMenuEntry<String>(
                                value: value, label: value);
                          }).toList(),
                        ),
                        TextField(
                          controller: _ageController,
                          decoration: const InputDecoration(
                            labelText: "Age",
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                child: const Text(
                  "save",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                onPressed: () {
                  double age = double.parse(_ageController.text);
                  double targetHr = maxHr - restHr;
                  double limitMaxHr = 220 - age;
                  double vo2Max = 15 * (limitMaxHr / restHr);
                  String status = "";

                  if (avgHr < (maxHr * 0.5)) {
                    status = "GOOD";
                  } else if (avgHr > (maxHr * 0.5) && avgHr < (maxHr * 0.7)) {
                    status = "FAIR";
                  } else {
                    status = "BAD";
                  }

                  ActivityData data = ActivityData(
                    activityName: _activityNameController.text,
                    age: age.toInt(),
                    detail: Detail(
                      avgHr: avgHr.toInt(),
                      maxHr: maxHr.toInt(),
                      restHr: restHr.toInt(),
                      status: status,
                      vo2Max: vo2Max.toInt(),
                    ),
                    targetHr: targetHr.toInt(),
                    timestamp: Timestamp.now(),
                  );
                  _database.addActivityData(data);
                  Navigator.pop(context);
                  _ageController.clear();
                  _activityNameController.clear();
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
