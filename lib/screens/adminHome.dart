import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference complaints =
        FirebaseFirestore.instance.collection('complaints');
    CollectionReference lf =
        FirebaseFirestore.instance.collection('lost_and_found');

    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Text('Complaint Registration'),
                ),
                Tab(
                  child: Text('Lost & Found'),
                ),
              ],
            ),
            title: Text('Tabs Demo'),
          ),
          body: TabBarView(
            children: [
              //!Lost&Found StreamBuilder
              StreamBuilder<QuerySnapshot>(
                stream: complaints.snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
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
                      children:
                          snapshot.data.docs.map((DocumentSnapshot document) {
                        return Card(
                          child: ListTile(
                            title:
                                Text('Name: ' + document.data()['Name'] ?? ''),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Complaint: " +
                                        document.data()['Complaint'] ??
                                    ''),
                                Text("Address: " + document.data()['Address'] ??
                                    ''),
                                Text(
                                    "Email: " + document.data()['Email'] ?? ''),
                                Text(
                                    "Phone: " + document.data()['Phone'] ?? ''),
                                Image.network(document.data()['ImageURL'] ?? '')
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  );
                },
              ),

              //
              //!Lost&Found StreamBuilder
              StreamBuilder<QuerySnapshot>(
                stream: lf.snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
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
                      children:
                          snapshot.data.docs.map((DocumentSnapshot document) {
                        return Card(
                          child: ListTile(
                            title: Text(document.data()['Name'] ?? ''),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(document.data()['Phone'] ?? ''),
                                Text(document.data()['Email'] ?? ''),
                                Text(document.data()['Address'] ?? ''),
                                Text(document.data()['Complaint Type'] ?? ''),
                                Text(document.data()['Article Type'] ?? ''),
                                Text(document.data()['Date & Time'] ?? ''),
                                Text(document
                                        .data()['Address of Lost/Found item'] ??
                                    ''),
                                Text(document.data()['Description'] ?? ''),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
