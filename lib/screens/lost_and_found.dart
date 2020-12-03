import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LostFound extends StatefulWidget {
  LostFound({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LostFoundState createState() => new _LostFoundState();
}

class _LostFoundState extends State<LostFound> {
  String dropdownValue1 = 'Lost Item Report';
  String dropdownValue2 = 'Driving License';
  final format = DateFormat("yyyy-MM-dd HH:mm");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Lost & Found'),
      ),
      body: ListView(
          children: <Widget>[
            new ListTile(
              title: Text("Applicant Details"),
            ),
            const Divider(
              height: 1.0,
            ),
            new ListTile(
              leading: const Icon(Icons.person),
              title: new TextField(
                decoration: new InputDecoration(
                  hintText: "Name",
                ),
              ),
            ),
            new ListTile(
              leading: const Icon(Icons.phone),
              title: new TextField(
                keyboardType: TextInputType.phone,
                decoration: new InputDecoration(
                  hintText: "Phone",
                ),
              ),
            ),
            new ListTile(
              leading: const Icon(Icons.email),
              title: new TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: new InputDecoration(
                  hintText: "Email",
                ),
              ),
            ),
            new ListTile(
              leading: const Icon(
                Icons.home,
              ),
              title: new TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: new InputDecoration(
                  hintText: "Address",
                ),
              ),
            ),
            const Divider(
              height: 1.0,
            ),
            new ListTile(
              title: Text("Article Details"),
            ),
            const Divider(
              height: 1.0,
            ),
            new ListTile(
              title: Text("Complaint Type"),
            ),
            new ListTile(
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
            new ListTile(
              title: Text("Article Type"),
            ),
            new ListTile(
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
            new ListTile(
              title: Text("Date & Time"),
            ),
            new ListTile(
              title: DateTimeField(
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
            new ListTile(
              leading: const Icon(
                Icons.home,
              ),
              title: new TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: new InputDecoration(
                  hintText: "Address of Lost Item",
                ),
              ),
            ),
            new ListTile(
              title: new TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: new InputDecoration(
                  hintText: "Article Description",
                ),
              ),
            ),
            SizedBox(
              height:20
            ),
            RaisedButton(onPressed: null, child: Text("Submit"),color: Colors.blueAccent,)        ],
        ),
    );
  }
}
