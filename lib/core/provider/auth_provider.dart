import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qr_app/UI/screen/shared_pref.dart';
import 'package:qr_app/UI/shared/commonUtility.dart';
import 'package:qr_app/core/models/student.dart';

import 'package:qr_app/core/services/auth_service.dart';
import 'package:qr_app/locator.dart';

import 'base_provider.dart';

class AuthProvider extends BaseProvider {
  // SPHelper spHelper = new SPHelper();
  // AuthService _authService = locator<AuthService>();
  // Student student = locator<Student>();
  AuthService _authService = locator<AuthService>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final key = GlobalKey<FormState>();
  final scafoldkey = GlobalKey<ScaffoldState>();
  final instance = Firestore.instance.collection("Student");
  // bool isEmail(String em) {
  //   String p = r'^(([/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/]';
  //   RegExp regExp = new RegExp(p);
  //   return regExp.hasMatch(em);
  // }

  // TextEditingController password = new TextEditingController();
  // Future<String> getUser() async {
  //   // setBusy(true);
  //   // bool tokenExist = await getToken();
  //   // if (tokenExist) {
  //   //   var response = await _authService.getUser();
  //   //   print(response.statusCode);
  //   //   if (response.statusCode == 200) {
  //   //     print(response.body);

  //   //     return true;
  //   //   } else
  //   //     setBusy(false);

  //   //   return false;
  //   // }
  //   // setBusy(false);
  //   // return false;
  // }

  // Future<void> saveToken(String token) async {
  //   // SharedPreferences perfs = await SharedPreferences.getInstance();
  // }

  login(BuildContext context) async {
    if (key.currentState.validate()) {
      cirularAlertDialog(context);
      await _authService.login(email.text, password.text).then((student) {
        Navigator.pop(context);
        if (student == null) {
          password.clear();
          showFlutterToast("Invalid credentials");
        } else {
          SPHelper.setString("email", email.text);
          // SPHelper.setString("email", email.text);
          showFlutterToast("Login successfully");
          Navigator.of(context).pushNamedAndRemoveUntil(
            'main',
            (Route<dynamic> route) => false,
          );
        }
      });
    }
  }

  Future<void> logout() async {
    // await _authService.logout();
    // await _authService.logout();
    // SharedPreferences perfs = await SharedPreferences.getInstance();
    // perfs.remove('access_token');

    SPHelper.logout();
  }
}
