import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:qr_app/UI/screen/home_screen.dart';
import 'package:qr_app/UI/screen/profile.dart';
import 'package:qr_app/ui/screen/scan_screen.dart';
import 'package:qr_app/UI/shared/style.dart';

class MainScreen extends StatefulWidget {
  static final routeName = 'main';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final PageController _pageController = new PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: <Widget>[
          HomeScreen(),
          ScanScreen(),
          Profile(),
        ],
      ),
      bottomNavigationBar: BubbleBottomBar(
        opacity: .2,
        currentIndex: currentIndex,
        backgroundColor: Style.darkColor,
        onTap: (i) {
          setState(() {
            currentIndex = i;
            _pageController.animateToPage(i,
                duration: kTabScrollDuration, curve: Curves.easeIn);
          });
        },
        //borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        elevation: 8,
        //new, gives a cute ink effect
        inkColor: Colors.black12, //optional, uses theme color if not specified
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
            backgroundColor: Style.primaryColor,
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            activeIcon: Icon(
              Icons.dashboard,
              color: Colors.red,
            ),
            title: Text(
              "Home",
              style: TextStyle(color: Colors.white),
            ),
          ),
          BubbleBottomBarItem(
            backgroundColor: Colors.deepPurple,
            icon: Icon(
              Icons.add_a_photo,
              // color: Colors.white,
            ),
            activeIcon: Icon(
              Icons.access_time,
              color: Colors.deepPurple,
            ),
            title: Text("Scan"),
          ),
          BubbleBottomBarItem(
            // backgroundColor: Colors.indigo,
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            activeIcon: Icon(
              Icons.folder_open,
              // color: Colors.indigo,
            ),
            title: Text("profile"),
          ),
        ],
      ),
    );
  }
}
