import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:sense/utils/styles.dart';
import 'package:sense/utils/definitions.dart';

import 'package:sense/pages/sensors.dart';

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
              backgroundColor: grey80,
              selectedItemColor: primaryMid,
              unselectedItemColor: grey60,
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
  DestinationPage({Key key, this.destination, this.onNavigation})
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
