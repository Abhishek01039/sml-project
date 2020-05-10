import 'package:qr_app/core/provider/auth_provider.dart';
import 'package:qr_app/locator.dart';


import 'package:provider/provider.dart';

List<SingleChildCloneableWidget> provider = [
  ChangeNotifierProvider(
    builder: (context) => locator<AuthProvider>(),
  ),
];
