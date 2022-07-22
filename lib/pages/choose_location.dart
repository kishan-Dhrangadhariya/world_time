import 'package:flutter/material.dart';
import 'package:world_time/utils/time_utils.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List worldTImeLocationList = [
    WorldTime(location: 'London', flag: 'london.png', url: 'Europe/London'),
    WorldTime(location: 'Berlin', flag: 'london.png', url: 'Europe/Berlin'),
    WorldTime(location: 'Seoul', flag: 'london.png', url: 'Asia/Seoul'),
    WorldTime(location: 'New_York', flag: 'london.png', url: 'America/New_York'),
  ];
  @override
  void initState() {
    super.initState();
  }

  void updateLocation(index) async {
    WorldTime currLocation = worldTImeLocationList[index];
    await currLocation.getTime();
    Navigator.pop(context, {
      'location': currLocation.location,
      'flag': currLocation.flag,
      'time': currLocation.time,
      'isDayTime': currLocation.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: worldTImeLocationList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  updateLocation(index);
                },
                title: Text(worldTImeLocationList[index].location),
              ),
            );
          }
      )
    );
  }
}