import 'package:Crime_Reporting_AIO_app/screens/admin.dart';
import 'package:Crime_Reporting_AIO_app/screens/complaint_registeration.dart';
import 'package:Crime_Reporting_AIO_app/screens/list.dart';
import 'package:Crime_Reporting_AIO_app/screens/login_screen.dart';
import 'package:Crime_Reporting_AIO_app/screens/myProfile_screen.dart';
import 'package:Crime_Reporting_AIO_app/screens/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'intro_slider.dart';
import 'package:Crime_Reporting_AIO_app/screens/welcome_screen.dart';
import 'screens/emergency_contacts.dart';
import 'screens/myProfile_screen.dart';
import 'screens/mumbai_police_website.dart';
import 'screens/lost_and_found.dart';
import 'screens/e-complaint_MumbaiPoliceSite.dart';
import 'screens/safety_tips_website.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

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
        // '/home': (context) => HomeScreen(),
        '/admin': (context) => AdminScreen(),
        '/complaint': (context) => ComplaintApp(),
        '/lostfound': (context) => LostFound(),
        '/list': (context) => List(),
        '/profile': (context) => ProfilePage(),
        '/emergency': (context) => Emergency(),
        '/mumbaiPoliceSite': (context) => MumbaiPoliceWebsite(),
        '/eComplaint': (context) => EComplaintWebsite(),
        '/safetyTips': (context) => SafetyTipsWebsite(),
      },
    );
  }
}
