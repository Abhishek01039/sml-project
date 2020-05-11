import 'package:qr_app/core/models/student.dart';
import 'package:qr_app/core/provider/base_provider.dart';
import 'package:qr_app/core/services/profile_service.dart';
import 'package:qr_app/locator.dart';

class ProfileProvider extends BaseProvider {
  ProfileService profileService = locator<ProfileService>();
  Student student = locator<Student>();
  // ProfileProvider() {
  //   profile();
  // }
  profile() async {
    student = await profileService.profile();
    print(student);
  }
}
