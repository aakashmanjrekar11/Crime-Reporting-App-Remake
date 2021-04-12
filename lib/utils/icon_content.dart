import 'package:flutter/material.dart';
// import 'package:bmi_calculator/constants.dart';

class IconContent extends StatelessWidget {
  final IconData iconName;
  final Widget fieldName;
  final Color iconColor;

  IconContent(
      {@required this.iconName,
      @required this.iconColor,
      @required this.fieldName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            iconName,
            size: 50.0,
            color: iconColor,
          ),
          SizedBox(height: 10.0),
          fieldName,
        ],
      ),
    );
  }
}
