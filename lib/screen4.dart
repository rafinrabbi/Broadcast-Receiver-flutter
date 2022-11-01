import 'dart:async';

import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:battery_info/battery_info_plugin.dart';
import 'package:battery_info/model/android_battery_info.dart';

class Screen4 extends StatefulWidget {
  const Screen4({Key? key}) : super(key: key);

  @override
  State<Screen4> createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  var data = FBroadcast.value('batteryg');

  @override
  void initState() {
    FBroadcast.instance().register("batteryg", (value, callback) {
      /// get data
      data = value;
      setState(() {
        print("This " + data);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Battery'),
      ),
      body: Center(
        child: Container(
          child: FutureBuilder<AndroidBatteryInfo?>(
              future: BatteryInfoPlugin().androidBatteryInfo,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return
                      // Text(
                      //   data+'-Battery Health: ${snapshot.data?.batteryLevel}',
                      //   style: TextStyle(fontWeight: FontWeight.bold));
                      Container(
                          // child: Text('Text from Custom Broadcast Receiver:\n' + data,  style: TextStyle(fontWeight: FontWeight.bold))
                          child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  style: TextStyle(
                                    color: Colors.redAccent,
                                  ),
                                  //style for all textspan
                                  children: [
                                    TextSpan(
                                        text:
                                            "Your Guess was "+ data+ "\n",
                                        style: TextStyle(fontSize: 19)),
                                    // TextSpan(text:"You can learn to build"),
                                    // TextSpan(text:data, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                    TextSpan(
                                        text: 'Actual Percentage is ${snapshot.data?.batteryLevel}',
                                        style: TextStyle(
                                            color: Colors.blueAccent,
                                            fontSize: 30))
                                  ])));
                }
                return CircularProgressIndicator();
              }),
        ),
      ),
    );
  }
}
