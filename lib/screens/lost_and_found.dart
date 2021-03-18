import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';

class LostFound extends StatefulWidget {
  LostFound({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LostFoundState createState() => _LostFoundState();
}

class _LostFoundState extends State<LostFound> {
  String dropdownValue1 = 'Lost Item Complaint';
  String dropdownValue2 = 'Cash & other Money';
  final format = DateFormat("yyyy-MM-dd HH:mm");
  final name = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();
  final address = TextEditingController();
  final dateTime = TextEditingController();
  final addressLost = TextEditingController();
  final desc = TextEditingController();
  final _picker = ImagePicker();
  File _image;
  PickedFile image;
  String imgUrl;
  String file_name = "Upload Image";

  submit() {
    Map<String, dynamic> data = {
      "Name": name.text,
      "Phone": phone.text,
      "Email": email.text,
      "Address": address.text,
      "Complaint Type": dropdownValue1,
      "Item Type": dropdownValue2,
      "Date & Time": dateTime.text,
      "Address of Lost/Found item": addressLost.text,
      "Description": desc.text,
      "ImageURL": imgUrl
    };
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('lost_and_found');
    collectionReference.add(data);
  }

  Future chooseFile() async {
    image = await _picker
        .getImage(
      source: ImageSource.gallery,
      maxHeight: 300,
      maxWidth: 300
    );
    if(image == null){
      return;
    }else{
      setState(() {
        _image = File(image.path);
      });
      file_name = "Image Uploaded Successfully";
    }
  }

  Future uploadFile() async {
    String fileName = basename(_image.path);
    StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('uploads/$fileName');
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    await taskSnapshot.ref.getDownloadURL().then(
      (value) {
        print("Done: $value");
        imgUrl = value;
      },
    );
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

          //! Applicant Details
          Container(
            color: Colors.grey[300],
            child: ListTile(
              title: Text(
                "Applicant Details (Your Info)",
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

          //! Item Details
          Container(
            color: Colors.grey[300],
            child: ListTile(
              title: Text(
                "Item Details",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
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
                  'Lost Item Complaint',
                  'Found Item Complaint',
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
                "Item Type",
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
                  'Cash & other Money',
                  'Credit/Debit Card',
                  'Driver\'s License',
                  'Aadhaar Card',
                  'PAN Card',
                  'Voter ID Card',
                  'Ration Card',
                  'Educational Document',
                  'Other item',
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

          //! Date & Time
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
                    size: 35,
                  ),
                  hintText: 'YYYY-MM-DD   Hour:Mins',
                  helperText:
                      'Press above button to select Date & Time when the item was lost or found.',
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

          //!Address of lost or Found Item
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              leading: const Icon(
                FontAwesomeIcons.mapMarkerAlt,
                color: Colors.red,
                size: 35,
              ),
              title: Text(
                "Address of Item",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
              ),
              subtitle: TextField(
                controller: addressLost,
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText:
                      "Provide the exact address where you lost/found the item.",
                ),
              ),
            ),
          ),
          SizedBox(height: 20),

          //! Item Description
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              leading: const Icon(
                FontAwesomeIcons.pencilAlt,
                color: Colors.green,
                size: 35,
              ),
              title: Text(
                "Item Description",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
              ),
              subtitle: TextField(
                controller: desc,
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText:
                      "Please describe in detail about the lost/found item.",
                ),
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
            child: GestureDetector(
              onTap: () {
                chooseFile();
              },
              child: ListTile(
                leading: const Icon(
                  Icons.image_search,
                  color: Colors.orange,
                  size: 35,
                ),
                title: Text(
                  "Upload photo proof or evidence",   //file name add
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
                ),
                subtitle: Text(
                  "Please provide high quality image of the lost/found item.",
                ),
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
                onPressed: () async {
                  await uploadFile();
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
