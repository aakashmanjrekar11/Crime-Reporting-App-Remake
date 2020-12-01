import 'package:flutter/material.dart';
import 'package:Crime_Reporting_AIO_app/utils/focusList.dart';
import 'drawer_custom.dart';
import 'bottomNavBar_custom.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'utils/carouselWithIndicator.dart';
import 'utils/investmentList.dart';
import 'utils/insuranceList.dart';
import 'utils/loansListView.dart';
import 'utils/RechargeBillList.dart';
import 'utils/TravelHotelListView.dart';
import 'package:fluttertoast/fluttertoast.dart';

// import 'package:double_back_to_close_app/double_back_to_close_app.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: DrawerCustom(),
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: FaIcon(FontAwesomeIcons.bars),
                color: Colors.grey[600],
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () {
                  Fluttertoast.showToast(
                    msg: "⚠️Under Construction!⚠️",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.grey,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                },
                child: FaIcon(FontAwesomeIcons.bell),
              ),
            ),
          ],
          backgroundColor: Colors.white70,
          title: Text(
            'Hi, Samir!',
            style: TextStyle(
              fontSize: 23.0,
              fontWeight: FontWeight.bold,
              //fontStyle: FontStyle.italic,
              color: Colors.grey[800],
            ),
          ),
        ),
        body: _buildBody(),

        //bottomNavigationBar: BottomNavBar(),
      ),
    );
  }

  _buildBody() {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(15.0),
              gradient: LinearGradient(
                colors: [Colors.blue[700], Colors.blue[300]],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(2, 7), // changes position of shadow
                ),
              ],
            ),
            margin: EdgeInsets.only(top: 10, left: 15, right: 15),
            padding: EdgeInsets.only(left: 5, right: 5),
            height: 120.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 120,
                  child: FocusList(),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 20.0,
            child: Divider(
              indent: 100,
              endIndent: 100,
              color: Colors.grey[400],
              thickness: 1.2,
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: 5),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                CarouselWithIndicatorDemo(),
                SizedBox(
                  height: 5.0,
                  child: Divider(
                    indent: 180,
                    endIndent: 180,
                    color: Colors.grey[400],
                    thickness: 1.2,
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(3, 5), // changes position of shadow
                ),
              ],
            ),
            margin: EdgeInsets.only(top: 10, left: 15, right: 15),
            padding: EdgeInsets.only(left: 5, right: 5),
            height: 600.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      child: Text(
                        'Payments',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      padding: EdgeInsets.only(top: 7, left: 15, bottom: 5),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                  child: Divider(
                    indent: 15,
                    endIndent: 15,
                    color: Colors.grey[400],
                    thickness: 1.2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 5.0),
                  child: Title(
                    color: Colors.black,
                    child: Text(
                      'Recharge  &  Bill Payment',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                  child: Divider(
                    indent: 160,
                    endIndent: 160,
                    color: Colors.grey[400],
                    thickness: 1.2,
                  ),
                ),
                Container(
                  height: 330,
                  child: RechargeBillList(),
                ),
                SizedBox(
                  height: 5.0,
                  child: Divider(
                    indent: 10,
                    endIndent: 10,
                    color: Colors.grey[400],
                    thickness: 1.2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 5.0),
                  child: Title(
                    color: Colors.black,
                    child: Text(
                      'Travel  &  Hotel',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                  child: Divider(
                    indent: 160,
                    endIndent: 160,
                    color: Colors.grey[400],
                    thickness: 1.2,
                  ),
                ),
                Container(
                  height: 125,
                  child: TravelList(),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(3, 5), // changes position of shadow
                ),
              ],
            ),
            margin: EdgeInsets.only(top: 25, left: 15, right: 15),
            padding: EdgeInsets.only(left: 5, right: 5),
            height: 170.0,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      child: Text(
                        'Investments',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      padding: EdgeInsets.only(top: 7, left: 10, bottom: 5),
                    ),
                  ],
                ),
                Container(
                  height: 120,
                  child: InvestmentsList(),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(3, 5), // changes position of shadow
                ),
              ],
            ),
            margin: EdgeInsets.only(top: 25, left: 15, right: 15),
            padding: EdgeInsets.only(left: 5, right: 5),
            height: 170.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      child: Text(
                        'Insurance',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      padding: EdgeInsets.only(top: 7, left: 10, bottom: 5),
                    ),
                  ],
                ),
                Container(
                  height: 120,
                  child: InsuranceList(),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 25,
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(3, 5), // changes position of shadow
                  ),
                ],
              ),
              margin: EdgeInsets.only(left: 15, right: 15),
              padding: EdgeInsets.only(left: 5, right: 5),
              height: 170.0,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        child: Text(
                          'Loans',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        padding: EdgeInsets.only(top: 7, left: 10, bottom: 5),
                      ),
                    ],
                  ),
                  Container(
                    height: 120.0,
                    child: LoansListView(),
                  ),
                ],
              )),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 100.0,
            child: Divider(
              indent: 100,
              endIndent: 100,
              color: Colors.grey[400],
              thickness: 1.2,
            ),
          ),
        ),
      ],
    );
  }
}
