import 'package:flutter/material.dart';
import 'package:telephony/telephony.dart';

class List extends StatefulWidget {
  List({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListState createState() => _ListState();
}

class _ListState extends State<List> {
  Telephony telephony = Telephony.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8185E2),
        centerTitle: true,
        title: Text(
          'List of Mumbai Police Stations',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
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
                "Tap on the below card to directly call the respective Police Station",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
            child: Divider(
              indent: 100,
              endIndent: 100,
              thickness: 1.2,
              color: Colors.grey,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              leading: const Icon(
                Icons.phone,
                color: Colors.blue,
                size: 30,
              ),
              title: GestureDetector(
                child: Text(
                  "Aarey Police Station-\n022-29272485",
                  textScaleFactor: 1.5,
                ),
                onTap: () {
                  telephony.openDialer("02229272485");
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              leading: const Icon(
                Icons.phone,
                color: Colors.blue,
                size: 30,
              ),
              title: GestureDetector(
                child: Text(
                  'Airport Police Station-\n022-26156309',
                  textScaleFactor: 1.5,
                ),
                onTap: () {
                  telephony.openDialer("02226156309");
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              leading: const Icon(
                Icons.phone,
                color: Colors.blue,
                size: 30,
              ),
              title: GestureDetector(
                child: Text(
                  'Amboli Police Station-\n022-26762001',
                  textScaleFactor: 1.5,
                ),
                onTap: () {
                  telephony.openDialer("02226762001");
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              leading: const Icon(
                Icons.phone,
                color: Colors.blue,
                size: 30,
              ),
              title: GestureDetector(
                child: Text(
                  'Andheri Police Station-\n022-26831365',
                  textScaleFactor: 1.5,
                ),
                onTap: () {
                  telephony.openDialer("02226831365");
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              leading: const Icon(
                Icons.phone,
                color: Colors.blue,
                size: 30,
              ),
              title: GestureDetector(
                child: Text(
                  'Bandra Police Station-\n022-26423122',
                  textScaleFactor: 1.5,
                ),
                onTap: () {
                  telephony.openDialer("02226423122");
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              leading: const Icon(
                Icons.phone,
                color: Colors.blue,
                size: 30,
              ),
              title: GestureDetector(
                child: Text(
                  'Borivali Police Station-\n022-28930145',
                  textScaleFactor: 1.5,
                ),
                onTap: () {
                  telephony.openDialer("02228930145");
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              leading: const Icon(
                Icons.phone,
                color: Colors.blue,
                size: 30,
              ),
              title: GestureDetector(
                child: Text(
                  'Kurla Police Station-\n022-26500478',
                  textScaleFactor: 1.5,
                ),
                onTap: () {
                  telephony.openDialer("02226500478");
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              leading: const Icon(
                Icons.phone,
                color: Colors.blue,
                size: 30,
              ),
              title: GestureDetector(
                child: Text(
                  'Bhandup Police Station-\n022-25954467',
                  textScaleFactor: 1.5,
                ),
                onTap: () {
                  telephony.openDialer("02225954467");
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              leading: const Icon(
                Icons.phone,
                color: Colors.blue,
                size: 30,
              ),
              title: GestureDetector(
                child: Text(
                  'Chembur Police Station-\n022-25232044',
                  textScaleFactor: 1.5,
                ),
                onTap: () {
                  telephony.openDialer("02225232044");
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              leading: const Icon(
                Icons.phone,
                color: Colors.blue,
                size: 30,
              ),
              title: GestureDetector(
                child: Text(
                  'Dahisar Police Station-\n022-28284024',
                  textScaleFactor: 1.5,
                ),
                onTap: () {
                  telephony.openDialer("02228284024");
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              leading: const Icon(
                Icons.phone,
                color: Colors.blue,
                size: 30,
              ),
              title: GestureDetector(
                child: Text(
                  'Dindoshi Police Station-\n022-24691929',
                  textScaleFactor: 1.5,
                ),
                onTap: () {
                  telephony.openDialer("2224013767");
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              leading: const Icon(
                Icons.phone,
                color: Colors.blue,
                size: 30,
              ),
              title: GestureDetector(
                child: Text(
                  'Goregaon Police Station\n022-28721900',
                  textScaleFactor: 1.5,
                ),
                onTap: () {
                  telephony.openDialer("02228721900");
                },
              ),
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
