import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class List extends StatefulWidget {
  List({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListState createState() => _ListState();
}

class _ListState extends State<List> {
  Future<void> call(String number)async {
    if(await canLaunch('tel:$number')){
      await launch('tel:$number');
    }else{
      print("Cannot Launch");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('List of Police Stations'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.phone),
            title: GestureDetector(
              child: Text(
                "Andheri - +91-22-26842677", textScaleFactor: 2.0,
              ),
              onTap: () {
                call("2226842677");
              },
            ),
          ),
          ListTile(
              leading: const Icon(Icons.phone),
              title: GestureDetector(
                child:
                    Text('Antop Hill - +91-22-24013767', textScaleFactor: 2.0),
                onTap: () {
                   call("2224013767");
                },
              )),
            ListTile(
              leading: const Icon(Icons.phone),
              title: GestureDetector(
              child: Text('Bandra - +91-22-26423122', textScaleFactor: 2.0),
              onTap: () {
                call("2226423122");
              },
            )),
              ListTile(
              leading: const Icon(Icons.phone),
              title: GestureDetector(
              child: Text('Borivali - +91-22-28930145', textScaleFactor: 2.0),
              onTap: () {
                call("2228930145");
              },
            )),
              ListTile(
              leading: const Icon(Icons.phone),
              title: GestureDetector(
              child: Text('Chembur - +91-22-25232044', textScaleFactor: 2.0),
              onTap: () {
                call("2225232044");
              },
            )),
              ListTile(
              leading: const Icon(Icons.phone),
              title: GestureDetector(
              child: Text('Colaba - +91-22-22856817', textScaleFactor: 2.0),
              onTap: () {
                call("2222856817");
              },
            )),
              ListTile(
              leading: const Icon(Icons.phone),
              title: GestureDetector(
              child: Text('Dadar - +91-22-24301403', textScaleFactor: 2.0),
              onTap: () {
                call("2224301403");
              },
            )),
              ListTile(
              leading: const Icon(Icons.phone),
              title: GestureDetector(
              child: Text('Dadar - +91-22-24301403', textScaleFactor: 2.0),
              onTap: () {
                call("2224301403");
              },
            )),
              ListTile(
              leading: const Icon(Icons.phone),
              title: GestureDetector(
                child:
                    Text('Antop Hill - +91-22-24013767', textScaleFactor: 2.0),
                onTap: () {
                  call("2224013767");
                },
              )),
              ListTile(
              leading: const Icon(Icons.phone),
              title: GestureDetector(
                child:
                    Text('Antop Hill - +91-22-24013767', textScaleFactor: 2.0),
                onTap: () {
                  call("2224013767");
                },
              )),
              ListTile(
              leading: const Icon(Icons.phone),
              title: GestureDetector(
                child:
                    Text('Antop Hill - +91-22-24013767', textScaleFactor: 2.0),
                onTap: () {
                  call("2224013767");
                },
              )),
              ListTile(
              leading: const Icon(Icons.phone),
              title: GestureDetector(
                child:
                    Text('Antop Hill - +91-22-24013767', textScaleFactor: 2.0),
                onTap: () {
                  call("2224013767");
                },
              )),

          
        ],
      ),
    );
  }
}
