import 'package:flutter/material.dart';
import 'package:klambi_admin/helper/constants.dart';
import 'package:klambi_admin/screens/profile/components/text_profile.dart';
import 'package:get/get.dart';
import 'package:klambi_admin/screens/profile/edit_profile/edit_profile_controller.dart';
import 'package:klambi_admin/screens/profile/profile_controller.dart';
import 'package:shimmer/shimmer.dart';  // Import the shimmer package

class AccountInfo extends StatelessWidget {
  const AccountInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final editController = Get.put(EditProfileController());
    final profileController = Get.put(ProfileController());
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Obx(() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Profile photo with shimmer effect
            ClipOval(
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: Container(
                  height: 100,
                  width: 100,
                  key: ValueKey<String>(
                      editController.imageUrl.value ?? ''),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: editController.pickedImage.value !=
                          null
                          ? FileImage(
                          editController.pickedImage.value!)
                          : editController.imageUrl.value !=
                          null
                          ? NetworkImage(editController
                          .imageUrl.value!)
                          : AssetImage(
                          "assets/images/dashboard/default_profile.png")
                      as ImageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            usernameText(username: editController.userProfile.value.name),
            // Email
            emailText(email: profileController.email.value),
          ],
        ),
      );
    });
  }
}
