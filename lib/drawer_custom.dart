import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('⚠️Under Construction!⚠️'),
            decoration: BoxDecoration(
              color: Colors.blue[300],
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.user),
            title: Text('My Profile'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pushNamed(context, '/profile');
            },
          ),
          ListTile(
            title: Text('Mumbai Police Site'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pushNamed(context, '/mumbaiPoliceSite');
            },
          ),
        ],
      ),
    );
  }
}
