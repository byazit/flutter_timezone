import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setupWorldTime() async{
    WorldTime instance=WorldTime(url: 'Europe/Stockholm', location: 'Stockholm',flag: 'sv.png');
    await instance.getTime();
    //jump to different page by replacing existing route
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDaytime':instance.isDaytime
    });

  }

  @override
  void initState() {
    print('init state runing');
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[800],
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.redAccent,
          size: 50.0,
        ),
      ),
    );
  }
}
