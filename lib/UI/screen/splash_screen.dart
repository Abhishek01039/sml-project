import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_app/UI/screen/shared_pref.dart';

class MySpalshScreen extends StatefulWidget {
  static final routeName = 'splashScreen';
  MySpalshScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MySpalshScreenState createState() => _MySpalshScreenState();
}

class _MySpalshScreenState extends State<MySpalshScreen>
    with WidgetsBindingObserver {
//ProgressDialog pr;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);

    Timer(Duration(seconds: 2), () {
      //loadData();
      SPHelper.logout();
      // print(SPHelper.getString("email"));
      SPHelper.getString("email").isEmpty
          ? Navigator.pushReplacementNamed(context, "welcome")
          : Navigator.pushReplacementNamed(context, "main");
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

//  @override
//  void didChangeAppLifecycleState(AppLifecycleState state) {
//    super.didChangeAppLifecycleState(state);
//    //print("APP_STATE: $state");
//
//    if (state == AppLifecycleState.resumed) {}
//  }

  @override
  Widget build(BuildContext context) {
    //_showProgress();
    return Scaffold(
      body: Center(
        //TODO put your logo here
        child: Padding(
          padding: const EdgeInsets.all(100.0),
          child: Text("data"),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
