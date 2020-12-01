import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton(
      {@required this.icon,
      @required this.iconColour,
      @required this.iconTitle,
      @required this.iconBGColour,
      @required this.onTap});

  final IconData icon;
  final Color iconColour;
  final String iconTitle;
  final Color iconBGColour;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onTap,
      child: Center(
        child: Icon(
          icon,
          color: iconColour,
          size: 25.0,
        ),
      ),
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: iconBGColour,
    );
  }
}
