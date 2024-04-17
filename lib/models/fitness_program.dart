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
    name: 'Running',
    cals: '132kkal',
    time: '10min',
    type: ProgramType.cardio,
  ),
  FitnessProgram(
    image: const AssetImage('assets/swimming.jpg'),
    name: 'Swimming',
    cals: '100kkal',
    time: '10min',
    type: ProgramType.lift,
  ),
  FitnessProgram(
    image: const AssetImage('assets/cycling.jpg'),
    name: 'Cycling',
    cals: '147kkal',
    time: '15min',
    type: ProgramType.body,
  ),
];
