import 'package:fitmo_mobile/pages/home/home_controller.dart';
import 'package:flutter/material.dart';

class Testing extends StatefulWidget {
  const Testing({super.key});

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 30,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Testing Data Report',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                IconButton(
                  onPressed: () => controller.getData(),
                  icon: const Icon(
                    Icons.refresh,
                    size: 18,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: controller.bloodGlucose,
                builder: (context, value, child) {
                  return GridView(
                    padding: const EdgeInsets.all(5),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                    ),
                    children: [
                      for (final bloodGlucose in value)
                        Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(bloodGlucose.value.toString()),
                              // Text(bloodGlucose.unit),
                              // Text(bloodGlucose.dateFrom.toString()),
                              // Text(bloodGlucose.dateTo.toString()),
                            ],
                          ),
                        ),
                    ],
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
