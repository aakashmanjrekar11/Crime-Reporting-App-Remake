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
  final name=TextEditingController();
  final phone=TextEditingController();
  final email=TextEditingController();
  final address=TextEditingController();
  final dateTime=TextEditingController();
  final addressLost=TextEditingController();
  final desc=TextEditingController();

  submit(){
    Map<String,dynamic> data = {"Name":name.text,"Phone":phone.text,"Email":email.text,"Address":address.text,"Complaint Type":dropdownValue1,"Article Type":dropdownValue2,"Date & Time":dateTime.text,"Address of Lost/Found item":addressLost.text,"Description":desc.text};
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('lost_and_found');
    collectionReference.add(data);
  }
  _onPressed() {
    FirebaseFirestore.instance.collection("lost_and_found").get().then((querySnapshot) {
    querySnapshot.docs.forEach((result) {
      print(result.data());
    });
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Lost & Found'),
      ),
      body: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Applicant Details"),
            ),
            const Divider(
              height: 1.0,
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: TextField(
                controller: name,
                decoration: InputDecoration(
                  hintText: "Name",
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: TextField(
                controller: phone,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: "Phone",
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.email),
              title: TextField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Email",
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
              ),
              title: TextField(
                controller: address,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: "Address",
                ),
              ),
            ),
            const Divider(
              height: 1.0,
            ),
            ListTile(
              title: Text("Article Details"),
            ),
            const Divider(
              height: 1.0,
            ),
            ListTile(
              title: Text("Complaint Type"),
            ),
            ListTile(
              title: DropdownButton<String>(   
                      value: dropdownValue1, 
                      icon: Icon(Icons.arrow_downward,color: Colors.white,),
                      iconSize: 20,
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
                      items: <String>['Lost Item Report', 'Found Item Report                                                           ']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
            ),
            ListTile(
              title: Text("Article Type"),
            ),
            ListTile(
              title: DropdownButton<String>(    
                      value: dropdownValue2,
                      icon: Icon(Icons.arrow_downward,color: Colors.white,),
                      iconSize: 20,
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
                      items: <String>['Driving License', 'Aadhaar Card','PAN Card','Voting ID Card','Ration Card','Educational Document                                                    ','Other Document']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
            ),
            ListTile(
              title: Text("Date & Time"),
            ),
            ListTile(
              title: DateTimeField(
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
                            initialTime:
                                TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                          );
                          return DateTimeField.combine(date, time);
                        } else {
                          return currentValue;
                        }
                      },
                    ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
              ),
              title: TextField(
                controller: addressLost,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: "Address of Lost Item",
                ),
              ),
            ),
            ListTile(
              title: TextField(
                controller: desc,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: "Article Description",
                ),
              ),
            ),
            SizedBox(
              height:20
            ),
            RaisedButton(onPressed: submit()
            ,child: Text("Submit"),color: Colors.blueAccent,),
            RaisedButton(onPressed: ()async{
                await _onPressed();
            }, 
            child: Text("View Complaints"),color: Colors.blueAccent,),   
               ],
        ),
    );
  }
}
