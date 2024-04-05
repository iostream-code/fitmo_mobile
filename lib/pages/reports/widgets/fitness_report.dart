import 'package:fitmo_mobile/models/fitness_data.dart';
import 'package:fitmo_mobile/services/fitness_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FitnessReport extends StatefulWidget {
  const FitnessReport({super.key});

  @override
  State<FitnessReport> createState() => _FitnessReportState();
}

class _FitnessReportState extends State<FitnessReport> {
  final FitnessDatabase _database = FitnessDatabase();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Data from Firebase",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.refresh),
                  iconSize: 16,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              // child: myCard(),
              child: fitnessCard(),
            ),
          ],
        ),
      ),
    );
  }

  Widget fitnessCard() {
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
          padding: EdgeInsets.zero,
          itemCount: fitnessData.length,
          itemBuilder: (context, index) {
            FitnessData data = fitnessData[index].data();
            String dataId = fitnessData[index].id;

            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                tileColor: Colors.blue[100],
                leading: Text(
                  data.value.toString(),
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
                title: Text(data.fitnessType),
                subtitle: Text(
                  DateFormat('dd-MM-yyyy h a').format(
                    data.dateFrom.toDate(),
                  ),
                ),
                // trailing: IconButton(
                //   onPressed: () {
                //     _database.deleteFitnessData(dataId);
                //   },
                //   icon: const Icon(Icons.delete),
                // ),
                trailing: IconButton(
                  onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text("Delete Confirmation"),
                      content: Text("Are You sure delete this Data?"),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            _database.deleteFitnessData(dataId);
                            Navigator.pop(context);
                          },
                          child: Text("Yes"),
                        ),
                      ],
                    ),
                  ),
                  icon: const Icon(Icons.delete),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
