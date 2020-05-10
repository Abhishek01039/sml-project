import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/core/provider/registraion_provider.dart';
import 'package:qr_app/ui/screen/widgets/size_config.dart';
import 'package:qr_app/ui/screen/widgets/primary_button.dart';
import 'package:qr_app/UI/shared/style.dart';

class SignUpScreen extends StatefulWidget {
  static final routeName = 'sign-up';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Consumer<RegistrationProvider>(
      builder: (context, registrationProvider, _) {
        return Scaffold(
          body: ListView(
            children: <Widget>[
              SizedBox(
                height: SizeConfig.screenHeight * 0.1,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockSizeHorizontal * 4),
                child: Form(
                  key: registrationProvider.key,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      TextFormField(
                        controller: registrationProvider.nameController,
                        decoration: Style.inputDecoration('Full Name'),
                        validator: (v) {
                          if (v.isEmpty) {
                            return 'input require';
                          } else
                            return null;
                        },
                      ),
                      // SizedBox(height: SizeConfig.blockSizeVertical * 2),
                      // TextFormField(
                      //   obscureText: true,
                      //   controller: registrationProvider.emailConroller,

                      //   decoration: Style.inputDecoration('Email'),
                      //   validator: (v) {
                      //     if (v.isEmpty) {
                      //       return 'input email';
                      //     } else
                      //       return null;
                      //   },
                      // ),
                      SizedBox(height: SizeConfig.blockSizeVertical * 2),
                      TextFormField(
                        controller: registrationProvider.emailController,
                        decoration: Style.inputDecoration('Email'),
                        validator: (v) {
                          if (v.isEmpty) {
                            return 'input require';
                          // } else if (!registrationProvider.isEmail(v)) {
                          //   return 'email invalide';
                          } else
                            return null;
                        },
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical * 2),
                      TextFormField(
                        obscureText: true,
                        controller: registrationProvider.passwordController,
                        decoration: Style.inputDecoration('Password'),
                        validator: (v) {
                          if (v.isEmpty) {
                            return 'input require';
                          } else if (v.trim().length < 6) {
                            return 'this password is too short';
                          } else
                            return null;
                        },
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical * 2),
                      TextFormField(
                        obscureText: true,
                        controller:
                            registrationProvider.confirmPasswordController,
                        decoration:
                            Style.inputDecoration('Password Confirmation'),
                        validator: (v) {
                          if (v.isEmpty) {
                            return 'input require';
                          } else if (v.trim() !=
                              registrationProvider.passwordController.text
                                  .trim()) {
                            return ('passwords not match');
                          } else
                            return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: PrimaryButton(
              onTap: () {
                // if (_key.currentState.validate()) {
                //   print('is validate');

                // } else
                //   print('is not validate');
                registrationProvider.registration(context);
              },
              child: Text(
                'Save',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 21),
              ),
            ),
          ),
        );
      },
    );
  }
}
