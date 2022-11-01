import 'package:broad_cast_receiver/screen2.dart';
import 'package:broad_cast_receiver/screen3.dart';
import 'package:broad_cast_receiver/screen4.dart';
import 'package:flutter/material.dart';
import 'package:fbroadcast/fbroadcast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:
            AppBar(title: Text('Spinner List of Custom Boradcast Receiver')),
        body: DropDown(),
      ),
    );
  }
}

class DropDown extends StatefulWidget {
  @override
  DropDownWidget createState() => DropDownWidget();
}

class DropDownWidget extends State {
  String dropdownValue = 'Custom broadcast receiver';

  List<String> spinnerItems = [
    'Custom broadcast receiver',
    'Wifi state change receiver',
    'System battery notification receiver'
  ];

  Widget showDropdown(value) {
    String enteredText = "";
    String batteryGuess = "";
    if (value == 'Custom broadcast receiver') {
      return Container(
        //
        width: 300,
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          TextField(
            onChanged: (value) {
              enteredText = value;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Text',
              hintText: 'Enter Your Text',
            ),
          ),
          ElevatedButton(
              onPressed: () {
                FBroadcast.instance().stickyBroadcast("Voga",
                    value: enteredText, persistence: true);

                Navigator.push(
                  context,
                  // MaterialPageRoute(builder: (context) => const screen2()),
                  MaterialPageRoute(builder: (context) => const screen2()),
                );
              },
              child: Text("Click me"))
        ]),
      );
    }
    else if (value == 'Wifi state change receiver'){
      return Container(
        //
        width: 300,
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Screen3(
                        title: '',
                      )),
                );
              },
              child: Text("Click me"))
        ]),
      );
    }
    else{
      return Container(
        //
        width: 300,
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          TextField(
            onChanged: (value) {
              batteryGuess = value;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Batery Percentage',
              hintText: 'Guess the Battery Percentage',
            ),
          ),
          ElevatedButton(
              onPressed: () {
                FBroadcast.instance().stickyBroadcast("batteryg",
                    value: batteryGuess, persistence: true);

                Navigator.push(
                  context,
                  // MaterialPageRoute(builder: (context) => const screen2()),
                  MaterialPageRoute(builder: (context) => const Screen4()),
                );
              },
              child: Text("Check the Actual"))
        ]),
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    print("called");

    return Scaffold(
      body: Center(
        child: Column(children: <Widget>[
          DropdownButton<String>(
            value: dropdownValue,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.red, fontSize: 18),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (data) {
              setState(() {
                dropdownValue = data!;
              });
            },
            items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value!,
                child: Text(value),
              );
            }).toList(),
          ),
          showDropdown(dropdownValue),
        ]),
      ),
    );
  }
}