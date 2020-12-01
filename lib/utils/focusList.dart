import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'CustomIconButton.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

Color kInvestmentIconBGColour = null;
Color kInvestmentIconColour = Colors.white;

class FocusList extends StatelessWidget {
  const FocusList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CusomIconButton(
              icon: FontAwesome5Solid.tachometer_alt,
              iconColour: kInvestmentIconColour,
              iconTitle: 'Credit Score',
              iconBGColour: kInvestmentIconBGColour,
              iconPadding: EdgeInsets.only(right: 3),
              iconTitleColour: Colors.white,
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
              icon: Entypo.game_controller,
              iconColour: kInvestmentIconColour,
              iconTitle: 'Games',
              iconBGColour: kInvestmentIconBGColour,
              iconPadding: EdgeInsets.only(right: 0),
              iconTitleColour: Colors.white,
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
              icon: FontAwesome5Solid.rupee_sign,
              iconColour: kInvestmentIconColour,
              iconTitle: 'Pay',
              iconBGColour: kInvestmentIconBGColour,
              iconPadding: EdgeInsets.only(right: 0),
              iconTitleColour: Colors.white,
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
              icon: Icons.track_changes,
              iconColour: kInvestmentIconColour,
              iconTitle: 'Tracker',
              iconBGColour: kInvestmentIconBGColour,
              iconPadding: EdgeInsets.only(right: 4),
              iconTitleColour: Colors.white,
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
              icon: FontAwesome5Solid.user,
              iconColour: kInvestmentIconColour,
              iconTitle: 'My Profile',
              iconBGColour: kInvestmentIconBGColour,
              iconPadding: EdgeInsets.only(right: 0),
              iconTitleColour: Colors.white,
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
        ),
      ],
    );
  }
}
