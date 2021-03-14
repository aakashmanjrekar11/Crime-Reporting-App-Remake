import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LostFound extends StatefulWidget {
  LostFound({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LostFoundState createState() => _LostFoundState();
}

class _LostFoundState extends State<LostFound> {
  String dropdownValue1 = 'Lost Item Report';
  String dropdownValue2 = 'Driving License';
  final format = DateFormat("yyyy-MM-dd HH:mm");
  final name = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();
  final address = TextEditingController();
  final dateTime = TextEditingController();
  final addressLost = TextEditingController();
  final desc = TextEditingController();

  submit() {
    Map<String, dynamic> data = {
      "Name": name.text,
      "Phone": phone.text,
      "Email": email.text,
      "Address": address.text,
      "Complaint Type": dropdownValue1,
      "Article Type": dropdownValue2,
      "Date & Time": dateTime.text,
      "Address of Lost/Found item": addressLost.text,
      "Description": desc.text
    };
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('lost_and_found');
    collectionReference.add(data);
  }

//   _onPressed() {
//     FirebaseFirestore.instance.collection("lost_and_found").get().then((querySnapshot) {
//     querySnapshot.docs.forEach((result) {
//       print(result.data());
//     });
//   });
// }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8185E2),
        centerTitle: true,
        title: Text(
          'Lost & Found',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 20),
          Container(
            color: Colors.grey[300],
            child: ListTile(
              title: Text(
                "Applicant Details",
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
              controller: name,
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
              controller: phone,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: "Phone",
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.email,
              color: Colors.amber,
              size: 40,
            ),
            title: TextField(
              controller: email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Email",
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
              color: Colors.cyan,
              size: 40,
            ),
            title: TextField(
              controller: address,
              keyboardType: TextInputType.multiline,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Address",
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 40),
          Container(
            color: Colors.grey[300],
            child: ListTile(
              title: Text(
                "Article Details",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              title: Text(
                "Complaint Type",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
              ),
              subtitle: DropdownButton<String>(
                value: dropdownValue1,
                elevation: 16,
                style: TextStyle(color: Colors.black),
                underline: Container(
                  height: 2,
                  color: Colors.black38,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue1 = newValue;
                  });
                },
                items: <String>[
                  'Lost Item Report',
                  'Found Item Report                                                           '
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              title: Text(
                "Article Type",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
              ),
              subtitle: DropdownButton<String>(
                value: dropdownValue2,
                elevation: 16,
                style: TextStyle(color: Colors.black),
                underline: Container(
                  height: 2,
                  color: Colors.black38,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue2 = newValue;
                  });
                },
                items: <String>[
                  'Driving License',
                  'Aadhaar Card',
                  'PAN Card',
                  'Voting ID Card',
                  'Ration Card',
                  'Educational Document                                                    ',
                  'Other Document'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              title: Text(
                "Date & Time",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
              ),
              subtitle: DateTimeField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.calendar_today_rounded,
                    color: Colors.blue,
                  ),
                  hintText: 'YYYY-MM-DD   Hour:Mins',
                  helperText: 'Press above button to select Date & Time',
                ),
                initialValue: DateTime(2020, 12, 05, 17, 30),
                controller: dateTime,
                format: format,
                onShowPicker: (context, currentValue) async {
                  final date = await showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      initialDate: currentValue ?? DateTime.now(),
                      lastDate: DateTime(2100));
                  if (date != null) {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(
                          currentValue ?? DateTime.now()),
                    );
                    return DateTimeField.combine(date, time);
                  } else {
                    return currentValue;
                  }
                },
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.red,
                size: 40,
              ),
              title: TextField(
                controller: addressLost,
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: "Address of Lost Item",
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          ListTile(
            title: TextField(
              controller: desc,
              keyboardType: TextInputType.multiline,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Article Description",
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: 50,
            height: 70,
            child: Padding(
              padding: EdgeInsets.fromLTRB(60, 0, 60, 10),
              child: RaisedButton(
                color: Colors.blueAccent,
                onPressed: () {
                  submit();
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
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
