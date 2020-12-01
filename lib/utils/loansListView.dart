import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'CustomIconButton.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

Color kLoansIconBGColour = Colors.orange[50];
Color kLoansIconColour = Colors.orange[400];

class LoansListView extends StatelessWidget {
  const LoansListView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        CusomIconButton(
          icon: FontAwesome5Solid.file_invoice_dollar,
          iconColour: kLoansIconColour,
          iconTitle: 'Instant \nLoan',
          iconBGColour: kLoansIconBGColour,
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
          icon: FontAwesome5Solid.hand_holding_usd,
          iconColour: kLoansIconColour,
          iconTitle: 'Personal \nLoan',
          iconBGColour: kLoansIconBGColour,
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
          icon: FontAwesomeIcons.biking,
          iconColour: kLoansIconColour,
          iconTitle: 'Two Wheeler\nLoan',
          iconBGColour: kLoansIconBGColour,
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
          icon: FontAwesome5Solid.car_side,
          iconColour: kLoansIconColour,
          iconTitle: 'Car\nLoan',
          iconBGColour: kLoansIconBGColour,
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
          icon: FontAwesome5Solid.question,
          iconColour: kLoansIconColour,
          iconTitle: 'Demo \nDemo',
          iconBGColour: kLoansIconBGColour,
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
