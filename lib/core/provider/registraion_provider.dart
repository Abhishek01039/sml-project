import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:qr_app/UI/screen/shared_pref.dart';
import 'package:qr_app/core/provider/base_provider.dart';

class RegistrationProvider extends BaseProvider {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final instance = Firestore.instance.collection("Student");
  final key = GlobalKey<FormState>();
  // bool isEmail(String em) {
  //   String p = r'^(([/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/]';
  //   RegExp regExp = new RegExp(p);
  //   return regExp.hasMatch(em);
  // }

  registration(BuildContext context) {
    if (key.currentState.validate()) {
      instance.document().setData({
        "name": nameController.text,
        "email": emailController.text,
        "password": passwordController.text,
      }).then((value) {
        print("Inserted successfully");
        SPHelper.setString("email", emailController.text);
        SPHelper.setString("name", nameController.text);
        Navigator.pushReplacementNamed(context, 'main');
      }).catchError((e) {
        print(e);
      });
    }
  }
}
