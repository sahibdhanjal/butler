import 'package:flutter/material.dart';
import 'package:sense/utils/styles.dart';
import 'package:sense/utils/home.dart';

void main() {
  runApp(MaterialApp(
    home: Sense(),
  ));
}

class Sense extends StatefulWidget {
  _AppState createState() => _AppState();
}

class _AppState extends State<Sense> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 2),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(
              title: "sense",
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlutterLogo(
          size: 200,
        ),
      ),
      backgroundColor: background,
    );
  }
}
