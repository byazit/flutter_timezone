import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations=[
    WorldTime(url:'Europe/London', location: 'London', flag: 'uk.jpg'),
    WorldTime(url:'Europe/Athens', location: 'Athens', flag: 'greece.png'),
    WorldTime(url:'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url:'Africa/Nairobi', location: 'Nairobi', flag: 'kenia.png'),
    WorldTime(url:'Asia/Dhaka', location: 'Dhaka', flag: 'bd.png'),
    WorldTime(url:'America/Chicago', location: 'Chicago', flag: 'chicago.png'),
    WorldTime(url:'America/New_York', location: 'New York', flag: 'new_york.jpeg'),
    WorldTime(url:'Australia/Sydney', location: 'Sydney', flag: 'aus.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin',flag: 'german.png'),
    WorldTime(url: 'Europe/Stockholm', location: 'Stockholm',flag: 'sv.png')
  ];
  
  void updateTime(index) async{
    WorldTime instance=locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context,{
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDaytime':instance.isDaytime
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build function ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal:4.0 ),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
