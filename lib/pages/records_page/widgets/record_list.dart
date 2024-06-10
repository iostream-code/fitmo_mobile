import 'package:fitmo_mobile/models/fitness_data.dart';
import 'package:fitmo_mobile/services/fitness_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RecordList extends StatefulWidget {
  const RecordList({super.key});

  @override
  State<RecordList> createState() => _RecordListState();
}

class _RecordListState extends State<RecordList> {
  final FitnessDatabase _database = FitnessDatabase();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(
          children: [
            Expanded(
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
                          trailing: IconButton(
                            onPressed: () => showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text("Delete Confirmation"),
                                content: const Text(
                                    "Are You sure delete this Data?"),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      _database.deleteFitnessData(dataId);
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      "Yes",
                                      style: TextStyle(color: Colors.green),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      "No",
                                      style: TextStyle(color: Colors.red),
                                    ),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
