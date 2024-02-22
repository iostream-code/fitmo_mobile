import 'package:flutter/material.dart';

enum ProgramType {
  cardio,
  lift,
  body,
}

class FitnessProgram {
  final AssetImage image;
  final String name;
  final String cals;
  final String time;
  final ProgramType type;

  FitnessProgram({
    required this.image,
    required this.name,
    required this.cals,
    required this.time,
    required this.type,
  });
}

final List<FitnessProgram> fitnessPrograms = [
  FitnessProgram(
    image: const AssetImage('assets/running.jpg'),
    name: 'Cardio',
    cals: '220kkal',
    time: '20min',
    type: ProgramType.cardio,
  ),
  FitnessProgram(
    image: const AssetImage('assets/weights.jpg'),
    name: 'Arm Exercise',
    cals: '300kkal',
    time: '15min',
    type: ProgramType.lift,
  ),
  FitnessProgram(
    image: const AssetImage('assets/body.jpg'),
    name: 'Body Exercise',
    cals: '280kkal',
    time: '10min',
    type: ProgramType.body,
  ),
];
