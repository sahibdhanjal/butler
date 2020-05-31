import 'package:flutter/material.dart';
import 'package:sense/utils/styles.dart';
import 'package:sense/utils/sensors.dart';

List<String> menuOptions = [
  "Sensors",
  "Settings",
  "Contribute"
];

class HomePage extends StatefulWidget {
  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final sensors = Sensor.getAllSensors();
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {

    final padding = 5.0;
    return Scaffold(
      backgroundColor: background,
      body: Row(
        children: <Widget>[
          NavigationRail(
            minWidth: 30.0,
            groupAlignment: 1.0,
            backgroundColor: railBackground,
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.all,
            leading: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: CircleAvatar(
                    radius: 16,
                    backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80"),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                RotatedBox(
                  quarterTurns: 1,
                  child: IconButton(
                    icon: Icon(Icons.tune),
                    color: activeLink,
                    onPressed: () {},
                  ),
                )
              ],
            ),
            selectedLabelTextStyle: TextStyle(
              color: activeLink,
              fontSize: 13,
              letterSpacing: 0.8,
              decoration: TextDecoration.underline,
              decorationThickness: 2.0,
            ),
            unselectedLabelTextStyle: TextStyle(
              fontSize: 13,
              letterSpacing: 0.8,
            ),
            destinations: [
              for (var i in menuOptions)
                buildRotatedTextRailDestination(i, padding),
            ],
          ),
          // This is the main content.
          ContentSpace(_selectedIndex)
        ],
      ),
    );
  }
}

NavigationRailDestination buildRotatedTextRailDestination(
    String text, double padding) {
  return NavigationRailDestination(
    icon: SizedBox.shrink(),
    label: Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: RotatedBox(
        quarterTurns: -1,
        child: Text(text),
      ),
    ),
  );
}

class ContentSpace extends StatelessWidget {
  final int _selectedIndex;

  ContentSpace(this._selectedIndex);

  final List<String> images = [
    "https://images.unsplash.com/photo-1524758631624-e2822e304c36?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
    "https://images.unsplash.com/photo-1493663284031-b7e3aefcae8e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
    "https://images.unsplash.com/photo-1538688525198-9b88f6f53126?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80",
    "https://images.unsplash.com/photo-1513161455079-7dc1de15ef3e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    "https://images.unsplash.com/photo-1544457070-4cd773b4d71e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=843&q=80",
    "https://images.unsplash.com/photo-1532323544230-7191fd51bc1b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    "https://images.unsplash.com/photo-1549488344-cbb6c34cf08b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 30, 0, 0),
        child: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: ListView(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.search),
                    color: inactiveLink,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    color: inactiveLink,
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Text(menuOptions[_selectedIndex],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                  ),
              ),
              SizedBox(
                height: 24,
              ),
              for (var i in images) ImageCard(i),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  final uri;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(0, 0, 24, 24),
      child: Image.network(uri),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }

  const ImageCard(this.uri);
}
