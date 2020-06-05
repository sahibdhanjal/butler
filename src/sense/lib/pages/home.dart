import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sense/utils/styles.dart';
import 'package:sense/pages/sensors.dart';

List<String> menuOptions = ["Sensors", "Settings", "Contribute"];

class Destination {
  const Destination(this.index, this.title, this.icon, this.color);

  final int index;
  final String title;
  final IconData icon;
  final Color color;
}

const List<Destination> destinationList = <Destination>[
  Destination(0, 'Sensors', Icons.all_inclusive, darkGrey),
  Destination(1, 'Settings', Icons.tune, darkGrey),
  Destination(2, 'Contribute', Icons.code, darkGrey)
];

/////////////////////////////////////////////
// Home Page Class
/////////////////////////////////////////////
class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage>
    with TickerProviderStateMixin<HomePage> {
  List<Key> _destinationsKeys;
  List<AnimationController> _faders;
  AnimationController _hide;
  int _currIdx = 0;

  final sensors = Sensor.getAllSensors();

  final widgetOptions = [Text('Sensors'), Text('Settings'), Text('Contribute')];

  @override
  void initState() {
    super.initState();
    _faders =
        destinationList.map<AnimationController>((Destination destination) {
      return AnimationController(
          vsync: this, duration: Duration(milliseconds: 100));
    }).toList();
    _faders[_currIdx].value = 1;
    _destinationsKeys =
        List<Key>.generate(destinationList.length, (int index) => GlobalKey())
            .toList();
    _hide = AnimationController(vsync: this, duration: kThemeAnimationDuration);
  }

  @override
  void dispose() {
    for (AnimationController ctrl in _faders) ctrl.dispose();
    _hide.dispose();
    super.dispose();
  }

  bool _handleScroll(ScrollNotification notification) {
    if (notification.depth == 0 && notification is UserScrollNotification) {
      final UserScrollNotification userScroll = notification;
      switch (userScroll.direction) {
        case ScrollDirection.forward:
          _hide.forward();
          break;
        case ScrollDirection.reverse:
          _hide.reverse();
          break;
        case ScrollDirection.idle:
          break;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: _handleScroll,
      child: Scaffold(
        body: SafeArea(
          top: false,
          child: Stack(
            fit: StackFit.expand,
            children: destinationList.map((Destination destination) {
              final Widget view = FadeTransition(
                opacity: _faders[destination.index]
                    .drive(CurveTween(curve: Curves.fastLinearToSlowEaseIn)),
                child: KeyedSubtree(
                  key: _destinationsKeys[destination.index],
                  child: DestinationPage(
                    destination: destination,
                    onNavigation: () {
                      _hide.forward();
                    },
                  ),
                ),
              );
              if (destination.index == _currIdx) {
                _faders[destination.index].forward();
                return view;
              } else {
                _faders[destination.index].reverse();
                if (_faders[destination.index].isAnimating) {
                  return IgnorePointer(child: view);
                }
                return Offstage(child: view);
              }
            }).toList(),
          ),
        ),
        bottomNavigationBar: ClipRect(
          child: SizeTransition(
            sizeFactor: _hide,
            axisAlignment: -1.0,
            child: BottomNavigationBar(
              backgroundColor: black,
              selectedItemColor: secondary,
              unselectedItemColor: primaryDark,
              currentIndex: _currIdx,
              onTap: (int index) {
                setState(() {
                  _currIdx = index;
                });
              },
              items: destinationList.map((Destination destination) {
                return BottomNavigationBarItem(
                    icon: Icon(destination.icon),
                    title: Text(destination.title));
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

/////////////////////////////////////////////
// Destination Page Class
/////////////////////////////////////////////
class DestinationPage extends StatefulWidget {
  const DestinationPage({Key key, this.destination, this.onNavigation})
      : super(key: key);
  final Destination destination;
  final VoidCallback onNavigation;

  @override
  _DestinationPage createState() => _DestinationPage();
}

class _DestinationPage extends State<DestinationPage> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      observers: <NavigatorObserver>[
        ViewObserver(widget.onNavigation),
      ],
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            switch (settings.name) {
              case '/':
                return ListPage(destination: widget.destination);
              case '/sensor':
                return SensorPage(destination: widget.destination);
            }
          },
        );
      },
    );
  }
}

/////////////////////////////////////////////
// Navigator Observer Class
/////////////////////////////////////////////
class ViewObserver extends NavigatorObserver {
  ViewObserver(this.onNavigation);

  final VoidCallback onNavigation;

  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    onNavigation();
  }

  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    onNavigation();
  }
}

/////////////////////////////////////////////
// Sensor List Page Class
/////////////////////////////////////////////
class ListPage extends StatelessWidget {
  const ListPage({Key key, this.destination}) : super(key: key);

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
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 128,
              child: Card(
                color: destination.color.withOpacity(0.25),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/");
                  },
                  child: Center(
                    child: Text('Item $index',
                        style: Theme.of(context).primaryTextTheme.display1),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

/////////////////////////////////////////////
// Sensor Page Class
/////////////////////////////////////////////
class SensorPage extends StatelessWidget {
  const SensorPage({Key key, this.destination}) : super(key: key);

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
