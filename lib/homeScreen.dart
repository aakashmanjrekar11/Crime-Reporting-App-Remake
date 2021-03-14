import 'dart:async';

import 'package:Crime_Reporting_AIO_app/screens/emergency_contacts.dart';
import 'package:Crime_Reporting_AIO_app/utils/authenticator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'drawer_custom.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'utils/carouselWithIndicator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'utils/reusable_card.dart';
import 'utils/icon_content.dart';
import 'package:telephony/telephony.dart';

// import 'package:double_back_to_close_app/double_back_to_close_app.dart';

class HomeScreen extends StatefulWidget {
  final String username, lat, long, address, photoURL;
  HomeScreen(this.username, this.lat, this.long, this.address, this.photoURL);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
  Future<void> _textMe() async {
    var docRef = FirebaseFirestore.instance.collection('emergency_contacts');
    Telephony telephony = Telephony.instance; 
    docRef.where("UserName",isEqualTo:widget.username).limit(1).get().then((value) { value.docs.forEach((doc) {
        telephony.sendSms(to: doc["Contact1 Phone"], message: "I\'m in danger. My coordinates are ${widget.lat} ${widget.long} ${widget.address}");
        telephony.sendSms(to: doc["Contact2 Phone"], message: "I\'m in danger. My coordinates are ${widget.lat} ${widget.long} ${widget.address}");
    });});
    
      }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: DrawerCustom(widget.photoURL),
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: FaIcon(FontAwesomeIcons.bars),
                color: Colors.grey[600],
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
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
                child: GestureDetector(
                    child: FaIcon(FontAwesomeIcons.signOutAlt),
                    onTap: () async {
                      await signOutGoogle();
                      _auth.signOut();
                      Navigator.pop(context);
                      Navigator.pop(context);
                    }),
              ),
            ),
          ],
          backgroundColor: Colors.white70,
          title: (widget.username != null)
              ? Text(
                  "Hi, " + widget.username,
                  style: TextStyle(
                    fontSize: 23.0,
                    fontWeight: FontWeight.bold,
                    //fontStyle: FontStyle.italic,
                    color: Colors.grey[800],
                  ),
                )
              : Text("Looking for username"),
        ),
        body: ListView(
          children: <Widget>[
            SizedBox(height: 20.0),
            CarouselWithIndicatorDemo(),
            SizedBox(
              height: 5.0,
              child: Divider(
                indent: 180,
                endIndent: 180,
                color: Colors.grey[400],
                thickness: 1.2,
              ),
            ),
            Row(
              children: <Widget>[
                //! Complaint Registration
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        Navigator.pushNamed(context, '/complaint');
                      });
                    },
                    colour: Colors.white,
                    cardChild: IconContent(
                      iconName: FontAwesomeIcons.solidPaperPlane,
                      iconColor: Colors.blue[300],
                      fieldName: 'Complaint\nRegistration',
                    ),
                  ),
                ),

                //! Emergency Contacts
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Emergency(username: widget.username,)));
                      });
                    },
                    colour: Colors.white,
                    cardChild: IconContent(
                      iconName: FontAwesomeIcons.exclamationTriangle,
                      iconColor: Colors.yellow[700],
                      fieldName: 'Emergency\n Contacts',
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                //! Lost and Found
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        Navigator.pushNamed(context, '/lostfound');
                      });
                    },
                    colour: Colors.white,
                    cardChild: IconContent(
                      iconName: FontAwesomeIcons.wallet,
                      iconColor: Colors.brown,
                      fieldName: 'Lost & \nFound',
                    ),
                  ),
                ),

                //! Mumbai Police Stations
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        Navigator.pushNamed(context, '/list');
                      });
                    },
                    colour: Colors.white,
                    cardChild: IconContent(
                      iconName: FontAwesomeIcons.phoneAlt,
                      iconColor: Colors.green[400],
                      fieldName: 'Mumbai Police \nStations Contacts',
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                //! E-complaint Mumbai Police Website
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        Navigator.pushNamed(context, '/eComplaint');
                      });
                    },
                    colour: Colors.white,
                    cardChild: IconContent(
                      iconName: FontAwesomeIcons.solidIdCard,
                      iconColor: Colors.indigo,
                      fieldName: 'E-complaint Mumbai Police Website',
                    ),
                  ),
                ),

                //! Safety Tips Website
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        Navigator.pushNamed(context, '/safetyTips');
                      });
                    },
                    colour: Colors.white,
                    cardChild: IconContent(
                      iconName: FontAwesomeIcons.userShield,
                      iconColor: Colors.red[400],
                      fieldName: 'Safety\nTips',
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                //! MALE
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        Navigator.pushNamed(context, '/complaint');
                      });
                    },
                    colour: Colors.white,
                    cardChild: IconContent(
                      iconName: FontAwesomeIcons.question,
                      iconColor: Colors.grey,
                      fieldName: 'extra',
                    ),
                  ),
                ),

                //! FEMALE
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        Navigator.pushNamed(context, '/complaint');
                      });
                    },
                    colour: Colors.white,
                    cardChild: IconContent(
                        iconName: FontAwesomeIcons.question,
                        iconColor: Colors.grey,
                        fieldName: 'extra'),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                //! MALE
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        Navigator.pushNamed(context, '/complaint');
                      });
                    },
                    colour: Colors.white,
                    cardChild: IconContent(
                      iconName: FontAwesomeIcons.question,
                      iconColor: Colors.grey,
                      fieldName: 'extra',
                    ),
                  ),
                ),

                //! FEMALE
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        Navigator.pushNamed(context, '/complaint');
                      });
                    },
                    colour: Colors.white,
                    cardChild: IconContent(
                        iconName: FontAwesomeIcons.question,
                        iconColor: Colors.grey,
                        fieldName: 'extra'),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                //! MALE
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        Navigator.pushNamed(context, '/complaint');
                      });
                    },
                    colour: Colors.white,
                    cardChild: IconContent(
                      iconName: FontAwesomeIcons.question,
                      iconColor: Colors.grey,
                      fieldName: 'extra',
                    ),
                  ),
                ),

                //! FEMALE
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        Navigator.pushNamed(context, '/complaint');
                      });
                    },
                    colour: Colors.white,
                    cardChild: IconContent(
                        iconName: FontAwesomeIcons.question,
                        iconColor: Colors.grey,
                        fieldName: 'extra'),
                  ),
                ),
              ],
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            _textMe();
          },
          label: Text('SOS'),
          icon: Icon(Icons.report),
          backgroundColor: Colors.red,
        ),
        //bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
