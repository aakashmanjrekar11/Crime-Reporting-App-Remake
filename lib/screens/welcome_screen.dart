import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'delayed_animation.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';

// void main() {
//   SystemChrome.setEnabledSystemUIOverlays([]);
//   runApp(WelcomeScreen());
// }

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  final int delayedAmount = 250;
  double _scale;
  AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final color = Colors.white;
    _scale = 1 - _controller.value;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Color(0xFF8185E2),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AvatarGlow(
                  endRadius: 170,
                  duration: Duration(milliseconds: 900),
                  glowColor: Colors.white24,
                  repeat: true,
                  repeatPauseDuration: Duration(milliseconds: 100),
                  startDelay: Duration(milliseconds: 100),
                  child: CircularProfileAvatar(
                    null,
                    child: Image(
                      image: AssetImage(
                        'images/IndianPoliceOfficer_whiteBG.png',
                      ),
                    ),
                    borderColor: Colors.grey,
                    borderWidth: 2,
                    elevation: 10,
                    radius: 90,
                  ),
                  // child: Material(
                  //     elevation: 8.0,
                  //     shape: CircleBorder(),
                  //     child: CircleAvatar(
                  //       backgroundColor: Colors.grey[100],
                  //       backgroundImage: AssetImage(
                  //           'images/IndianPoliceOfficer_whiteBG.png'),
                  //       radius: 70.0,
                  //     )),
                ),
                DelayedAnimation(
                  child: Text(
                    "Welcome to",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0,
                      color: color,
                    ),
                  ),
                  delay: delayedAmount + 1000,
                ),
                SizedBox(
                  height: 10,
                ),
                DelayedAnimation(
                  child: Text(
                    "SecuroServe",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 37.0,
                        color: color),
                  ),
                  delay: delayedAmount + 2000,
                ),
                SizedBox(
                  height: 30.0,
                ),
                DelayedAnimation(
                  child: Text(
                    "Your New Personal",
                    style: TextStyle(fontSize: 20.0, color: color),
                  ),
                  delay: delayedAmount + 3000,
                ),
                DelayedAnimation(
                  child: Text(
                    "Crime Reporting & AIO Safety Companion",
                    style: TextStyle(fontSize: 20.0, color: color),
                  ),
                  delay: delayedAmount + 3000,
                ),
                SizedBox(
                  height: 100.0,
                ),
                DelayedAnimation(
                  child: GestureDetector(
                    onTapDown: _onTapDown,
                    onTapUp: _onTapUp,
                    child: Transform.scale(
                      scale: _scale,
                      child: _animatedButtonUI,
                    ),
                  ),
                  delay: delayedAmount + 4000,
                ),
                SizedBox(
                  height: 50.0,
                ),
                // DelayedAnimation(
                //   child: Text(
                //     "Register New Account",
                //     style: TextStyle(
                //         fontSize: 25.0,
                //         fontWeight: FontWeight.bold,
                //         color: color),
                //   ),
                //   delay: delayedAmount + 5000,
                // ),
              ],
            ),
          )
          //  Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     Text('Tap on the Below Button',style: TextStyle(color: Colors.grey[400],fontSize: 20.0),),
          //     SizedBox(
          //       height: 20.0,
          //     ),
          //      Center(

          //   ),
          //   ],

          // ),
          ),
    );
  }

  Widget get _animatedButtonUI => GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/intro');
        },
        child: Container(
          height: 60,
          width: 270,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            color: Colors.white,
          ),
          child: Center(
            child: Text(
              'Next',
              style: TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF8185E2),
              ),
            ),
          ),
        ),
      );

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }
}
