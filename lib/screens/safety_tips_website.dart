import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SafetyTipsWebsite extends StatefulWidget {
  @override
  SafetyTipsWebsiteState createState() => SafetyTipsWebsiteState();
}

class SafetyTipsWebsiteState extends State<SafetyTipsWebsite> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8185E2),
        centerTitle: true,
        title: Text(
          'Safety Tips',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: const WebView(
        initialUrl: 'https://mumbaipolice.gov.in/Safety_tips',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
