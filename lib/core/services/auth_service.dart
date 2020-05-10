import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qr_app/core/models/student.dart';
import 'package:qr_app/core/services/base_api.dart';

import 'package:qr_app/locator.dart';

class AuthService extends BaseApi {
  Student student = locator<Student>();
  final instance = Firestore.instance;
  getUser() async {
    // return await api.httpGet('user');
  }

  Future<Student> login(String ename) async {
    // String body = jsonEncode({'email': email, 'password': password});
    instance
        .collection("Student")
        .where("email", isEqualTo: ename)
        .getDocuments()
        .then((value) {
      if (value.documents.length > 0) {
        // return student.fromJson(value.documents.first);
      } else {}
    });
    return null;
    // return await api.httpPost('login', body);
  }

  registerStudent() {
    Map data = {};
    instance.collection("Student").document().setData(data);
  }

  // Future<http.Response> logout() async {
  //   return await api.httpPost('logout', {});
  // }
}
