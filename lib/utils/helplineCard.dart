import 'package:flutter/material.dart';
import 'package:telephony/telephony.dart';

class helplineCard extends StatelessWidget {
  Telephony telephony = Telephony.instance;

  final String helplineName;
  final String helplineNo;

  helplineCard({
    @required this.helplineName,
    @required this.helplineNo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: const Icon(
          Icons.phone,
          color: Colors.blue,
          size: 30,
        ),
        title: GestureDetector(
          child: Text(
            helplineName,
            textScaleFactor: 1.5,
          ),
          onTap: () {
            telephony.openDialer(helplineNo);
          },
        ),
      ),
    );
  }
}
