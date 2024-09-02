import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_admin/helper/constants.dart';
import 'package:klambi_admin/screens/profile/components/account_info.dart';
import 'package:klambi_admin/screens/profile/components/option_list.dart';
import 'package:klambi_admin/screens/profile/profile_controller.dart';

class ProfileScreenView extends GetView<ProfileController> {
  const ProfileScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        surfaceTintColor: kBackgroundColor,
        leading: IconButton(
            onPressed: () {
              Get.offAndToNamed("/navbar", arguments: 0);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text(
          "Admin Profile",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: kBlackColor,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Column(
          children: [
            AccountInfo(),
            SizedBox(height: 25),
            OptionList(),
          ],
        ),
      ),
    );
  }
}
