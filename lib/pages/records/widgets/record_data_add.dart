import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitmo_mobile/models/fitness_data.dart';
import 'package:fitmo_mobile/services/fitness_database.dart';
import 'package:flutter/material.dart';

const List<String> fitnessType = <String>[
  'HEART_RATE',
  'BLOOD_OXYGEN',
  'BLOOD_GLUCOSE',
];

class RecordDataAdd extends StatefulWidget {
  const RecordDataAdd({super.key});

  @override
  State<RecordDataAdd> createState() => _RecordDataAddState();
}

class _RecordDataAddState extends State<RecordDataAdd> {
  final TextEditingController _valueController = TextEditingController();
  final TextEditingController _fitnessTypeController = TextEditingController();
  final TextEditingController _unitController = TextEditingController();

  final FitnessDatabase _database = FitnessDatabase();

  String dropdownValue = fitnessType.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add New Record",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          formField(),
        ],
      ),
    );
  }

  Widget formField() {
    Size fixedScreen = MediaQuery.of(context).size;

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
                        TextField(
                          controller: _valueController,
                          decoration: const InputDecoration(
                            labelText: "Value",
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        DropdownMenu(
                          // width: fixedScreen.width,
                          width: 296,
                          controller: _fitnessTypeController,
                          label: const Text("Fitness Type"),
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
                        TextField(
                          controller: _unitController,
                          decoration: const InputDecoration(
                            labelText: "Unit",
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                onPressed: () {
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
