import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
    @override
    Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('complaints');
    return StreamBuilder<QuerySnapshot>(
        stream: users.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
            return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
        }
        if(!snapshot.hasData) {
            print(snapshot.hasData);
            return Center(child: CircularProgressIndicator());
        }
        return Container(
          child: ListView(
              children: snapshot.data.docs.map((DocumentSnapshot document) {
              return Card(
															child: new ListTile(
                    title: new Text(document.data()['Name'] ?? ''),
                    subtitle: new Text(document.data()['Complaint'] ?? ''),
                ),
              );
          }).toList(),
          ),
        );
        },
    );}
}