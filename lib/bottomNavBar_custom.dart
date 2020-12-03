import 'package:Crime_Reporting_AIO_app/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'screens/myProfile_screen.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: 80.0,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          //currentIndex: _pageIndex,
          selectedItemColor: Colors.amber[800],
          unselectedItemColor: Colors.grey,
          //onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(LineAwesomeIcons.home, size: 35),
              title: Text(
                'Home',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(LineAwesomeIcons.gamepad, size: 35),
              title: Text(
                'Games',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(LineAwesomeIcons.indian_rupee_sign, size: 35),
              title: Text(
                'Pay',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.track_changes, size: 35),
              title: Text(
                'Tracker',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                LineAwesomeIcons.user_circle,
                size: 35,
              ),
              title: Text(
                'My Profile',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
