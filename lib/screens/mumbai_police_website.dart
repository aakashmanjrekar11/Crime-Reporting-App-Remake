import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MumbaiPoliceWebsite extends StatefulWidget {
  @override
  MumbaiPoliceWebsiteState createState() => MumbaiPoliceWebsiteState();
}

class MumbaiPoliceWebsiteState extends State<MumbaiPoliceWebsite> {
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
        title: Text('Mumbai Police Website'),
      ),
      body: const WebView(
        initialUrl: 'https://mumbaipolice.gov.in/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
