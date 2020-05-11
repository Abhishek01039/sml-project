//TODO just put your profile code here.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/core/provider/profile_provider.dart';

class Profile extends StatelessWidget {
  static final routeName = 'profile';
  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, profileProvider, _) {
        profileProvider.profile();
        return Container(
          // width: MediaQuery.of(context).size.width,
          child: Text("data"),
        );
      },
    );
  }
}
