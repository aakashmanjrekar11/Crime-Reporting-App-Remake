import 'dart:async';

import 'package:Crime_Reporting_AIO_app/screens/adminHome.dart';
import 'package:Crime_Reporting_AIO_app/utils/authenticator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:Crime_Reporting_AIO_app/homeScreen.dart';
import 'package:Crime_Reporting_AIO_app/utils/bezierContainer.dart';
import 'package:fluttertoast/fluttertoast.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>[
  'email',
]);

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  GoogleSignInAccount _currentUser;
  Position _position;
  StreamSubscription<Position> _subscription;
  Address _address;
  String _emailId, _pwd, lat, long, address, photoURL;
  String name = ".";

  Future<void> _handleGSignin() async {
    
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
      });
    });
    try{
      await signInWithGoogle().then((data) {
        name = data.displayName.toString();
        photoURL = data.photoURL.toString();
      });    
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  HomeScreen(name, lat, long, address, photoURL)));
    } catch (error) {
      print(error);
    }
  }

  Future convertCoords(Coordinates co_ords) async {
    var addresses = await Geocoder.local.findAddressesFromCoordinates(co_ords);
    return addresses.first;
  }

  Future<void> _checkPermission() async {
    final PermissionHandler _permissionHandler = PermissionHandler();
    var locPermission = await _permissionHandler
        .checkPermissionStatus(PermissionGroup.location);
    var smsPermission =
        await _permissionHandler.checkPermissionStatus(PermissionGroup.sms);
    if (locPermission == PermissionStatus.denied ||
        smsPermission == PermissionStatus.denied) {
      await _permissionHandler.requestPermissions([
        PermissionGroup.location,
        PermissionGroup.locationWhenInUse,
        PermissionGroup.sms
      ]);
    }
  }

  Future<void> _handleFSignin(String email, String pwd) async {
    await Firebase.initializeApp();
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: pwd);
      Fluttertoast.showToast(
        msg: "Login Successful!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen(null, lat, long, address, "")));
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Password Invalid! Please try again",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      throw FirebaseAuthException(message: e.message, code: e.code);
    }
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Login Account',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: Color(0xFF8c82f4),
        ),
      ),
    );
  }

  Widget _email() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Email",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: Colors.white,
              filled: true,
            ),
            onChanged: (value) {
              setState(() {
                _emailId = value.trim();
              });
            },
          )
        ],
      ),
    );
  }

  Widget _password() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Password",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: Colors.white,
              filled: true,
            ),
            onChanged: (value) {
              setState(() {
                _pwd = value.trim();
              });
            },
          )
        ],
      ),
    );
  }

  Widget _loginButton() {
    return GestureDetector(
      onTap: () async {
        await _handleFSignin(_emailId, _pwd);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xFFe1deff), Color(0xFF8c82f4)])),
        child: Text(
          'Login',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

  Widget _divider_or() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text('or'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget _googleButton() {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    topLeft: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: Image(
                image: AssetImage('images/Google colour logo.png'),
                width: 35,
                height: 35,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: GestureDetector(
              onTap: () async {
                await _handleGSignin();
                Fluttertoast.showToast(
                  msg: "Login Successful!",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.grey,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      topRight: Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Log in with Google',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 19,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _registerAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/register');
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(5),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Don\'t have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Register',
              style: TextStyle(
                  color: Color(0xFF8c82f4),
                  fontSize: 17,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }

  Widget _divider_adminLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
                color: Colors.black,
              ),
            ),
          ),
          Text('OR'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget _adminAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/adminLogin');
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 30),
        padding: EdgeInsets.all(5),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'For Admin Login Tap Here',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Admin',
              style: TextStyle(
                  color: Color(0xFF8c82f4),
                  fontSize: 19,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkPermission();
    _subscription = Geolocator.getPositionStream(
            desiredAccuracy: LocationAccuracy.high, distanceFilter: 10)
        .listen((Position position) async {
      print(position);
      _position = position;

      final co_ords = new Coordinates(position.latitude, position.longitude);
      await convertCoords(co_ords).then((value) => _address = value);
      lat = _position.latitude.toString();
      long = _position.longitude.toString();
      address = _address.addressLine;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFECECEC),
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Positioned(
                top: -height * .15,
                right: -MediaQuery.of(context).size.width * .4,
                child: BezierContainer()),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    _title(),
                    SizedBox(height: 100),
                    _email(),
                    SizedBox(height: 20),
                    _password(),
                    SizedBox(height: 20),
                    _loginButton(),
                    _divider_or(),
                    _googleButton(),
                    SizedBox(height: 5),
                    _registerAccountLabel(),
                    SizedBox(height: 20),
                    _divider_adminLabel(),
                    _adminAccountLabel(),
                  ],
                ),
              ),
            ),
            Positioned(top: 40, left: 0, child: _backButton()),
          ],
        ),
      ),
    );
  }
}
