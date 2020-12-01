import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'CustomIconButton.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

Color kRechargeIconBGColour = Colors.blue[50];
Color kRechargeIconColour = Colors.blue[400];

class RechargeBillList extends StatelessWidget {
  const RechargeBillList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CusomIconButton(
              icon: FontAwesome5Solid.sim_card,
              iconColour: kRechargeIconColour,
              iconTitle: 'Mobile\nPrepaid',
              iconBGColour: kRechargeIconBGColour,
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
              icon: LineAwesomeIcons.sim_card,
              iconColour: kRechargeIconColour,
              iconTitle: 'Mobile \nPostpaid',
              iconBGColour: kRechargeIconBGColour,
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
              icon: FontAwesomeIcons.satelliteDish,
              iconColour: kRechargeIconColour,
              iconTitle: 'DTH',
              iconBGColour: kRechargeIconBGColour,
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
              icon: FontAwesome5Solid.bolt,
              iconColour: kRechargeIconColour,
              iconTitle: 'Electricity',
              iconBGColour: kRechargeIconBGColour,
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
              icon: FontAwesomeIcons.creditCard,
              iconColour: kRechargeIconColour,
              iconTitle: 'Credit \nCard Bills',
              iconBGColour: kRechargeIconBGColour,
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
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CusomIconButton(
              icon: FontAwesome5Solid.shield_alt,
              iconColour: kRechargeIconColour,
              iconTitle: 'Insurance',
              iconBGColour: kRechargeIconBGColour,
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
              icon: FontAwesomeIcons.faucet,
              iconColour: kRechargeIconColour,
              iconTitle: 'Water',
              iconBGColour: kRechargeIconBGColour,
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
              icon: FontAwesome5Solid.download,
              iconColour: kRechargeIconColour,
              iconTitle: 'Data Card',
              iconBGColour: kRechargeIconBGColour,
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
              icon: FontAwesome5Solid.burn,
              iconColour: kRechargeIconColour,
              iconTitle: 'Gas',
              iconBGColour: kRechargeIconBGColour,
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
              icon: Entypo.old_phone,
              iconColour: kRechargeIconColour,
              iconTitle: 'Landline',
              iconBGColour: kRechargeIconBGColour,
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
        ),
        SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 5,
            ),
            CusomIconButton(
              icon: FontAwesome5Solid.wifi,
              iconColour: kRechargeIconColour,
              iconTitle: 'Broadband',
              iconBGColour: kRechargeIconBGColour,
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
              icon: FontAwesome5Solid.train,
              iconColour: kRechargeIconColour,
              iconTitle: 'Metro',
              iconBGColour: kRechargeIconBGColour,
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
              icon: FontAwesome5Solid.gas_pump,
              iconColour: kRechargeIconColour,
              iconTitle: 'Fasttag',
              iconBGColour: kRechargeIconBGColour,
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
        ),
      ],
    );
  }
}
