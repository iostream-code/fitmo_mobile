import 'package:flutter/material.dart';

class ActivityHeader extends StatefulWidget {
  const ActivityHeader({super.key});

  @override
  State<ActivityHeader> createState() => _ActivityHeaderState();
}

class _ActivityHeaderState extends State<ActivityHeader> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/");
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: 16,
        ),
      ),
      title: const Text(
        "Activity",
        style: TextStyle(
          color: Colors.white,
          // fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      centerTitle: true,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/record/add");
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(5),
            maximumSize: const Size(30, 30),
            minimumSize: const Size(15, 15),
            shape: const CircleBorder(),
            backgroundColor: Colors.white,
            foregroundColor: Colors.blue[800],
          ),
          child: const Icon(
            Icons.add,
            size: 14,
          ),
        ),
      ],
    );
  }
}
