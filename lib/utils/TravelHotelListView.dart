import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'CustomIconButton.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

Color kTravelIconBGColour = Colors.purple[50];
Color kTravelIconColour = Colors.purple[400];

class TravelList extends StatelessWidget {
  const TravelList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        CusomIconButton(
          icon: Entypo.aircraft,
          iconColour: kTravelIconColour,
          iconTitle: 'Flight',
          iconBGColour: kTravelIconBGColour,
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
          icon: FontAwesome5Solid.utensils,
          iconColour: kTravelIconColour,
          iconTitle: 'Hotels',
          iconBGColour: kTravelIconBGColour,
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
          icon: FontAwesomeIcons.subway,
          iconColour: kTravelIconColour,
          iconTitle: 'Train',
          iconBGColour: kTravelIconBGColour,
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
          icon: FontAwesome5Solid.bus_alt,
          iconColour: kTravelIconColour,
          iconTitle: 'Bus',
          iconBGColour: kTravelIconBGColour,
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
          icon: FontAwesome5Solid.question,
          iconColour: kTravelIconColour,
          iconTitle: 'Demo',
          iconBGColour: kTravelIconBGColour,
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
        // CusomIconButton(
        //   icon: FontAwesome5Solid.question,
        //   iconColour: kTravelIconColour,
        //   iconTitle: 'Demo \nDemo',
        //   iconBGColour: kTravelIconBGColour,
        //   iconPadding: EdgeInsets.only(right: 0),
        //   onTap: () {
        //     Fluttertoast.showToast(
        //       msg: "⚠️Under Construction!⚠️",
        //       toastLength: Toast.LENGTH_SHORT,
        //       gravity: ToastGravity.BOTTOM,
        //       timeInSecForIosWeb: 1,
        //       backgroundColor: Colors.grey,
        //       textColor: Colors.white,
        //       fontSize: 16.0,
        //     );
        //   },
        // ),
      ],
    );
  }
}
