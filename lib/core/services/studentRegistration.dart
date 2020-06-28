import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qr_app/UI/screen/shared_pref.dart';

import 'package:qr_app/core/services/base_api.dart';

class RegistraionServices extends BaseApi {
  final instance = Firestore.instance.collection("Student");

  Future<String> registration(
      String name, String email, String password) async {
    DocumentReference docReference = instance.document();
    await docReference.setData({
      "name": name,
      "email": email,
      "password": password,
      // }).whenComplete(() {

      //   return true;
    });
    if (docReference.documentID != null) {
      // print(docReference.documentID);
      return docReference.documentID;
    }
    // then((value) {
    //   print(docReference.documentID);
    //   if (docReference.documentID != null) {
    //     SPHelper.setString("id", docReference.documentID);
    //     return true;
    //   }
    //   return false;
    // }).catchError((e) {
    //   print(e);
    //   return false;
    // });
    return "";
    // return ;
    // return ;
  }
}
