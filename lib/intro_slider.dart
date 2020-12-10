import 'package:flutter/material.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:intro_slider/scrollbar_behavior_enum.dart';

class IntroScreen extends StatefulWidget {
  IntroScreen({Key key}) : super(key: key);

  @override
  IntroScreenState createState() => IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = List();

  Function goToTab;

  @override
  void initState() {
    super.initState();

    slides.add(
      Slide(
        title: "Report Crime and Offense",
        styleTitle: TextStyle(
            color: Color(0xFF8c82f4),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Submit crime reports to Police Officials at anytime, from anywhere!\n\nUse our custom complaint registration feature\n\nOR\n\nInbuilt Mumbai Police E-complaint webpage to directly report complaints to the Police",
        styleDescription: TextStyle(
          color: Colors.yellow[900],
          fontSize: 20.0,
          fontStyle: FontStyle.italic,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w600,
        ),
        pathImage: "images/IndianPoliceOfficer_whiteBG.png",
        widthImage: 200,
        heightImage: 200,
      ),
    );
    slides.add(
      Slide(
        title: "Your Safety - Our Priority!\nTop Safety Features!",
        styleTitle: TextStyle(
            color: Color(0xFF8c82f4),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "SoS feature with instant ability to send your location to family or friends in case of emergency situations.\n\nGet the list of all the Police Stations in Mumbai with their contact information.\n\nAccess Mumbai Police website and Safety Tips in our app itself.",
        styleDescription: TextStyle(
          color: Colors.yellow[900],
          fontSize: 20.0,
          fontStyle: FontStyle.italic,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w600,
        ),
        pathImage: "images/Safety_shakehand.png",
      ),
    );
    slides.add(
      Slide(
        title: "Secure Data Storage",
        styleTitle: TextStyle(
            color: Color(0xFF8c82f4),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Your private data and crime reports are stored in our secure Google servers with utmost safety.\n\nSubmit complaints regarding Lost & Found objects.",
        styleDescription: TextStyle(
          color: Colors.yellow[900],
          fontSize: 20.0,
          fontStyle: FontStyle.italic,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w600,
        ),
        pathImage: "images/Lock.png",
      ),
    );
  }

  void onDonePress() {
    // Back to the first tab
    Navigator.pushNamed(context, '/login');
  }

  void onTabChangeCompleted(index) {
    // Index of current tab is focused
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Color(0xFF8c82f4),
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Color(0xFF8c82f4),
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Color(0xFF8c82f4),
    );
  }

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = List();
    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.only(top: 100, right: 20, left: 20),
        child: Container(
          margin: EdgeInsets.only(bottom: 60.0, top: 60.0),
          child: ListView(
            children: <Widget>[
              GestureDetector(
                  child: Image.asset(
                currentSlide.pathImage,
                width: 200.0,
                height: 200.0,
                fit: BoxFit.contain,
              )),
              Container(
                child: Text(
                  currentSlide.title,
                  style: currentSlide.styleTitle,
                  textAlign: TextAlign.center,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
              Container(
                child: Text(
                  currentSlide.description,
                  style: currentSlide.styleDescription,
                  textAlign: TextAlign.center,
                  maxLines: 20,
                  overflow: TextOverflow.ellipsis,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
            ],
          ),
        ),
      ));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      // List slides
      slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      colorSkipBtn: Color(0xFFe1deff),
      highlightColorSkipBtn: Color(0xFF8c82f4),

      // Next button
      renderNextBtn: this.renderNextBtn(),

      // Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: this.onDonePress,
      colorDoneBtn: Color(0xFFe1deff),
      highlightColorDoneBtn: Color(0xFF8c82f4),

      // Dot indicator
      colorDot: Color(0xFF8c82f4),
      sizeDot: 13.0,
      typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,

      // Tabs
      listCustomTabs: this.renderListCustomTabs(),
      backgroundColorAllSlides: Colors.white,
      refFuncGoToTab: (refFunc) {
        this.goToTab = refFunc;
      },

      // Show or hide status bar
      shouldHideStatusBar: true,

      // On tab change completed
      onTabChangeCompleted: this.onTabChangeCompleted,
    );
  }
}
