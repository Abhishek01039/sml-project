import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qr_app/UI/screen/shared_pref.dart';

import 'package:qr_app/core/services/base_api.dart';

class MessageServices extends BaseApi {
  final instance = Firestore.instance.collection("Message");
  Future<bool> message(String message) async {
    DocumentReference docReference = instance.document();
    await docReference.setData({
      "name": SPHelper.getString("name"),
      "message": message,
      "email": SPHelper.getString("email"),
    });
    if (docReference.documentID != null) {
      return true;
    }
    return false;
    // .then((value) {
    //   // print(value);
    //   print(docReference.documentID);
    //   return true;
    // }).catchError((e) {
    //   print(e);
    //   return false;
    // });
    // return false;
  }
}
