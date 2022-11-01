import 'dart:async';

import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:battery_info/battery_info_plugin.dart';
import 'package:battery_info/model/android_battery_info.dart';

class screen2 extends StatefulWidget {
  const screen2({Key? key}) : super(key: key);

  @override
  State<screen2> createState() => _screen2State();
}

class _screen2State extends State<screen2> {
  var data = FBroadcast.value('Voga');

  @override
  void initState() {
    FBroadcast.instance().register("Voga", (value, callback) {
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
        title: const Text('Custom Broadcast Receiver'),
      ),
      body: Center(
        child: Container(
            // child: Text('Text from Custom Broadcast Receiver:\n' + data,  style: TextStyle(fontWeight: FontWeight.bold))
            child: RichText(textAlign: TextAlign.center,
                text: TextSpan(
                    style: TextStyle(color: Colors.redAccent, ), //style for all textspan
                    children: [
                      TextSpan(text:"Text from Custom Broadcast Receiver\n", style: TextStyle(fontSize: 19)),
                      // TextSpan(text:"You can learn to build"),
                      // TextSpan(text:data, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      TextSpan(text:data, style: TextStyle(color: Colors.blueAccent, fontSize: 30))
                    ]
                )
            )
        ),
      ),
    );
  }
}
