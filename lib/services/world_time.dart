import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name for the UI
  String time; //time for the location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint
  bool isDaytime; // true of false if daytime or not

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      //make the request
      Response response =
          await get('https://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      //print(data);

      //get properties data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      //create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      //set the time property
      isDaytime = now.hour > 6 && now.hour < 15 ? true:false;
      time = DateFormat.jm().format(now);//formatting time
    } catch (e) {
      time="Could not get time data";
      print('caught error: $e');
    }
  }
}