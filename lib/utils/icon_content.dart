import 'package:flutter/material.dart';
// import 'package:bmi_calculator/constants.dart';

class IconContent extends StatelessWidget {
  final IconData iconName;
  final String fieldName;
  final Color iconColor;

  IconContent(
      {@required this.iconName,
      @required this.iconColor,
      @required this.fieldName});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconName,
          size: 70.0,
          color: iconColor,
        ),
        SizedBox(height: 15.0),
        Text(
          fieldName,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
