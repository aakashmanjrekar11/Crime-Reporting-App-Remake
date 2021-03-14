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
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:flutter_icons/flutter_icons.dart';

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
          backgroundColor: Color(0xFF8185E2),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: FaIcon(FontAwesomeIcons.bars),
                color: Colors.white,
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
                    child: FaIcon(
                      FontAwesomeIcons.signOutAlt,
                      color: Colors.white,
                    ),
                    onTap: () async {
                      await signOutGoogle();
                      _auth.signOut();
                      Navigator.pop(context);
                      Navigator.pop(context);
                    }),
              ),
            ),
          ],
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
              : Text(
                  "Welcome to SecuroServe!",
                  style: TextStyle(color: Colors.white),
                ),
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
                    gradient1: Color(0xFF045DE9),
                    gradient2: Color(0xFF0CBABA),
                    cardChild: IconContent(
                      iconName: FontAwesomeIcons.solidPaperPlane,
                      iconColor: Colors.white,
                      fieldName: '   Complaint\n Registration',
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
                    gradient1: Color(0xFFFFDD00),
                    gradient2: Color(0xFFFBB034),
                    cardChild: IconContent(
                      iconName: FontAwesomeIcons.exclamationTriangle,
                      iconColor: Colors.white,
                      fieldName: 'Emergency\n  Contacts',
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
                    gradient1: Color(0xFFFF0000), //890000
                    gradient2: Color(0xFFFF7878), //DF0020
                    cardChild: IconContent(
                      iconName: FontAwesomeIcons.wallet,
                      iconColor: Colors.white,
                      fieldName: ' Lost & \n Found',
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
                    gradient1: Color(0xFF11998e), //380036
                    gradient2: Color(0xFF38de7d), //0CBABA
                    cardChild: IconContent(
                      iconName: FontAwesomeIcons.phoneAlt,
                      iconColor: Colors.white,
                      fieldName: '     Mumbai Police\nStations Contacts',
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
                    gradient1: Color(0xFFAD1DEB),
                    gradient2: Color(0xFF6E72FC),
                    cardChild: IconContent(
                      iconName: FontAwesomeIcons.solidIdCard,
                      iconColor: Colors.white,
                      fieldName: 'E-complaint Mumbai\n       Police Website',
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
                    gradient1: Color(0xFFFFBE0B),
                    gradient2: Color(0xFFF42B03),
                    cardColour: Colors.white,
                    cardChild: IconContent(
                      iconName: FontAwesomeIcons.userShield,
                      iconColor: Colors.white,
                      fieldName: 'Safety\n  Tips',
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
                        Navigator.pushNamed(context, '/emergency');
                      });
                    },
                    gradient1: Color(0xFFbc4e9c),
                    gradient2: Color(0xFFf80759),
                    cardChild: IconContent(
                      iconName: FlutterIcons.female_faw,
                      iconColor: Colors.white,
                      fieldName: 'National Commission\n  for Women website',
                    ),
                  ),
                ),

                //! FEMALE
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        Navigator.pushNamed(context, '/childlineindia');
                      });
                    },
                    gradient1: Color(0xFF20A4F3),
                    gradient2: Color(0xFF182B3A),
                    cardChild: IconContent(
                      iconName: FontAwesomeIcons.baby,
                      iconColor: Colors.white,
                      fieldName: 'Child Line India\n        Website',
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
                        Navigator.pushNamed(context, '/emergency');
                      });
                    },
                    gradient1: Color(0xFFF5F7FA),
                    gradient2: Color(0xFFB8C6DB),
                    cardChild: IconContent(
                      iconName: FontAwesomeIcons.question,
                      iconColor: Colors.white,
                      fieldName: '   Test\n Demo',
                    ),
                  ),
                ),

                //! FEMALE
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        Navigator.pushNamed(context, '/emergency');
                      });
                    },
                    gradient1: Color(0xFFF5F7FA),
                    gradient2: Color(0xFFB8C6DB),
                    cardChild: IconContent(
                      iconName: FontAwesomeIcons.question,
                      iconColor: Colors.white,
                      fieldName: '   Test\n Demo',
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
                    gradient1: Color(0xFFF5F7FA),
                    gradient2: Color(0xFFB8C6DB),
                    cardChild: IconContent(
                      iconName: FontAwesomeIcons.question,
                      iconColor: Colors.white,
                      fieldName: '   Test\n Demo',
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
                    gradient1: Color(0xFFF5F7FA),
                    gradient2: Color(0xFFB8C6DB),
                    cardChild: IconContent(
                        iconName: FontAwesomeIcons.question,
                        iconColor: Colors.white,
                        fieldName: '   Test\n Demo'),
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
