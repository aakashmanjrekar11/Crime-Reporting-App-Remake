import 'dart:async';

import 'package:Crime_Reporting_AIO_app/utils/authenticator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'drawer_custom.dart';
import 'bottomNavBar_custom.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'utils/carouselWithIndicator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'utils/reusable_card.dart';
import 'utils/icon_content.dart';

// import 'package:double_back_to_close_app/double_back_to_close_app.dart';

class HomeScreen extends StatefulWidget {
  final String username,photo,lat,long,address;
  HomeScreen(this.username,this.photo,this.lat,this.long,this.address);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // }
      
        @override
        Widget build(BuildContext context) {
          return SafeArea(
            child: Scaffold(
              drawer: DrawerCustom(widget.photo),
              appBar: AppBar(
                leading: Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      icon: FaIcon(FontAwesomeIcons.bars),
                      color: Colors.grey[600],
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      colour: Colors.white,
                      cardChild: IconContent(
                        iconName: FontAwesomeIcons.solidPaperPlane,
                        iconColor: Colors.blue[300],
                        fieldName: 'Complaint\nRegistration',
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
                        iconName: FontAwesomeIcons.exclamationTriangle,
                        iconColor: Colors.yellow[700],
                        fieldName: 'Emergency\n Contacts',
                      ),
                    ),
                  ),
                ],
                backgroundColor: Colors.white70,
                title: (widget.username != null)
                    ? Text(
                        "Hi, "+widget.username,
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
              Text("Location lat:${widget.lat}, lon:${widget.long}"),
              Text("Address: ${widget.address}"),
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
                        iconName: FontAwesomeIcons.exclamationTriangle,
                        iconColor: Colors.yellow[700],
                        fieldName: 'Emergency\n Contacts',
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    //! MALE
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
                          fieldName: 'Lost &\n Found',
                        ),
                      ),
                    ),
      
                    //! FEMALE
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
                          fieldName: 'Police \nStations',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Row(
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
            ),
          ],
        ),
        //bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
