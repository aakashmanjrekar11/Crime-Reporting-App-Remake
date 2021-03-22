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
  final _formKey = GlobalKey<FormState>();

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
        backgroundColor: Color(0xFF8185E2),
        centerTitle: true,
        title: Text(
          'Emergency Contacts',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(15)),
              child: ListTile(
                leading: const Icon(
                  Icons.arrow_circle_down,
                  size: 40,
                  color: Colors.green,
                ),
                title: Text(
                  "Enter contact info of your family members or friends below.\nThese contacts will recieve your SoS message when you tap on SoS button in case of emergency.",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
              child: Divider(
                indent: 100,
                endIndent: 100,
                thickness: 1.2,
                color: Colors.grey,
              ),
            ),
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
              title: TextFormField(
                controller: name1,
                validator: (value) =>
                    value.isEmpty ? "Please enter a Name" : null,
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
              title: TextFormField(
                controller: phone1,
                validator: (value) => value.isEmpty || value.length <= 10
                    ? "Please enter a valid phone no."
                    : null,
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
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      print("Form Validaton Done!");
                      await submitComplaint();
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text("Submitted"),
                              actions: [
                                FlatButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("OK"))
                              ],
                            );
                          });
                    }
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
      ),
    );
  }
}
