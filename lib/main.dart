import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/UI/screen/shared_pref.dart';
import 'package:qr_app/core/provider/auth_provider.dart';
import 'package:qr_app/core/provider/message_provider.dart';
import 'package:qr_app/locator.dart';
import 'package:qr_app/core/provider/registraion_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'UI/routes.dart';
import 'core/provider/base_provider.dart';

// import 'package:qr_app/ui/screen/welcome_screen.dart';

// import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    SharedPreferences.getInstance().then((SharedPreferences sp) {
      SPHelper.setPref(sp);
      setpLocator();
      runApp(MyApp());
    });
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => BaseProvider()),
        ChangeNotifierProvider(builder: (_) => RegistrationProvider()),
        ChangeNotifierProvider(builder: (_) => AuthProvider()),
        ChangeNotifierProvider(builder: (_) => MessageProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        // theme: ThemeData.light(),
        // home: MainScreen(),
        debugShowCheckedModeBanner: false,
        initialRoute: initialRoute,
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
