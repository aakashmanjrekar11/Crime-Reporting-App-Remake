import 'package:flutter/material.dart';

class ComplaintApp extends StatefulWidget {
  ComplaintApp({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ComplaintAppState createState() => new _ComplaintAppState();
}

class _ComplaintAppState extends State<ComplaintApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Complaint  Registration'),
      ),
      body: Column(
        children: <Widget>[
          new ListTile(
            leading: const Icon(Icons.person),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: "Name",
              ),
            ),
          ),
          new ListTile(
            leading: const Icon(Icons.phone),
            title: new TextField(
              keyboardType: TextInputType.phone,
              decoration: new InputDecoration(
                hintText: "Phone",
              ),
            ),
          ),
          new ListTile(
            leading: const Icon(Icons.email),
            title: new TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: new InputDecoration(
                hintText: "Email",
              ),
            ),
          ),
          new ListTile(
            leading: const Icon(
              Icons.home,
            ),
            title: new TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: new InputDecoration(
                hintText: "Address",
              ),
            ),
          ),
          new ListTile(
            leading: const Icon(
              Icons.list_alt,
            ),
            title: new TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: new InputDecoration(
                hintText: "Complaint",
              ),
            ),
          ),
          SizedBox(
            height:20
          ),
          RaisedButton(onPressed: null, child: Text("Submit"),color: Colors.blueAccent,)        ],
      ),
    );
  }
}
