import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'CustomIconButton.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

Color kInsuranceIconBGColour = Colors.indigo[50];
Color kInsuranceIconColour = Colors.indigo[400];

class InsuranceList extends StatelessWidget {
  const InsuranceList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CusomIconButton(
          icon: FontAwesome5Solid.heartbeat,
          iconColour: kInsuranceIconColour,
          iconTitle: 'Health \nInsurance',
          iconBGColour: kInsuranceIconBGColour,
          iconPadding: EdgeInsets.only(right: 0),
          onTap: () {
            Fluttertoast.showToast(
              msg: "⚠️Under Construction!⚠️",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          },
        ),
        CusomIconButton(
          icon: FontAwesome5Solid.car_crash,
          iconColour: kInsuranceIconColour,
          iconTitle: 'Car \nInsurance',
          iconBGColour: kInsuranceIconBGColour,
          iconPadding: EdgeInsets.only(right: 8),
          onTap: () {
            Fluttertoast.showToast(
              msg: "⚠️Under Construction!⚠️",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          },
        ),
        CusomIconButton(
          icon: FontAwesomeIcons.users,
          iconColour: kInsuranceIconColour,
          iconTitle: 'Term \nInsurance',
          iconBGColour: kInsuranceIconBGColour,
          iconPadding: EdgeInsets.only(right: 7),
          onTap: () {
            Fluttertoast.showToast(
              msg: "⚠️Under Construction!⚠️",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          },
        ),
        CusomIconButton(
          icon: FontAwesome5Solid.motorcycle,
          iconColour: kInsuranceIconColour,
          iconTitle: 'Two Wheeler \nInsurance',
          iconBGColour: kInsuranceIconBGColour,
          iconPadding: EdgeInsets.only(right: 5),
          onTap: () {
            Fluttertoast.showToast(
              msg: "⚠️Under Construction!⚠️",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          },
        ),
        CusomIconButton(
          icon: FontAwesome5Solid.question,
          iconColour: kInsuranceIconColour,
          iconTitle: 'Demo \nDemo',
          iconBGColour: kInsuranceIconBGColour,
          iconPadding: EdgeInsets.only(right: 0),
          onTap: () {
            Fluttertoast.showToast(
              msg: "⚠️Under Construction!⚠️",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.grey,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          },
        ),
      ],
    );
  }
}
