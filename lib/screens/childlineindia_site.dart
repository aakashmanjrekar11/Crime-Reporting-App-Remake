import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ChildLineIndia extends StatefulWidget {
  @override
  ChildLineIndiaState createState() => ChildLineIndiaState();
}

class ChildLineIndiaState extends State<ChildLineIndia> {
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
        title: Text('ChildLineIndia Website'),
      ),
      body: const WebView(
        initialUrl: 'https://www.childlineindia.org/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
