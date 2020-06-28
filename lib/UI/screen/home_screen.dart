import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:qr_app/core/models/homeModel.dart';

class HomepageScreen extends StatefulWidget {
  @override
  _HomepageScreenState createState() => new _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  List<Home> home = [
    Home(
        author: 'Prof Toumi',
        text:
            'the following course is: mathematics - teacher: Mr.Toumi - the room: 08 - will start in: 1 h: 30 min'),
    Home(
        author: 'Prof Saidi',
        text:
            'the following course is: Computer Network - teacher: Mr.Saidi - the room: 12 - will start in: 2 h: 30 min'),
    Home(
        author: 'Prof Baddi',
        text:
            'the following course is: Java - teacher: Mr.Toumi - the room: 07 - will start in: 3 h: 30 min'),
  ];

  Widget homeTemplate(home) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(home.text,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey[600],
                )),
            SizedBox(height: 6.0),
            Text(home.author,
                style: TextStyle(fontSize: 14.0, color: Colors.grey[800])),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Todays Plan'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: home.map((home) => homeTemplate(home)).toList(),
      ),
    );
  }
}
