import 'package:flutter/material.dart';

class CusomIconButton extends StatelessWidget {
  final IconData icon;
  final Color iconColour;
  final String iconTitle;
  final Color iconBGColour;
  final EdgeInsets iconPadding;
  final Function onTap;
  final Color iconTitleColour;

  CusomIconButton({
    @required this.icon,
    @required this.iconColour,
    @required this.iconTitle,
    @required this.iconBGColour,
    @required this.iconPadding,
    @required this.onTap,
    this.iconTitleColour,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(
      //   left: 10.0,
      // ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          MaterialButton(
            height: 30,
            onPressed: onTap,
            color: iconBGColour,
            //textColor: Colors.white,
            child: Padding(
              padding: iconPadding,
              child: Icon(
                icon,
                size: 25,
                color: iconColour,
              ),
            ),
            padding: EdgeInsets.all(18),
            shape: CircleBorder(),
            elevation: 0,
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            iconTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.5,
              color: iconTitleColour,
            ),
          ),
        ],
      ),
    );
  }
}
