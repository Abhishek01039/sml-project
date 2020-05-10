import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/core/provider/auth_provider.dart';

import 'package:qr_app/ui/screen/login_screen.dart';
import 'package:qr_app/UI/shared/style.dart';
import 'package:qr_app/ui/screen/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:qr_app/ui/screen/widgets/size_config.dart';
import 'package:qr_app/ui/screen/signup_screen.dart';

class WelcomeScreenState extends StatelessWidget {
  static final routeName = 'welcome';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Provider.of<AuthProvider>(context).busy
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: Text(
                      'ESTSB',
                      style: Style.appNameTextStyle,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      PrimaryButton(
                        onTap: () => Navigator.of(context)
                            .pushNamed(LoginScreen.routeName),
                        child: Text(
                          'Sign In',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 21),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeHorizontal * 13,
                      ),
                      PrimaryButton(
                        onTap: () => Navigator.of(context)
                            .pushNamed(SignUpScreen.routeName),
                        child: Text(
                          'Sign Up',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 21),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
