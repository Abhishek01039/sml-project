import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:qr_app/UI/screen/shared_pref.dart';
import 'package:qr_app/UI/shared/commonUtility.dart';
import 'package:qr_app/core/provider/base_provider.dart';
import 'package:qr_app/core/services/studentRegistration.dart';
import 'package:qr_app/locator.dart';

class RegistrationProvider extends BaseProvider {
  RegistraionServices _registraionServices = locator<RegistraionServices>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final instance = Firestore.instance.collection("Student");
  final key = GlobalKey<FormState>();

  registration(BuildContext context) async {
    if (key.currentState.validate()) {
      cirularAlertDialog(context);
      _registraionServices
          .registration(nameController.text, emailController.text,
              passwordController.text)
          .then((value) {
        Navigator.pop(context);
        if (value != "") {
          SPHelper.setString("ID", value);
          SPHelper.setString("email", emailController.text);
          SPHelper.setString("name", nameController.text);
          Navigator.pushReplacementNamed(context, 'main');
          showFlutterToast("You have registered successfully.");
        } else if (value == null) {
          showFlutterToast("Something went wrong");
        } else {
          showFlutterToast("Something went wrong");
        }
      });
    }
  }
}
