import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EComplaintWebsite extends StatefulWidget {
  @override
  EComplaintWebsiteState createState() => EComplaintWebsiteState();
}

class EComplaintWebsiteState extends State<EComplaintWebsite> {
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
        title: Text('E-Complaint Mumbai Police Website'),
      ),
      body: const WebView(
        initialUrl: 'https://mumbaipolice.gov.in/OnlineComplaints?ps_id=0',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}