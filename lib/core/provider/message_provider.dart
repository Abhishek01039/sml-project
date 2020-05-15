import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'package:qr_app/UI/shared/commonUtility.dart';
import 'package:qr_app/core/provider/base_provider.dart';
import 'package:qr_app/core/services/message_services.dart';

import 'package:qr_app/locator.dart';

class MessageProvider extends BaseProvider {
  TextEditingController messageController = TextEditingController();
  MessageServices messageServices = locator<MessageServices>();
  final instance = Firestore.instance.collection("Student");
  final key = GlobalKey<FormState>();

  sendMessage(BuildContext context) async {
    if (key.currentState.validate()) {
      cirularAlertDialog(context);
      bool value = await messageServices.message(messageController.text);
      Navigator.pop(context);
      print(value);
      if (value) {
        Navigator.pushReplacementNamed(context, 'main');
        showFlutterToast("Message has been sent.");
      } else if (value == null) {
        showFlutterToast("Something went wrong");
      } else {
        showFlutterToast("Something went wrong");
      }
    }
  }
}
