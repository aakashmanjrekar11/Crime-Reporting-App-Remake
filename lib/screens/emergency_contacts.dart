import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Emergency extends StatefulWidget {
  final String username;
  Emergency({Key key, this.username}) : super(key: key);

  
  @override
  _EmergencyState createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {
  final name1 = TextEditingController();
  final phone1 = TextEditingController();
  final name2 = TextEditingController();
  final phone2 = TextEditingController();
  
  submitComplaint() {
    Map<String, dynamic> data = {
      "Contact1 Name": name1.text,
      "Contact1 Phone": phone1.text,
      "Contact2 Name": name2.text,
      "Contact2 Phone": phone2.text,
      "UserName": widget.username
    };
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('emergency_contacts');
    collectionReference.add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Emergency Contacts',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 40),
          Container(
            color: Colors.grey[300],
            child: ListTile(
              title: Text(
                "Contact 1",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            leading: const Icon(
              Icons.person,
              color: Colors.blue,
              size: 40,
            ),
            title: TextField(
              controller: name1,
              decoration: InputDecoration(
                hintText: "Name",
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.phone,
              color: Colors.green,
              size: 40,
            ),
            title: TextField(
              controller: phone1,
              keyboardType: TextInputType.phone,
              maxLength: 10,
              decoration: InputDecoration(
                hintText: "Phone",
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 40),
          Container(
            color: Colors.grey[300],
            child: ListTile(
              title: Text(
                "Contact 2",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            leading: const Icon(
              Icons.person,
              color: Colors.blue,
              size: 40,
            ),
            title: TextField(
              controller: name2,
              decoration: InputDecoration(
                hintText: "Name",
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.phone,
              color: Colors.green,
              size: 40,
            ),
            title: TextField(
              controller: phone2,
              keyboardType: TextInputType.phone,
              maxLength: 10,
              decoration: InputDecoration(
                hintText: "Phone",
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 40),
          Container(
            width: 50,
            height: 70,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(60, 0, 60, 10),
              child: RaisedButton(
                color: Colors.blueAccent,
                onPressed: () {
                  submitComplaint();
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(content: Text("Submitted"),actions: [
                          FlatButton(onPressed:(){ 
                            Navigator.pop(context);
                            }, child: Text("OK"))
                        ],);
                      });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.blue),
                ),
                child: Text(
                  "Submit",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
