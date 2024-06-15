import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitmo_mobile/models/fitness_data.dart';
import 'package:fitmo_mobile/pages/activity_page/widgets/activity_header.dart';
import 'package:fitmo_mobile/services/fitness_database.dart';
import 'package:flutter/material.dart';

const List<String> fitnessType = <String>[
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

  final FitnessDatabase _database = FitnessDatabase();

  String dropdownValue = fitnessType.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ActivityHeader(),
          formField(),
        ],
      ),
    );
  }

  Widget formField() {
    // Size fixedScreen = MediaQuery.of(context).size;

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
                          initialSelection: fitnessType.first,
                          onSelected: (String? value) {
                            setState(() {
                              dropdownValue = value!;
                            });
                          },
                          dropdownMenuEntries: fitnessType
                              .map<DropdownMenuEntry<String>>((String value) {
                            return DropdownMenuEntry<String>(
                                value: value, label: value);
                          }).toList(),
                        ),
                        const TextField(
                          // controller: _valueController,
                          decoration: InputDecoration(
                            labelText: "Resting Heart Rate",
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        const TextField(
                          // controller: _valueController,
                          decoration: InputDecoration(
                            labelText: "Maximum Heart Rate",
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        const TextField(
                          // controller: _valueController,
                          decoration: InputDecoration(
                            labelText: "Average Heart Rate",
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
                  FitnessData data = FitnessData(
                    value: int.parse(_valueController.text),
                    unit: _unitController.text,
                    fitnessType: _fitnessTypeController.text,
                    dateFrom: Timestamp.now(),
                    dateTo: Timestamp.now(),
                  );
                  _database.addFitnessData(data);
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
