import 'package:flutter/material.dart';

import 'package:sense/utils/styles.dart';




/////////////////////////////////////////////////////////////////
// Definitions of all Common Classes
/////////////////////////////////////////////////////////////////
class Destination {
  const Destination(this.index, this.title, this.icon, this.color);
  final int index;
  final String title;
  final IconData icon;
  final Color color;
}

class Sensor {
  Sensor(this.sensor, this.icon);
  final String sensor;
  final IconData icon;
  Map<String, String> sensorInfo = {
    'name': '',
    'type': '',
    'vendorName': '',
    'version': '',
    'power': '',
    'resolution': '',
    'maxRange': '',
    'minDelay': '',
    'maxDelay': '',
    'reportingMode': '',
    'isWakeup': '',
    'isDynamic': '',
    'highestDirectReportRateValue': '',
    'fifoMaxEventCount': '',
    'fifoReservedEventCount': ''
  };
}


/////////////////////////////////////////////////////////////////
// List Definitions
/////////////////////////////////////////////////////////////////

const List<Destination> destinationList = <Destination>[
  Destination(0, 'Sensors', Icons.all_inclusive, black),
  Destination(1, 'Settings', Icons.tune, black),
  Destination(2, 'Contribute', Icons.code, black)
];

List<Sensor> sensorList = <Sensor>[
  Sensor("Accelerometer", Icons.highlight),
  Sensor("GPS", Icons.gps_fixed),
  Sensor("WiFi", Icons.wifi_tethering),
  Sensor("Compass", Icons.wifi_tethering),
];
