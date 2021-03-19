import 'package:flutter/material.dart';
import 'package:telephony/telephony.dart';
import 'package:Crime_Reporting_AIO_app/utils/helplineCard.dart';

class EmergencyHelpline extends StatefulWidget {
  // EmergencyHelpline({Key key, this.title}) : super(key: key);

  // final String title;

  @override
  _EmergencyHelplineState createState() => _EmergencyHelplineState();
}

class _EmergencyHelplineState extends State<EmergencyHelpline> {
  //Telephony telephony = Telephony.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8185E2),
        centerTitle: true,
        title: Text(
          'Emergency Helpline Numbers',
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
                "Following are the Mumbai Emergency Helpline Numbers.\nTap on the below card to directly place a call.",
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

          //!  COVID Helpline Numbers
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.green,
                border: Border.all(color: Colors.grey),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: Text(
                "COVID Helpline Numbers",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          helplineCard(
            helplineName: 'CORONA HELPLINE : 1075',
            helplineNo: '1075',
          ),
          helplineCard(
            helplineName: 'CORONA HELPLINE : 011-23978046',
            helplineNo: '011-23978046',
          ),
          helplineCard(
            helplineName: 'MAHARASHTRA COVID HELPLINE: 022-22027990',
            helplineNo: '022-22027990',
          ),
          helplineCard(
            helplineName: 'MAHARASHTRA COVID HELPLINE: 020-26127394',
            helplineNo: '020-26127394',
          ),
          helplineCard(
            helplineName: 'MUMBAI Covid CTRL Room - 022-22664232',
            helplineNo: '022-22664232',
          ),
          helplineCard(
            helplineName: 'MUMBAI SUBURB Covid CTRL Room - 022-26556799',
            helplineNo: '022-26556799',
          ),
          SizedBox(height: 50),

          //!   IMPORTANT NUMBERS
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.green,
                border: Border.all(color: Colors.grey),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: Text(
                "IMPORTANT NUMBERS",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          helplineCard(
            helplineName: 'POLICE - 100',
            helplineNo: '100',
          ),
          helplineCard(
            helplineName: 'FIRE - 101',
            helplineNo: '101',
          ),
          helplineCard(
            helplineName: 'AMBULANCE - 102',
            helplineNo: '102',
          ),
          helplineCard(
            helplineName: 'CHILD HELPLINE - 1098',
            helplineNo: '1098',
          ),
          helplineCard(
            helplineName: 'WOMEN HELPLINE - 022-22633333',
            helplineNo: '022-22633333',
          ),
          helplineCard(
            helplineName: 'BLOOD BANK - 104',
            helplineNo: '104',
          ),
          helplineCard(
            helplineName: 'DISASTER HELPLINE - 022-22694725',
            helplineNo: '022-22694725',
          ),
          helplineCard(
            helplineName: 'TOURIST POLICE - 022-22621855',
            helplineNo: '022-22621855',
          ),
          helplineCard(
            helplineName: 'AIDS HELPLINE - 1097',
            helplineNo: '1097',
          ),
          helplineCard(
            helplineName: 'GAS LEAKAGE - 1906',
            helplineNo: '',
          ),
          SizedBox(height: 50),

          //!  Ambulances In Mumbai
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.green,
                border: Border.all(color: Colors.grey),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: Text(
                "Ambulances In Mumbai",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          helplineCard(
            helplineName: 'AMBULANCE HELPLINE - 102',
            helplineNo: '102',
          ),
          helplineCard(
            helplineName: 'AMBULANCE - 108',
            helplineNo: '108',
          ),
          helplineCard(
            helplineName: 'Mumbai Heart Brigade , B.M.C - 022-23079643',
            helplineNo: '022-23079643',
          ),
          helplineCard(
            helplineName: 'DIAL4242 Ambulance - 18002664242',
            helplineNo: '18002664242',
          ),
          helplineCard(
            helplineName: 'Ambulance Garage - 022-23079643',
            helplineNo: '022-23079643',
          ),
          helplineCard(
            helplineName: 'Infection Disease only - 022-23077324',
            helplineNo: '022-23077324',
          ),

          SizedBox(height: 50),

          //!  Police Services In Mumbai
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.green,
                border: Border.all(color: Colors.grey),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: Text(
                "Police Services In Mumbai",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          helplineCard(
            helplineName: 'Commissioner of Police, Mumbai - 22620826',
            helplineNo: '22620826',
          ),
          helplineCard(
            helplineName: 'Police Control Room Mumbai - 22621855',
            helplineNo: '22621855',
          ),
          helplineCard(
            helplineName: 'Mumbai Airport - 26156315',
            helplineNo: '26156315',
          ),
          helplineCard(
            helplineName: 'Andheri (East) - 26831562',
            helplineNo: '26831562',
          ),
          helplineCard(
            helplineName: 'M.I.D.C. - 28368352',
            helplineNo: '28368352',
          ),
          helplineCard(
            helplineName: 'Police Infoline - 1090',
            helplineNo: '1090',
          ),

          SizedBox(height: 50),

          //!  Fire Stations In Mumbai
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.green,
                border: Border.all(color: Colors.grey),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: Text(
                "Fire Stations In Mumbai",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          helplineCard(
            helplineName: 'FIRE Brigade Control Room - 23085991',
            helplineNo: '23085991',
          ),
          helplineCard(
            helplineName: 'FIRE Brigade Control Room - 23085992',
            helplineNo: '23085992',
          ),
          helplineCard(
            helplineName: 'Mumbai FIRE - 23076111',
            helplineNo: '23076111',
          ),
          helplineCard(
            helplineName: 'Thane FIRE - 25391600',
            helplineNo: '25391600',
          ),
          helplineCard(
            helplineName: 'Andheri East FIRE - 29200940',
            helplineNo: '29200940',
          ),

          SizedBox(height: 50),

          //!  Railways Helpline Mumbai
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.green,
                border: Border.all(color: Colors.grey),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: Text(
                "Railways Helpline Mumbai",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          helplineCard(
            helplineName: 'Railways Accident (G.R.P.) - 9833331111',
            helplineNo: '9833331111',
          ),
          helplineCard(
            helplineName: 'Western Railways Protection Force - 1311',
            helplineNo: '1311',
          ),
          helplineCard(
            helplineName: 'Central Railways Protection Force - 1275',
            helplineNo: '1275',
          ),
          helplineCard(
            helplineName:
                'All India Railway security helpline (Women harrasment , theft , crime) - 182',
            helplineNo: '182',
          ),
          helplineCard(
            helplineName: 'Railway Enquiry - 139',
            helplineNo: '139',
          ),

          SizedBox(height: 50),

          //!  Other Important Numbers
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.green,
                border: Border.all(color: Colors.grey),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: Text(
                "Other Important Numbers",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          helplineCard(
            helplineName: 'Mumbai Airport - 022-66851010',
            helplineNo: '022-66851010',
          ),
          helplineCard(
            helplineName: 'Tourist Enquiry (M.T.D.C) - 022-22024482',
            helplineNo: '022-22024482',
          ),
          helplineCard(
            helplineName: 'Traffic Police Control Room - 022-24937755',
            helplineNo: '022-24937755',
          ),
          helplineCard(
            helplineName:
                'Highway Safety Patrol - State Traffic Control Room - 022-22626655',
            helplineNo: '022-22626655',
          ),
          helplineCard(
            helplineName: 'Heans (Ambulance for Dead bodies) - 022-23077324',
            helplineNo: '022-23077324',
          ),
          helplineCard(
            helplineName: 'Bomb Detection & Disposable Squad - 022-22080501',
            helplineNo: '022-22080501',
          ),
          helplineCard(
            helplineName: 'Bomb Blast.Helpline - 022-22620935',
            helplineNo: '022-22620935',
          ),
        ],
      ),
    );
  }
}
