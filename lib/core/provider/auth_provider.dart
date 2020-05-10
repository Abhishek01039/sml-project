import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qr_app/UI/screen/shared_pref.dart';
import 'package:qr_app/core/services/api.dart';
import 'package:qr_app/core/services/auth_service.dart';
import 'package:qr_app/locator.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'base_provider.dart';

class AuthProvider extends BaseProvider {
  SPHelper spHelper = new SPHelper();
  // AuthService _authService = locator<AuthService>();
  // Api _api = locator<Api>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final key = GlobalKey<FormState>();

  bool isEmail(String em) {
    String p = r'^(([/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/]';
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(em);
  }

  // TextEditingController password = new TextEditingController();
  Future<String> getUser() async {
    String email = SPHelper.getString("email") ?? "";
    return email;
    // setBusy(true);
    // bool tokenExist = await getToken();
    // if (tokenExist) {
    //   var response = await _authService.getUser();
    //   print(response.statusCode);
    //   if (response.statusCode == 200) {
    //     print(response.body);

    //     return true;
    //   } else
    //     setBusy(false);

    //   return false;
    // }
    // setBusy(false);
    // return false;
  }

  Future<bool> getToken() async {
    SharedPreferences perfs = await SharedPreferences.getInstance();
    var token = perfs.getString('access_token');
    if (token != null) {
      return true;
    }
    return false;
  }

  Future<void> saveToken(String token) async {
    SharedPreferences perfs = await SharedPreferences.getInstance();
  }

  Future<bool> login(String email, password) async {}

  Future<void> logout() async {
    // await _authService.logout();
    // await _authService.logout();
    SharedPreferences perfs = await SharedPreferences.getInstance();
    perfs.remove('access_token');
  }
}
