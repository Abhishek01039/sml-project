import 'package:flutter/widgets.dart';
import 'package:qr_app/UI/screen/shared_pref.dart';
import 'package:qr_app/UI/shared/commonUtility.dart';
import 'package:qr_app/core/models/student.dart';
import 'package:qr_app/core/provider/base_provider.dart';
import 'package:qr_app/core/services/profile_service.dart';
import 'package:qr_app/locator.dart';

class ProfileProvider extends BaseProvider {
  ProfileService profileService = locator<ProfileService>();
  Student student = locator<Student>();
  final key = GlobalKey<FormState>();
  TextEditingController changeNameController = TextEditingController();
  // ProfileProvider() {
  //   profile();
  // }
  profile() async {
    student = await profileService.profile();
    // print(student.name);
    return student;
  }

  updateStudentName(BuildContext context) async {
    if (key.currentState.validate()) {
      cirularAlertDialog(context);
      bool value = await profileService.updateStudentName(
          SPHelper.getString("ID"), changeNameController.text);
      Navigator.pop(context);
      // print(value);
      if (value) {
        changeNameController.clear();
        Navigator.pop(context);
        showFlutterToast("Name has been changed.");
      } else if (value == null) {
        showFlutterToast("Something went wrong");
      } else {
        showFlutterToast("Something went wrong");
      }
    }
  }
}
