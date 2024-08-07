import 'package:flutter/material.dart';

class Steps extends StatelessWidget {
  final double data;
  const Steps({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Text(
                data == 0 ? "-" : "${data.toInt()}",
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const Text(
                'Total Steps',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  height: 2,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
