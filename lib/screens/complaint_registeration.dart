import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ComplaintApp extends StatefulWidget {
  final String title, username;
  ComplaintApp({Key key, this.title, this.username}) : super(key: key);

  @override
  _ComplaintAppState createState() => _ComplaintAppState();
}

class _ComplaintAppState extends State<ComplaintApp> {
  final name = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();
  final address = TextEditingController();
  final complaint = TextEditingController();
  final _picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  File _image;
  PickedFile image;
  String imgUrl;
  String file_name = "Upload photo proof or evidence";
  String description =
      'Please provide high quality image of the lost/found item.';

  submitComplaint() {
    Map<String, dynamic> data = {
      "Name": name.text,
      "Phone": phone.text,
      "Email": email.text,
      "Address": address.text,
      "ImageURL": imgUrl,
      "Complaint": complaint.text,
      "Status": "-",
      "UserName": widget.username
    };
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('complaints');
    collectionReference.add(data);
  }

  Future chooseFile() async {
    image = await _picker
        .getImage(source: ImageSource.gallery, imageQuality: 80)
        .then((image) {
      setState(() {
        _image = File(image.path);
        file_name = "Image Uploaded Successfully";
        description = '';
      });
    });
  }

  Future uploadFile() async {
    String fileName = basename(_image.path);
    StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('complaints_imgs/$fileName');
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    await taskSnapshot.ref.getDownloadURL().then(
      (value) {
        print("Done: $value");
        imgUrl = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8185E2),
        centerTitle: true,
        title: Text(
          'Complaint  Registration',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            SizedBox(height: 40),
            ListTile(
              leading: const Icon(
                Icons.person,
                color: Colors.blue,
                size: 40,
              ),
              title: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: name,
                decoration: InputDecoration(
                  hintText: "Name",
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: const Icon(
                Icons.phone,
                color: Colors.green,
                size: 40,
              ),
              title: TextFormField(
                validator: (value) {
                  if (value.isEmpty || value.length <= 10) {
                    return "Phone no. should be of 10 digits";
                  }
                  return null;
                },
                controller: phone,
                keyboardType: TextInputType.phone,
                maxLength: 10,
                decoration: InputDecoration(
                  hintText: "Phone",
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 5),
            ListTile(
              leading: const Icon(
                Icons.email,
                color: Colors.amber,
                size: 40,
              ),
              title: TextFormField(
                validator: (value) => value.isEmpty || !value.contains("@")
                    ? "Enter a valid email"
                    : null,
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Email",
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.cyan,
                size: 40,
              ),
              title: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: address,
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: "Address",
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: const Icon(
                Icons.list_alt,
                color: Colors.red,
                size: 40,
              ),
              title: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: complaint,
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: "Complaint",
                  border: const OutlineInputBorder(),
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
                    file_name,
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text(
                    description,
                  ),
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
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      print('Form Validation Done!');
                      await uploadFile();
                    submitComplaint();
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
                      },
                      );
                    }
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.blue),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.blueAccent,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
