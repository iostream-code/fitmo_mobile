import 'package:carp_serializable/carp_serializable.dart';
import 'package:flutter/material.dart';
import 'package:health/health.dart';
import 'package:intl/intl.dart';

class ReportList extends StatefulWidget {
  const ReportList({super.key});

  @override
  State<ReportList> createState() => _ReportListState();
}

enum AppState {
  FETCHING_DATA,
  DATA_READY,
  NO_DATA,
  AUTH_NOT_GRANTED,
}

class _ReportListState extends State<ReportList> {
  List<HealthDataPoint> _healthDataList = [];
  AppState _state = AppState.NO_DATA;

  static final types = [
    HealthDataType.STEPS,
    HealthDataType.HEART_RATE,
    HealthDataType.SLEEP_ASLEEP,
    HealthDataType.ACTIVE_ENERGY_BURNED,
  ];

  List<HealthDataAccess> get permissions =>
      types.map((e) => HealthDataAccess.READ_WRITE).toList();

  @override
  void initState() {
    authorize();
    super.initState();
  }

  Future<void> authorize() async {
    bool? hasPermissions =
        await HealthFactory().hasPermissions(types, permissions: permissions);
    hasPermissions = false;
    bool authorized = false;
    if (!hasPermissions) {
      try {
        authorized = await HealthFactory()
            .requestAuthorization(types, permissions: permissions);
      } catch (error) {
        debugPrint("Exception in authorize: $error");
      }
    }
    setState(() => _state =
        (authorized) ? AppState.FETCHING_DATA : AppState.AUTH_NOT_GRANTED);
  }

  Future<void> fetchData() async {
    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(hours: 24));
    _healthDataList.clear();

    try {
      List<HealthDataPoint> healthData =
          await HealthFactory().getHealthDataFromTypes(
        yesterday,
        now,
        types,
      );

      _healthDataList.addAll((healthData.length < 1000)
          ? healthData
          : healthData.sublist(0, 1000));
    } catch (error) {
      debugPrint("Exception in getHealthDataFromTypes: $error");
    }
    _healthDataList = HealthFactory.removeDuplicates(_healthDataList);
    for (var data in _healthDataList) {
      debugPrint(toJsonString(data));
    }
    setState(() {
      _state = _healthDataList.isEmpty ? AppState.NO_DATA : AppState.DATA_READY;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Report Measurements",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      DateFormat('EEEE, dd MMMM').format(
                        DateTime.now(),
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        authorize();
                      },
                      child: const Text(
                        "Sync Data",
                        selectionColor: Colors.black,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 64.0,
                      child: Image.asset('assets/icon/health_check.png'),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 16.0,
            ),
            Expanded(
              child: _content,
            ),
          ],
        ),
      ),
    );
  }

  Widget noData() {
    return const Center(
      child: Text("Data Not Found"),
    );
  }

  Widget notAuthorized() {
    return const Center(
      child: Text("Authorization Not Given"),
    );
  }

  Widget fetchingData() {
    setState(() {
      fetchData();
    });

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(20),
          child: const CircularProgressIndicator(
            color: Color(0xff18b0e8),
            strokeWidth: 10,
          ),
        ),
        const Text(
          'Wait a minute...',
          style: TextStyle(color: Colors.black54),
        ),
      ],
    );
  }

  Widget showData() {
    return ListView.builder(
      itemCount: _healthDataList.length,
      itemBuilder: (_, index) {
        HealthDataPoint data = _healthDataList[index];

        return GestureDetector(
          onTap: () {},
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
                        image: AssetImage('assets/icon/running_icon.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Text(
                  data.typeString == "HEART_RATE"
                      ? "Heart Rate"
                      : data.typeString == "STEPS"
                          ? "Steps"
                          : data.typeString == "SLEEP_ASLEEP"
                              ? "Sleep"
                              : data.typeString == "ACTIVE_ENERGY_BURNED"
                                  ? "Energy Burned"
                                  : "Unknown",
                  // "${data.typeString} ",
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                const Icon(
                  Icons.date_range,
                  size: 12,
                ),
                const SizedBox(width: 5),
                Text(
                  DateFormat('h:m a').format(
                    data.dateFrom,
                  ),
                  style: const TextStyle(
                      fontSize: 10, fontWeight: FontWeight.w300),
                ),
                const SizedBox(width: 10),
                Icon(
                  Icons.monitor_heart_outlined,
                  size: 12,
                ),
                const SizedBox(width: 5),
                Text(
                  data.unitString == "BEATS_PER_MINUTE"
                      ? "${double.parse(data.value.toJson()['numericValue']).toStringAsFixed(0)} Bpm"
                      : data.unitString == "COUNT"
                          ? "${data.value} Steps"
                          : data.unitString == "MINUTE"
                              ? "${data.value} Minute"
                              : data.unitString == "KILOCALORIE"
                                  ? "${double.parse(data.value.toJson()['numericValue']).toStringAsFixed(2)} Kcal"
                                  : "",
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
  }

  Widget get _content => switch (_state) {
        AppState.NO_DATA => noData(),
        AppState.AUTH_NOT_GRANTED => notAuthorized(),
        AppState.FETCHING_DATA => fetchingData(),
        AppState.DATA_READY => showData(),
      };
}
