import 'package:fitmo_mobile/models/activity_data.dart';
import 'package:fitmo_mobile/services/activity_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:string_extensions/string_extensions.dart';

class RecentActivities extends StatelessWidget {
  const RecentActivities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ActivityDatabase database = ActivityDatabase();

    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Activity',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(height: 15),
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

                    return GestureDetector(
                      // onTap: () {
                      //   Navigator.of(context).pushNamed('/activity/details');
                      // },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xffe1e1e1),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffcff2ff),
                              ),
                              height: 35,
                              width: 35,
                              child: Container(
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/icon/running_icon.png'),
                                      fit: BoxFit.fill,
                                    )),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Text(
                              data.activityName.capitalize,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                child: Container(),
                              ),
                            ),
                            SizedBox(
                              width: 52,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.date_range,
                                    size: 12,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    DateFormat('EEE, d').format(
                                      data.timestamp.toDate(),
                                    ),
                                    style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Badge(
                              backgroundColor: data.detail.status == 'BAD'
                                  ? Colors.red
                                  : data.detail.status == 'FAIR'
                                      ? Colors.yellow.shade700
                                      : Colors.green,
                              child: const Icon(
                                Icons.monitor_heart_outlined,
                                size: 12,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              data.detail.status.capitalize,
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            )
                          ],
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
    ));
  }
}
