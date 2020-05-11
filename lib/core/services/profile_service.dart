import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qr_app/UI/screen/shared_pref.dart';
import 'package:qr_app/core/models/student.dart';
import 'package:qr_app/core/services/base_api.dart';
import 'package:qr_app/locator.dart';

class ProfileService extends BaseApi {
  final instance = Firestore.instance;
  Student student = locator<Student>();
  Future<Student> profile() async {
    String id = SPHelper.getString("ID");
    DocumentSnapshot qsnap =
        await instance.collection("Student").document(id).get();

    print(qsnap.data);

    // var id = qsnap.data.first.documentID;
    var stud = qsnap.data;

    print(stud);
    student = Student.fromJson(stud);
    return student;
    // return true;
  }
}
