import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ActivityStatusDetail extends StatelessWidget {
  const ActivityStatusDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Detail Activity",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(
              height: 12.0,
            ),
            Expanded(
              child: CustomScrollView(
                primary: false,
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    sliver: SliverGrid.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      children: [
                        DetailCard(
                          value: 128,
                          time: Timestamp.now(),
                          label: "Max Heart Rate",
                          image: "assets/emoticon/smile.png",
                        ),
                        DetailCard(
                          value: 128,
                          time: Timestamp.now(),
                          label: "Resting Heart Rate",
                          image: "assets/emoticon/smile.png",
                        ),
                        DetailCard(
                          value: 128,
                          time: Timestamp.now(),
                          label: "Average Heart Rate",
                          image: "assets/emoticon/smile.png",
                        ),
                        DetailCard(
                          value: 128,
                          time: Timestamp.now(),
                          label: "VO2Max",
                          image: "assets/emoticon/smile.png",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailCard extends StatelessWidget {
  final int value;
  final Timestamp time;
  final String label;
  final String image;

  const DetailCard({
    Key? key,
    required this.value,
    required this.time,
    required this.label,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 110,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: const Color(0xffe1e1e1),
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(3, 3),
              blurRadius: 3,
            ),
          ]),
      child: Stack(
        children: [
          StatIcon(
            icon: Icons.monitor_heart,
            iconColor: Colors.red.shade100,
            iconBackground: Colors.red,
          ),
          Change(time: time),
          Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(fontSize: 14),
                ),
                Text(
                  value.toString(),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Change extends StatelessWidget {
  const Change({
    Key? key,
    required this.time,
  }) : super(key: key);

  final Timestamp time;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 1,
          horizontal: 4,
        ),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(500),
        ),
        child: Text(
          DateFormat('kk: mm').format(time.toDate()),
          style: const TextStyle(fontSize: 10, color: Colors.white),
        ),
      ),
    );
  }
}

class StatIcon extends StatelessWidget {
  const StatIcon({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.iconBackground,
  }) : super(key: key);

  final IconData icon;
  final Color iconColor;
  final Color iconBackground;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: iconBackground,
        borderRadius: BorderRadius.circular(9),
      ),
      child: Icon(icon, size: 48, color: iconColor),
    );
  }
}
