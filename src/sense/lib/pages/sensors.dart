import 'package:flutter/material.dart';
import 'package:sense/utils/styles.dart';

class Sensor {
  final String name;
  final String iconLocation;
  final String sensorPage;

  Sensor(this.name, this.iconLocation, this.sensorPage);

  static List<Sensor> getAllSensors() {
    List<Sensor> sensors = <Sensor>[];
    sensors.add(Sensor("Accelerometer", "Accelerometer", "Accelerometer"));
    sensors.add(Sensor("GPS", "GPS", "GPS"));
    sensors.add(Sensor("Compass", "Compass", "Compass"));
    sensors.add(Sensor("Proximity", "Proximity", "Proximity"));
    sensors.add(Sensor("WiFi", "WiFi", "WiFi"));
    sensors.add(Sensor("Lux", "Lux", "Lux"));
    sensors.add(Sensor("Pedometer", "Pedometer", "Pedometer"));
    return sensors;
  }
}
