import 'package:flutter/material.dart';
import 'package:qr_app/UI/shared/commonUtility.dart';
import 'package:qr_app/UI/shared/style.dart';
import 'package:qr_app/core/provider/auth_provider.dart';
import 'package:qr_app/ui/screen/widgets/primary_button.dart';
import 'package:qr_app/ui/screen/widgets/size_config.dart';

import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static final routeName = 'login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Consumer<AuthProvider>(
      builder: (context, authProvider, _) {
        return Scaffold(
          key: authProvider.scafoldkey,
          body: ListView(
            children: <Widget>[
              SizedBox(
                height: SizeConfig.screenHeight * 0.1,
              ),
              Center(
                child: Text(
                  'Sign In',
                  style: Style.appNameTextStyle,
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.1,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockSizeHorizontal * 4),
                child: Form(
                  key: authProvider.key,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: SizeConfig.blockSizeVertical * 2),
                      TextFormField(
                        controller: authProvider.email,
                        decoration: Style.inputDecoration('Email'),
                        validator: (v) {
                          if (v.isEmpty) {
                            return 'input require';
                          } else if (!isEmail(v)) {
                            return 'email invalid';
                          } else
                            return null;
                        },
                      ),
                      SizedBox(height: SizeConfig.blockSizeVertical * 2),
                      TextFormField(
                        controller: authProvider.password,
                        obscureText: true,
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
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: PrimaryButton(
              onTap: () async {
                // if (_key.currentState.validate()) {
                //   _key.currentState.save();
                //   print('is validate');
                //   var login = await authProvider.login(
                //       authProvider.email.text, authProvider.password.text);
                //   if (login) {
                //     Navigator.of(context)
                //         .pushReplacementNamed(MainScreen.routeName);
                //   } else
                //     _scafoldkey.currentState.showSnackBar(
                //       SnackBar(
                //         content:
                //             Text(Provider.of<AuthProvider>(context).message),
                //       ),
                //     );
                // } else
                //   print('is not validate');
                authProvider.login(context);
              },
              child: Text(
                'Login',
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
