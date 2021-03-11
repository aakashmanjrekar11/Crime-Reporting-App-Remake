import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('complaints');
    return StreamBuilder<QuerySnapshot>(
      stream: users.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Something went wrong'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text("Loading"));
        }
        if (!snapshot.hasData) {
          print(snapshot.hasData);
          return Center(child: CircularProgressIndicator());
        }
        return Container(
          child: ListView(
            children: snapshot.data.docs.map((DocumentSnapshot document) {
              return Card(
                child: ListTile(
                  title: Text(document.data()['Name'] ?? ''),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(document.data()['Complaint'] ?? ''),
                      Text(document.data()['Address'] ?? ''),
                      Text(document.data()['Email'] ?? ''),
                      Text(document.data()['Phone'] ?? ''),
                      Image.network(document.data()['ImageURL'] ?? '')
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
