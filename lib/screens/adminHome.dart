import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AdminHomeScreen extends StatelessWidget {
  Future<void> _checkPermission() async {
    final PermissionHandler _permissionHandler = PermissionHandler();
    var storagePermission =
        await _permissionHandler.checkPermissionStatus(PermissionGroup.storage);
    if (storagePermission == PermissionStatus.denied) {
      await _permissionHandler.requestPermissions([
        PermissionGroup.storage,
      ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference complaints =
        FirebaseFirestore.instance.collection('complaints');
    CollectionReference lf =
        FirebaseFirestore.instance.collection('lost_and_found');
    final _auth = FirebaseAuth.instance;
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.grey[400],
          appBar: AppBar(
            backgroundColor: Color(0xFF8185E2),
            automaticallyImplyLeading: false,
            actions: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                    child: FaIcon(FontAwesomeIcons.signOutAlt,
                        color: Colors.white),
                    onTap: () async {
                      _auth.signOut();
                      Navigator.pop(context);
                    }),
              ),
            ],
            bottom: TabBar(
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              unselectedLabelColor: Colors.grey[300],
              tabs: [
                Tab(
                  child: Text(
                    'Complaint Registration',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  child: Text(
                    'Lost & Found',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            title: Text(
              'Admin Home',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          body: TabBarView(
            children: [
              //! Complaint Registration StreamBuilder
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
                        DocumentReference docref = FirebaseFirestore.instance
                            .collection('complaints')
                            .doc(document.id);
                        return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.00)),
                          margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                          elevation: 6,
                          child: ListTile(
                            contentPadding: EdgeInsets.all(20),
                            title: Text(
                              'Name: ' + document.data()['Name'] ?? '',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
                                Text("Status: " + document.data()['Status'] ??
                                    ''),
                                Image.network(
                                  document.data()['ImageURL'] ?? '',
                                ),
                                Row(
                                  children: [
                                    ElevatedButton(
                                      style: ButtonStyle(),
                                      onPressed: () {
                                        Alert(
                                          context: context,
                                          type: AlertType.warning,
                                          title: "Take Complaint?",
                                          desc:
                                              "Do you want to accept/reject this complaint?",
                                          buttons: [
                                            DialogButton(
                                              child: Text(
                                                "Accept",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              onPressed: () async {
                                                await docref.update(
                                                    {"Status": "Accepted"});
                                                Navigator.pop(context);
                                              },
                                              color: Colors.blueAccent,
                                            ),
                                            DialogButton(
                                              child: Text(
                                                "Reject",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              onPressed: () async {
                                                await docref.update(
                                                    {"Status": "Rejected"});
                                                Navigator.pop(context);
                                              },
                                              color: Colors.redAccent,
                                            ),
                                          ],
                                        ).show();
                                      },
                                      child: Text(
                                        'Take Complaint',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.green, // background
                                        onPrimary: Colors.white, // foreground
                                      ),
                                      onPressed: () {
                                        Alert(
                                          context: context,
                                          type: AlertType.info,
                                          title: "Update Status?",
                                          desc:
                                              "Update the current Status of the complaint.",
                                          buttons: [
                                            DialogButton(
                                              child: Text(
                                                "Processing",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              onPressed: () async {
                                                await docref.update(
                                                    {"Status": "Processing"});
                                                Navigator.pop(context);
                                              },
                                              color: Colors.orange,
                                            ),
                                            DialogButton(
                                              child: Text(
                                                "Completed",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              onPressed: () async {
                                                await docref.update(
                                                    {"Status": "Completed"});
                                                Navigator.pop(context);
                                              },
                                              color: Colors.green,
                                            ),
                                          ],
                                        ).show();
                                      },
                                      child: Text(
                                        'Update Status',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ), //row
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
                        DocumentReference docref = FirebaseFirestore.instance
                            .collection('lost_and_found')
                            .doc(document.id);
                        return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.00)),
                          margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                          elevation: 6,
                          child: ListTile(
                            contentPadding: EdgeInsets.all(20),
                            title:
                                Text("Name: " + document.data()['Name'] ?? ''),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "Phone: " + document.data()['Phone'] ?? ''),
                                Text(
                                    "Email: " + document.data()['Email'] ?? ''),
                                Text("Address: " + document.data()['Address'] ??
                                    ''),
                                Text("Complaint Type: " +
                                        document.data()['Complaint Type'] ??
                                    ''),
                                Text("Article Type: " +
                                        document.data()['Article Type'] ??
                                    ''),
                                Text("Date & Time: " +
                                        document.data()['Date & Time'] ??
                                    ''),
                                Text("Address of Lost/Found item : " +
                                        document.data()[
                                            'Address of Lost/Found item'] ??
                                    ''),
                                Text("Description: " +
                                        document.data()['Description'] ??
                                    ''),
                                Text("Status: " +
                                        document.data()['Status'] ??
                                    ''),    
                                Image.network(
                                    document.data()['ImageURL'] ?? ''),
                                Row(
                                  children: [
                                    ElevatedButton(
                                      style: ButtonStyle(),
                                      onPressed: () {
                                        Alert(
                                          context: context,
                                          type: AlertType.warning,
                                          title: "Take Complaint?",
                                          desc:
                                              "Do you want to accept/reject this complaint?",
                                          buttons: [
                                            DialogButton(
                                              child: Text(
                                                "Accept",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              onPressed: () async {
                                                await docref.update(
                                                    {"Status": "Accepted"});
                                                Navigator.pop(context);
                                              },
                                              color: Colors.blueAccent,
                                            ),
                                            DialogButton(
                                              child: Text(
                                                "Reject",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              onPressed: () async {
                                                await docref.update(
                                                    {"Status": "Rejected"});
                                                Navigator.pop(context);
                                              },
                                              color: Colors.redAccent,
                                            ),
                                          ],
                                        ).show();
                                      },
                                      child: Text(
                                        'Take Complaint',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.green, // background
                                        onPrimary: Colors.white, // foreground
                                      ),
                                      onPressed: () {
                                        Alert(
                                          context: context,
                                          type: AlertType.info,
                                          title: "Update Status?",
                                          desc:
                                              "Update the current Status of the complaint.",
                                          buttons: [
                                            DialogButton(
                                              child: Text(
                                                "Processing",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              onPressed: () async {
                                                await docref.update(
                                                    {"Status": "Processing"});
                                                Navigator.pop(context);
                                              },
                                              color: Colors.orange,
                                            ),
                                            DialogButton(
                                              child: Text(
                                                "Completed",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              onPressed: () async {
                                                await docref.update(
                                                    {"Status": "Completed"});
                                                Navigator.pop(context);
                                              },
                                              color: Colors.green,
                                            ),
                                          ],
                                        ).show();
                                      },
                                      child: Text(
                                        'Update Status',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ), //row
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

  // showAlertDialog(BuildContext context,DocumentSnapshot doc) {
  //   AlertDialog alert = AlertDialog(
  //     title: Text("Alert"),
  //     content: Text("Do you want to accept/reject this complaint?"),
  //     actions: [
  //       FlatButton(
  //           child: Text("Accept"),
  //           onPressed: () async {
  //             DocumentReference docref =
  //                 FirebaseFirestore.instance.doc(doc.id);
  //             await docref.update({"Status": "Accepted"});
  //           }),
  //       FlatButton(
  //         child: Text("Reject"),
  //         onPressed: () async {
  //           DocumentReference docref =
  //               FirebaseFirestore.instance.doc(doc.id);
  //           await docref.update({"Status": "Rejected"});
  //         },
  //       )
  //     ],
  //   ); // show the dialog
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }
}
