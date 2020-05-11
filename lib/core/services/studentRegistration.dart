import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:qr_app/core/services/base_api.dart';

class RegistraionServices extends BaseApi {
  final instance = Firestore.instance.collection("Student");
  Future<bool> registration(String name, String email, String password) {
    instance.document().setData({
      "name": name,
      "email": email,
      "password": password,
    }).whenComplete(() {
      return true;
    }).catchError((e) {
      print(e);
      return false;
    });
    return null;
    // return ;
    // return ;
  }
}
