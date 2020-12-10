import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ComplaintApp extends StatefulWidget {
  ComplaintApp({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ComplaintAppState createState() => _ComplaintAppState();
}

class _ComplaintAppState extends State<ComplaintApp> {
  final name = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();
  final address = TextEditingController();
  final complaint = TextEditingController();

  submitComplaint() {
    Map<String, dynamic> data = {
      "Name": name.text,
      "Phone": phone.text,
      "Email": email.text,
      "Address": address.text,
      "Complaint": complaint.text
    };
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('complaints');
    collectionReference.add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Complaint  Registration',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 40),
          ListTile(
            leading: const Icon(
              Icons.person,
              color: Colors.blue,
              size: 40,
            ),
            title: TextField(
              controller: name,
              decoration: InputDecoration(
                hintText: "Name",
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 20),
          ListTile(
            leading: const Icon(
              Icons.phone,
              color: Colors.green,
              size: 40,
            ),
            title: TextField(
              controller: phone,
              keyboardType: TextInputType.phone,
              maxLength: 10,
              decoration: InputDecoration(
                hintText: "Phone",
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 5),
          ListTile(
            leading: const Icon(
              Icons.email,
              color: Colors.amber,
              size: 40,
            ),
            title: TextField(
              controller: email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Email",
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 20),
          ListTile(
            leading: const Icon(
              Icons.home,
              color: Colors.cyan,
              size: 40,
            ),
            title: TextField(
              controller: address,
              keyboardType: TextInputType.multiline,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Address",
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 20),
          ListTile(
            leading: const Icon(
              Icons.list_alt,
              color: Colors.red,
              size: 40,
            ),
            title: TextField(
              controller: complaint,
              keyboardType: TextInputType.multiline,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: "Complaint",
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 40),
          Container(
            width: 50,
            height: 70,
            child: RaisedButton(
              onPressed: () {
                submitComplaint();
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(content: Text("Submitted"));
                  },
                );
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.blue),
              ),
              padding: EdgeInsets.all(20),
              child: Text(
                "Submit",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              color: Colors.blueAccent,
            ),
          )
        ],
      ),
    );
  }
}
