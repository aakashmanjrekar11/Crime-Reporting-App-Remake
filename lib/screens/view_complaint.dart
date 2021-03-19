import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewComplaint extends StatefulWidget {
  final String username;
  ViewComplaint({Key key, this.username}) : super(key: key);
  @override
  _ViewComplaintState createState() => _ViewComplaintState();
}

class _ViewComplaintState extends State<ViewComplaint> {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('complaints');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'My Complaints',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFF8185E2),
        ),
        body: Container(
            color: Colors.grey[300],
            child: StreamBuilder<QuerySnapshot>(
                stream: collectionReference
                    .where("UserName", isEqualTo: widget.username)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text('Something went wrong'));
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.data.docs.toString() == '[]') {
                    return Container(
                        color: Colors.white,
                        child: Center(
                            child: Column(
                          children: [
                            Image(
                              image: AssetImage('images/empty.png'),
                            ),
                            Text('No Complaints found',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold))
                          ],
                        )));
                  } else {
                    return Container(
                      child: ListView(
                        children:
                            snapshot.data.docs.map((DocumentSnapshot document) {
                          return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.00)),
                            margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                            elevation: 6,
                            child: ListTile(
                              contentPadding: EdgeInsets.all(20),
                              title: Text(
                                'Complaint: ' + document.data()['Complaint'] ??
                                    '',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Status: " + document.data()['Status'] ??
                                        '',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  }
                })));
  }
}
