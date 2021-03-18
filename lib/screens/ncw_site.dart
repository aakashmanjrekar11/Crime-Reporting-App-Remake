import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NCWsite extends StatefulWidget {
  @override
  NCWsiteState createState() => NCWsiteState();
}

class NCWsiteState extends State<NCWsite> {
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
          'NCWsite Website',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: const WebView(
        initialUrl: 'http://www.ncw.nic.in/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
