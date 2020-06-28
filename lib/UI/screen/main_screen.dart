import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:qr_app/UI/screen/home_screen.dart';
import 'package:qr_app/UI/screen/profile.dart';
import 'package:qr_app/ui/screen/scan_screen.dart';

class MainScreen extends StatefulWidget {
  static final routeName = 'main';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    HomepageScreen(),
    ScanScreen(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR code"),
      ),
      body: screens.elementAt(currentIndex),
      // body: PageView(
      //   physics: NeverScrollableScrollPhysics(),
      //   controller: _pageController,
      //   children: <Widget>[
      //     HomeScreen(),
      //     ScanScreen(),
      //     Profile(),
      //   ],
      // ),
      // The method 'withOpacity' was called on null.
      // Receiver: null
      // Tried calling: withOpacity(0.2)
      // bottomNavigationBar: BubbleBottomBar(
      //   opacity: 0.2,
      //   currentIndex: currentIndex,
      //   backgroundColor: Style.darkColor,
      //   onTap: (i) {
      //     setState(() {
      //       currentIndex = i;
      //     });
      //   },
      //   //borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      //   elevation: 8,
      //   //new, gives a cute ink effect
      //   inkColor: Colors.black12, //optional, uses theme color if not specified
      //   items: <BubbleBottomBarItem>[
      //     BubbleBottomBarItem(
      //       backgroundColor: Style.primaryColor,
      //       icon: Icon(
      //         Icons.home,
      //         color: Colors.white,
      //       ),
      //       activeIcon: Icon(
      //         Icons.dashboard,
      //         color: Colors.red,
      //       ),
      //       title: Text(
      //         "Home",
      //         style: TextStyle(color: Colors.white),
      //       ),
      //     ),
      //     BubbleBottomBarItem(
      //       backgroundColor: Colors.deepPurple,
      //       icon: Icon(
      //         Icons.add_a_photo,
      //         // color: Colors.white,
      //       ),
      //       activeIcon: Icon(
      //         Icons.access_time,
      //         color: Colors.deepPurple,
      //       ),
      //       title: Text("Scan"),
      //     ),
      //     BubbleBottomBarItem(
      //       // backgroundColor: Colors.indigo,
      //       icon: Icon(
      //         Icons.person,
      //         color: Colors.white,
      //       ),
      //       activeIcon: Icon(
      //         Icons.folder_open,
      //         // color: Colors.indigo,
      //       ),
      //       title: Text("Profile"),
      //     ),
      //   ],
      // ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_a_photo,
            ),
            title: Text('Scan'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
        ],
        currentIndex: currentIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (i) {
          setState(() {
            currentIndex = i;
          });
        },
      ),
    );
  }
}
