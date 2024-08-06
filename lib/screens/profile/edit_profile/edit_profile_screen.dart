import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_admin/screens/profile/edit_profile/components/photo_edit.dart';
import 'package:klambi_admin/screens/profile/edit_profile/components/textfields.dart';
import 'package:klambi_admin/screens/profile/edit_profile/edit_profile_controller.dart';

import '../../../helper/constants.dart';

class EditProfileScreenView extends GetView<EditProfileController> {
  const EditProfileScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditProfileController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        leading: IconButton(
            onPressed: () {
              Get.offAndToNamed("/profile");
            },
            icon: Icon(Icons.arrow_back)),
        title: Text(
          "Edit Profile",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: kBlackColor  ,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Column(
          children: [
            PhotoEdit(),
            SizedBox(height: 50),
            Textfields(),
          ],
        ),
      ),
    );
  }
}
