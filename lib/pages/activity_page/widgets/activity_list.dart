import 'package:fitmo_mobile/models/activity_data.dart';
import 'package:fitmo_mobile/models/fitness_data.dart';
import 'package:fitmo_mobile/services/activity_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ActivityList extends StatelessWidget {
  const ActivityList({super.key});

  @override
  Widget build(BuildContext context) {
    final ActivityDatabase database = ActivityDatabase();

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.5),
                color: Colors.blue,
              ),
              margin: EdgeInsets.only(bottom: 4.0),
              padding: EdgeInsets.only(left: 16.0, right: 6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Record Activity",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: StreamBuilder(
                stream: database.getActivityData(),
                builder: (context, snapshots) {
                  List activityData = snapshots.data?.docs ?? [];

                  if (activityData.isEmpty) {
                    return const Center(
                      child: Text("Nothing here..."),
                    );
                  }

                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: activityData.length,
                    itemBuilder: (context, index) {
                      ActivityData data = activityData[index].data();
                      String dataId = activityData[index].id;
                      String actStatus = data.status;

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context).pushNamed('/activity/detail');
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: Colors.grey.shade300,
                              width: 1,
                            ),
                          ),
                          tileColor: Colors.white,
                          leading: Text(
                            data.value.toString(),
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          title: Text(
                            data.activity_name.toUpperCase(),
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Text(
                            DateFormat('dd-MM-yyyy h a').format(
                              data.timestamp.toDate(),
                            ),
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                          trailing: Badge(
                            smallSize: 10,
                            backgroundColor: actStatus == 'bad'
                                ? Colors.red
                                : actStatus == 'fair'
                                    ? Colors.yellow
                                    : Colors.green,
                            child: Text(
                              data.status.toUpperCase(),
                              style: TextStyle(fontSize: 18.0),
                            ),
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
