import 'package:Crime_Reporting_AIO_app/screens/login_screen.dart';
import 'package:Crime_Reporting_AIO_app/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'homeScreen.dart';
import 'intro_slider.dart';
import 'package:Crime_Reporting_AIO_app/screens/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFF2F2F2),
        scaffoldBackgroundColor: Color(0xFFF2F2F2),
        fontFamily: 'Manrope',
      ),
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => WelcomeScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/intro': (context) => IntroScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
