import 'package:flutter/material.dart';

class DrawerCustom extends StatelessWidget {
  String photo;
  DrawerCustom(this.photo);
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
            title: Text('My Profile'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pushNamed(context, '/profile');
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
