import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ViewComplaint extends StatefulWidget {
  final String username;
  ViewComplaint({Key key, this.username}) : super(key: key);
  @override
  _ViewComplaintState createState() => _ViewComplaintState();
}

class _ViewComplaintState extends State<ViewComplaint> {
CollectionReference collectionReference = FirebaseFirestore.instance.collection('complaints');
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child:
      StreamBuilder<QuerySnapshot>(
                stream: collectionReference.where("UserName",isEqualTo: widget.username).snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text('Something went wrong'));
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.data.docs.toString() == '[]') {
                    Navigator.pushNamed(context, '/empty');
                    print("no data");
                  }
                  return Container(
                    child: ListView(
                      children:
                          snapshot.data.docs.map((DocumentSnapshot document) {
                        return Card(
                          elevation: 5,
                          child: ListTile(
                            title: Text(
                                'Complaint: ' + document.data()['Complaint'] ?? ''),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Status: " + document.data()['Status'] ??
                                    ''),
                                ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  );}
              ) 
    );
  }
}