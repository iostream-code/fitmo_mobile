import 'package:fitmo_mobile/models/fitness_data.dart';
import 'package:fitmo_mobile/services/fitness_database.dart';
import 'package:flutter/material.dart';

class FitnessReport extends StatefulWidget {
  const FitnessReport({super.key});

  @override
  State<FitnessReport> createState() => _FitnessReportState();
}

class _FitnessReportState extends State<FitnessReport> {
  final FitnessDatabase _database = FitnessDatabase();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          fitnessCard(),
        ],
      ),
    );
  }

  Widget fitnessCard() {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.80,
      width: MediaQuery.sizeOf(context).width,
      child: StreamBuilder(
        stream: _database.getFitnessData(),
        builder: (context, snapshots) {
          List fitnessData = snapshots.data?.docs ?? [];

          if (fitnessData.isEmpty) {
            return const Center(
              child: Text("Nothing here..."),
            );
          }

          return ListView.builder(
            itemCount: fitnessData.length,
            itemBuilder: (context, index) {
              FitnessData data = fitnessData[index].data();
              String dataId = fitnessData[index].id;

              return Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  right: 14,
                  left: 14,
                ),
                child: ListTile(
                  tileColor: Colors.blue[100],
                  leading: Text(data.unit),
                  title: Text(data.fitnessType),
                  subtitle: Text(
                    data.value.toString(),
                  ),
                  trailing: Icon(Icons.more_vert),
                  onLongPress: () {
                    _database.deleteFitnessData(dataId);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
