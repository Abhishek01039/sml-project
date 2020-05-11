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

  Future<Student> login(String email, String password) async {
    // String body = jsonEncode({'email': email, 'password': password});
    QuerySnapshot qsnap = await instance
        .collection("Student")
        .where("email", isEqualTo: email)
        .where("password", isEqualTo: password)
        .getDocuments();

    print(qsnap.documents.length);
    if (qsnap.documents.length > 0) {
      var id = qsnap.documents.first.documentID;
      var stud = qsnap.documents.first.data;
      stud['id'] = id;
      print(stud);
      student = Student.fromJson(stud);
      return student;
      // return true;
    } else {
      return null;
    }
    // }).catchError((e) {
    //   print(e);
    //   return e;
    // });
    // return null;
    // return await api.httpPost('login', body);
  }

  // registerStudent() {
  //   Map data = {};
  //   instance.collection("Student").document().setData(data);
  // }

  // Future<http.Response> logout() async {
  //   return await api.httpPost('logout', {});
  // }
}
