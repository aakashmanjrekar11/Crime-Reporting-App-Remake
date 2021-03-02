import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class List extends StatefulWidget {
  List({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListState createState() => _ListState();
}

class _ListState extends State<List> {
  Future<void> call(String number) async {
    if (await canLaunch('tel:$number')) {
      await launch('tel:$number');
    } else {
      print("Cannot Launch");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'List of Mumbai Police Stations',
          style: TextStyle(fontWeight: FontWeight.bold),
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
                  "Aarey Police Station\n-022-29272485",
                  textScaleFactor: 1.5,
                ),
                onTap: () {
                  call("02229272485");
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
                  'Airport Police Station\n-022-26156309',
                  textScaleFactor: 1.5,
                ),
                onTap: () {
                  call("02226156309");
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
                  'Amboli Police Station\n-022-26762001',
                  textScaleFactor: 1.5,
                ),
                onTap: () {
                  call("02226762001");
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
                  'Andheri Police Station\n-022-26831365',
                  textScaleFactor: 1.5,
                ),
                onTap: () {
                  call("02226831365");
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
                  'Bandra Police Station\n-022-26423122',
                  textScaleFactor: 1.5,
                ),
                onTap: () {
                  call("02226423122");
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
                  'Borivali Police Station\n-022-28930145',
                  textScaleFactor: 1.5,
                ),
                onTap: () {
                  call("02228930145");
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
                  'Kurla Police Station\n-022-26500478',
                  textScaleFactor: 1.5,
                ),
                onTap: () {
                  call("02226500478");
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
                  'Bhandup Police Station\n-022-25954467',
                  textScaleFactor: 1.5,
                ),
                onTap: () {
                  call("02225954467");
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
                  'Chembur Police Station\n-022-25232044',
                  textScaleFactor: 1.5,
                ),
                onTap: () {
                  call("02225232044");
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
                  'Dahisar Police Station\n-022-28284024',
                  textScaleFactor: 1.5,
                ),
                onTap: () {
                  call("02228284024");
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
                  'Dindoshi Police Station\n-022-24691929',
                  textScaleFactor: 1.5,
                ),
                onTap: () {
                  call("2224013767");
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
                  call("02228721900");
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
