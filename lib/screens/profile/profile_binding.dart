import 'package:get/get.dart';
import 'package:klambi_admin/screens/profile/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
          () => ProfileController(),
    );
  }
}