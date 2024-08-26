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
            editController.pickedImage.value != null
                ? CircleAvatar(
              radius: 50,
              backgroundImage: FileImage(editController.pickedImage.value!),
            )
                : CircleAvatar(
              radius: 50,
              child: ClipOval(
                child: editController.imageUrl.value != null
                    ? Image.network(
                  editController.imageUrl.value!,
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.grey[300],
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.grey[300],
                      ),
                    );
                  },
                )
                    : Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.grey[300],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Account name with shimmer effect
            editController.adminProfile.value.name.isNotEmpty
                ? usernameText(username: editController.adminProfile.value.name)
                : Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: 100,
                height: 20,
                color: Colors.grey[300],
              ),
            ),
            // Email
            emailText(email: profileController.email.value),
          ],
        ),
      );
    });
  }
}
