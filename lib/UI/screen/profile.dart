import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/UI/screen/shared_pref.dart';
import 'package:qr_app/UI/screen/welcome_screen.dart';
import 'package:qr_app/UI/screen/widgets/size_config.dart';

import 'package:qr_app/UI/shared/style.dart';
import 'package:qr_app/core/provider/profile_provider.dart';

class Profile extends StatelessWidget {
  static final routeName = 'profile';
  @override
  Widget build(BuildContext context) {
    showNameDialog(BuildContext context, ProfileProvider profileProvider) {
      return showDialog(
        context: context,
        child: AlertDialog(
          title: Text("Change the Name"),
          content: Form(
            key: profileProvider.key,
            child: TextFormField(
              controller: profileProvider.changeNameController,
              decoration: Style.inputDecoration('Name'),
              validator: (v) {
                if (v.isEmpty) {
                  return 'input require';
                } else
                  return null;
              },
            ),
          ),
          actions: <Widget>[
            RaisedButton(
              onPressed: () {
                profileProvider.changeNameController.clear();
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            RaisedButton(
              onPressed: () {
                profileProvider.updateStudentName(context);
              },
              child: Text("Yes"),
            ),
          ],
        ),
      );
    }

    return Consumer<ProfileProvider>(
      builder: (context, profileProvider, _) {
        profileProvider.profile();

        return FutureBuilder(
          future: profileProvider.profile(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Stack(
                children: <Widget>[
                  ClipPath(
                    child: Container(color: Colors.blue.withOpacity(0.8)),
                    clipper: GetClipper(),
                  ),
                  Positioned(
                    width: 350.0,
                    top: MediaQuery.of(context).size.height / 6.5,
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 150.0,
                          height: 150.0,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://cdn.pixabay.com/photo/2015/06/19/21/24/the-road-815297__340.jpg'),
                                fit: BoxFit.cover),
                            borderRadius:
                                BorderRadius.all(Radius.circular(75.0)),
                            boxShadow: [
                              BoxShadow(blurRadius: 7.0, color: Colors.black)
                            ],
                          ),
                        ),
                        SizedBox(height: 70.0),
                        Text(
                          snapshot.data.name.toString(),
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 15.0),
                        Text(
                          snapshot.data.email,
                          style: TextStyle(
                            fontSize: 17.0,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        SizedBox(height: 25.0),
                        Container(
                          height: 30.0,
                          width: 95.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Colors.greenAccent,
                            color: Colors.green,
                            elevation: 7.0,
                            child: GestureDetector(
                              onTap: () {
                                showNameDialog(context, profileProvider);
                              },
                              child: Center(
                                child: Text(
                                  'Edite Name',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 25.0),
                        Container(
                          height: 30.0,
                          width: 95.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Colors.greenAccent,
                            color: Colors.red,
                            elevation: 7.0,
                            child: GestureDetector(
                              onTap: () {
                                SPHelper.logout();
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => WelcomeScreenState(),
                                    ),
                                    (route) => false);
                              },
                              child: Center(
                                child: Text(
                                  'Log out',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        );
      },
    );
  }
}

class GetClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
