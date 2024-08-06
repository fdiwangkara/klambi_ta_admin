import 'package:flutter/material.dart';
import 'package:klambi_admin/helper/constants.dart';
import 'package:klambi_admin/screens/profile/components/text_profile.dart';
import 'package:get/get.dart';
import 'package:klambi_admin/screens/profile/profile_controller.dart';

class AccountInfo extends StatelessWidget {
  const AccountInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(ProfileController());
    return Obx(() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Profile photo
            CircleAvatar(
              radius: 40, // Adjusted radius to make it smaller
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            const SizedBox(height: 10),
            // Account name
            usernameText(username: profileController.name.value),
            // Email
            emailText(email: profileController.email.value),
          ],
        ),
      );
    });
  }
}
