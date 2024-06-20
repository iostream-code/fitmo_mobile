import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitmo_mobile/models/activity_data.dart';
import 'package:fitmo_mobile/pages/activity_page/widgets/activity_header.dart';
import 'package:fitmo_mobile/pages/statistic_page/controller/fitness_statistic_controller.dart';
import 'package:fitmo_mobile/services/activity_database.dart';
import 'package:flutter/material.dart';

const List<String> activityType = <String>[
  'RUNNING',
  'WALKING',
];

class ActivityAddPage extends StatefulWidget {
  const ActivityAddPage({super.key});

  @override
  State<ActivityAddPage> createState() => _ActivityAddPageState();
}

class _ActivityAddPageState extends State<ActivityAddPage> {
  final TextEditingController _valueController = TextEditingController();
  final TextEditingController _fitnessTypeController = TextEditingController();
  final TextEditingController _unitController = TextEditingController();

  final ActivityDatabase _database = ActivityDatabase();
  final controller = FitnessStatisticController();

  String dropdownValue = activityType.first;

  @override
  void initState() {
    controller.getFitnessStats();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ActivityHeader(),
          ValueListenableBuilder(
            valueListenable: controller.fitnessStats,
            builder: (context, value, child) {
              double hr = 0;
              double avgHr = 0;
              double maxHr = 0;
              double restHr = 0;
              double countHr = 0;

              for (final data in value) {
                if (data.dataType == "HEART_RATE") {
                  hr += data.value;

                  maxHr > data.value ? restHr = data.value : maxHr = data.value;
                }
                countHr++;
              }

              return formField();
            },
          ),
        ],
      ),
    );
  }

  Widget formField() {
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
                          // width: fixedScreen.width,
                          width: 296,
                          // controller: _fitnessTypeController,
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
                        const TextField(
                          // controller: _valueController,
                          decoration: InputDecoration(
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
                  // CHANGE THIS CODE !!!
                  ActivityData data = ActivityData(
                    activityName: "RUNNING",
                    age: 25,
                    detail: Detail(
                      avgHr: 76,
                      maxHr: 109,
                      restHr: 65,
                      status: "BAD",
                      vo2Max: 30,
                    ),
                    targetHr: 79,
                    timestamp: Timestamp.now(),
                  );
                  _database.addActivityData(data);
                  Navigator.pop(context);
                  _valueController.clear();
                  _unitController.clear();
                  _fitnessTypeController.clear();
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
