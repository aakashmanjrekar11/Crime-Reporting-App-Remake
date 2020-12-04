import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Emergency extends StatefulWidget {
  Emergency({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _EmergencyState createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {
  final name1=TextEditingController();
  final phone1=TextEditingController();
  final email1=TextEditingController();
  final name2=TextEditingController();
  final phone2=TextEditingController();
  final email2=TextEditingController();

  submitComplaint(){
    Map<String,dynamic> data = {"Contact1 Name":name1.text,"Contact1 Phone":phone1.text,"Contact1 Email":email1.text,"Contact2 Name":name2.text,"Contact2 Phone":phone2.text,"Contact2 Email":email2.text};
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('emergency_contacts');
    collectionReference.add(data);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Emergency Contacts'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("Contact 1"),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: TextField(
              controller: name1,
              decoration: InputDecoration(
                hintText: "Name",
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.phone),
            title: TextField(
              controller: phone1,
              keyboardType: TextInputType.phone,
              maxLength: 10,
              decoration: InputDecoration(
                hintText: "Phone",
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.email),
            title: TextField(
              controller: email1,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Email",
              ),
            ),
          ),
          SizedBox(
            height:20
          ),
          ListTile(
            title: Text("Contact 2"),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: TextField(
              controller: name2,
              decoration: InputDecoration(
                hintText: "Name",
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.phone),
            title: TextField(
              controller: phone2,
              keyboardType: TextInputType.phone,
              maxLength: 10,
              decoration: InputDecoration(
                hintText: "Phone",
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.email),
            title: TextField(
              controller: email2,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Email",
              ),
            ),
          ),
          RaisedButton(onPressed:(){ submitComplaint();
          showDialog(context:context,
          builder: (context) {return AlertDialog(content: Text("Submitted"));
          }
          );
          
          },
           child: Text("Submit"),color: Colors.blueAccent,)        ],
      ),
    );
  }
}
