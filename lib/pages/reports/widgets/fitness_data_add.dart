import 'package:fitmo_mobile/services/fitness_database.dart';
import 'package:flutter/material.dart';

class FitnessDataAdd extends StatefulWidget {
  const FitnessDataAdd({super.key});

  @override
  State<FitnessDataAdd> createState() => _FitnessDataAddState();
}

class _FitnessDataAddState extends State<FitnessDataAdd> {
  final TextEditingController _valueController = TextEditingController();
  final TextEditingController _fitnessTypeController = TextEditingController();
  final TextEditingController _unitController = TextEditingController();

  final FitnessDatabase _database = FitnessDatabase();

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
    return FormField(builder: (state) {
      return Column(
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
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Value",
                        ),
                        onChanged: (value) => state.didChange(value),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Value",
                        ),
                        onChanged: (value) => state.didChange(value),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Value",
                        ),
                        onChanged: (value) => state.didChange(value),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}
