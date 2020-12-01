import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'CustomIconButton.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

Color kInvestmentIconBGColour = Colors.green[50];
Color kInvestmentIconColour = Colors.green[400];

class InvestmentsList extends StatelessWidget {
  const InvestmentsList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        CusomIconButton(
          icon: FontAwesome5Solid.piggy_bank,
          iconColour: kInvestmentIconColour,
          iconTitle: 'Savings \nAccount',
          iconBGColour: kInvestmentIconBGColour,
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
          icon: FontAwesome5Solid.briefcase,
          iconColour: kInvestmentIconColour,
          iconTitle: 'Demat \nAccount',
          iconBGColour: kInvestmentIconBGColour,
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
          icon: FontAwesome5Solid.coins,
          iconColour: kInvestmentIconColour,
          iconTitle: 'Fixed \nDeposit',
          iconBGColour: kInvestmentIconBGColour,
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
          icon: FontAwesome5.credit_card,
          iconColour: kInvestmentIconColour,
          iconTitle: 'Credit \nCard',
          iconBGColour: kInvestmentIconBGColour,
          iconPadding: EdgeInsets.only(right: 4),
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
          iconColour: kInvestmentIconColour,
          iconTitle: 'Demo \nDemo',
          iconBGColour: kInvestmentIconBGColour,
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
