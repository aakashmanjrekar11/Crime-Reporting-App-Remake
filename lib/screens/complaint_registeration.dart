import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ComplaintApp extends StatefulWidget {
  ComplaintApp({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ComplaintAppState createState() => new _ComplaintAppState();
}

class _ComplaintAppState extends State<ComplaintApp> {
  final name=TextEditingController();
  final phone=TextEditingController();
  final email=TextEditingController();
  final address=TextEditingController();
  final complaint=TextEditingController();

  submitComplaint(){
    Map<String,dynamic> data = {"Name":name.text,"Phone":phone.text,"Email":email.text,"Address":address.text,"Complaint":complaint.text};
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('complaints');
    collectionReference.add(data);
  }
  
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
              controller: name,
              decoration: new InputDecoration(
                hintText: "Name",
              ),
            ),
          ),
          new ListTile(
            leading: const Icon(Icons.phone),
            title: new TextField(
              controller: phone,
              keyboardType: TextInputType.phone,
              maxLength: 10,
              decoration: new InputDecoration(
                hintText: "Phone",
              ),
            ),
          ),
          new ListTile(
            leading: const Icon(Icons.email),
            title: new TextField(
              controller: email,
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
              controller: address,
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
              controller: complaint,
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
