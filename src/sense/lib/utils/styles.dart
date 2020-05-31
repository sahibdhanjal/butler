// Refer - https://stackoverflow.com/questions/52326268/how-to-create-a-round-checkbox-in-flutter-or-change-the-checkboxs-style-suc
import 'package:flutter/material.dart';

Color background = Color(0xff28292E);
Color railBackground = Color(0xff2D3035);
Color inactiveLink = Colors.white30;
Color activeLink = Color(0xffFCCFA8);

Color backgroundIP = Color.fromRGBO(2, 89, 255, 1);
Color sensorBoxBackground = Color.fromRGBO(25, 32, 76, 1);
Color checkboxActive = Color.fromRGBO(11, 224, 187, 1);
Color checkboxInactive = Color.fromRGBO(255, 255, 255, 1);
Color graphBox = Color.fromRGBO(37, 43, 85, 1);

String logoPath = "assets/img/logo.png";

class SensorText extends StatelessWidget {
  final String description;
  final String value;
  SensorText({Key key, this.description, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Row(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.43,
            color: graphBox,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                this.description,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.3 ,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                this.value,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// Flutter Class for Circular Shaped checkbox
class CircleCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;
  final Color checkColor;
  final bool tristate;
  final MaterialTapTargetSize materialTapTargetSize;

  CircleCheckbox({
    Key key,
    @required this.value,
    this.tristate = false,
    @required this.onChanged,
    this.activeColor,
    this.checkColor,
    this.materialTapTargetSize,
  })  : assert(tristate != null),
        assert(tristate || value != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox(
        width: Checkbox.width,
        height: Checkbox.width,
        child: Container(
          decoration: new BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 1,
            ),
            borderRadius: new BorderRadius.circular(100),
          ),
          child: Checkbox(
            value: value,
            tristate: tristate,
            onChanged: onChanged,
            activeColor: activeColor,
            checkColor: checkColor,
            materialTapTargetSize: materialTapTargetSize,
          ),
        ),
      ),
    );
  }
}

// Flutter Class for Custom Switch
// https://pub.dev/packages/custom_switch#-readme-tab-
class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;

  const CustomSwitch({Key key, this.value, this.onChanged, this.activeColor})
      : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}
class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  Animation _circleAnimation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 60));
    _circleAnimation = AlignmentTween(
        begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
        end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
        parent: _animationController, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController.isCompleted) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
            widget.value == false
                ? widget.onChanged(true)
                : widget.onChanged(false);
          },
          child: Container(
            width: 40.0,
            height: 25.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: _circleAnimation.value == Alignment.centerLeft
                    ? Colors.grey
                    : widget.activeColor),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 4.0, bottom: 4.0, right: 4.0, left: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _circleAnimation.value == Alignment.centerRight
                      ? Padding(
                    padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                    child: Text(
                      'On',
                      style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.w900,
                          fontSize: 12.0),
                    ),
                  )
                      : Container(),
                  Align(
                    alignment: _circleAnimation.value,
                    child: Container(
                      width: 25.0,
                      height: 25.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                    ),
                  ),
                  _circleAnimation.value == Alignment.centerLeft
                      ? Padding(
                    padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                    child: Text(
                      'Off',
                      style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.w900,
                          fontSize: 12.0),
                    ),
                  )
                      : Container(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
