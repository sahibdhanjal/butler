import 'package:flutter/material.dart';

import 'package:sense/utils/styles.dart';
import 'package:sense/utils/definitions.dart';

/////////////////////////////////////////////
// Sensor List Page Class
/////////////////////////////////////////////
class ListPage extends StatelessWidget {
  ListPage({Key key, this.destination}) : super(key: key);
  final Destination destination;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(destination.title),
        backgroundColor: destination.color,
      ),
      backgroundColor: destination.color,
      body: SizedBox.expand(
        child: ListView.builder(
          itemCount: sensorList.length,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 150,
              child: SensorCard(sensor: sensorList[index]),
            );
          },
        ),
      ),
    );
  }
}

/////////////////////////////////////////////
// Sensor Card Class
/////////////////////////////////////////////
class SensorCard extends StatelessWidget {
  SensorCard({Key key, this.sensor}) : super(key: key);
  final Sensor sensor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
      child: Card(
        color: grey80,
        shadowColor: black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, "/sensor");
          },
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              ListTile(
                leading: Icon(
                    this.sensor.icon,
                    size: 50
                ),
                title: Text(
                  this.sensor.sensor,
                  style: TextStyle(
                      color: primaryMid,
                      fontSize: 25,
                  ),
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}

/////////////////////////////////////////////
// Sensor Page Class
/////////////////////////////////////////////
class SensorPage extends StatelessWidget {
  SensorPage({Key key, this.destination}) : super(key: key);

  final Destination destination;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(destination.title),
        backgroundColor: destination.color,
      ),
      backgroundColor: destination.color,
      body: SizedBox.expand(
        child: Text('Sensor'),
      ),
    );
  }
}
