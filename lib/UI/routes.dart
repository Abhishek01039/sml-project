// import 'package:qr_app/ui/screen/main_screen.dart';
import 'package:qr_app/UI/screen/home_screen.dart';
import 'package:qr_app/UI/screen/profile.dart';
import 'package:qr_app/UI/screen/splash_screen.dart';
import 'package:qr_app/UI/screen/welcome_screen.dart';
import 'package:qr_app/ui/screen/scan_screen.dart';
import 'package:qr_app/ui/screen/signup_screen.dart';

import 'package:qr_app/ui/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:qr_app/UI/screen/main_screen.dart';

const String initialRoute = "splashScreen";

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'splashScreen':
        return MaterialPageRoute(builder: (_) => MySpalshScreen());
      case 'main':
        return MaterialPageRoute(builder: (_) => MainScreen());
      case 'welcome':
        return MaterialPageRoute(builder: (_) => WelcomeScreenState());
      case 'login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case 'sign-up':
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case 'scanScreen':
        return MaterialPageRoute(builder: (_) => ScanScreen());
      case 'profile':
        return MaterialPageRoute(builder: (_) => Profile());
      case 'home':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
