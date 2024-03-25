import 'package:fitmo_mobile/models/fitness_data.dart';
import 'package:fitmo_mobile/services/fitness_database.dart';
import 'package:flutter/material.dart';

class FitnessCard extends StatelessWidget {
  const FitnessCard({super.key});

  @override
  Widget build(BuildContext context) {
    final FitnessDatabase _database = FitnessDatabase();

    return StreamBuilder(
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
            print(data);

            return ListTile(
              tileColor: Theme.of(context).colorScheme.primaryContainer,
              title: Text(data.fitnessType),
              subtitle: Text(
                data.value.toString(),
              ),
              onLongPress: () {
                _database.deleteFitnessData(dataId);
              },
            );
          },
        );
      },
    );
  }
}
