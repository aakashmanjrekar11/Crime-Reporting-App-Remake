import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'utils/authenticator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DrawerCustom extends StatefulWidget {
  final String photoURL, username;
  DrawerCustom(this.photoURL, this.username);
  @override
  _DrawerCustomState createState() => _DrawerCustomState();
}

class _DrawerCustomState extends State<DrawerCustom> {
  final _auth = FirebaseAuth.instance;
  String img = "";

  @override
  void initState() {
    img = widget.photoURL;
    if (img == "" || img == null) {
      img =
          "https://firebasestorage.googleapis.com/v0/b/crm-app-e8f52.appspot.com/o/Indian%20Police%20Officer.jpg?alt=media&token=c58bd7b3-be2d-4a50-9fc9-20e73aeac428";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 190,
            width: 100,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 150, 10),
              child: Column(
                children: [
                  CircularProfileAvatar(
                    img,
                    radius: 70,
                    borderWidth: 3,
                    borderColor: Colors.black,
                  ),
                  SizedBox(height: 3),
                  Text(
                    widget.username,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            color: Color(0xFF8185E2),
          ),
          SizedBox(height: 20),
          ListTile(
            leading: Icon(FontAwesomeIcons.user, color: Color(0xFF8185E2)),
            title: Text(
              'My Profile',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pushNamed(context, '/profile');
            },
          ),
          SizedBox(height: 10),
          ListTile(
            leading:
                Icon(FontAwesomeIcons.cloudUploadAlt, color: Color(0xFF8185E2)),
            title: Text(
              'Mumbai Police Website',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pushNamed(context, '/mumbaiPoliceSite');
            },
          ),
          SizedBox(height: 10),
          ListTile(
            leading:
                Icon(FontAwesomeIcons.signOutAlt, color: Color(0xFF8185E2)),
            title: Text(
              'Log-out',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () async {
              await signOutGoogle();
              _auth.signOut();
              Navigator.pushNamed(context, '/login');
              Fluttertoast.showToast(
                msg: "Logout Successful!",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 16.0,
              );
            },
          ),
        ],
      ),
    );
  }
}
