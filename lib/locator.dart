import 'package:get_it/get_it.dart';
import 'package:qr_app/UI/screen/shared_pref.dart';
import 'package:qr_app/core/models/student.dart';
import 'package:qr_app/core/provider/auth_provider.dart';
import 'package:qr_app/core/provider/message_provider.dart';
import 'package:qr_app/core/services/api.dart';
import 'package:qr_app/core/services/auth_service.dart';
import 'package:qr_app/core/services/base_api.dart';
import 'package:qr_app/core/services/studentRegistration.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/services/message_services.dart';
import 'core/provider/base_provider.dart';

GetIt locator = GetIt.instance;
void setpLocator() {
  locator.registerFactory(() => AuthProvider());
  locator.registerFactory(() => BaseProvider());
  locator.registerFactory(() => BaseApi());
  locator.registerFactory(() => AuthService());
  locator.registerFactory(() => Api());
  locator.registerFactory(() => Student());
  locator.registerFactory(() => SPHelper());
  locator.registerFactory(() => MessageProvider());
  locator.registerFactory(() => MessageServices());
  locator.registerFactory(() => RegistraionServices());
  locator.registerFactory(() async => await SharedPreferences.getInstance());
}
