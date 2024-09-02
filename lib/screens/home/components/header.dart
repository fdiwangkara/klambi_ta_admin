import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_admin/helper/constants.dart';
import 'package:klambi_admin/screens/home/components/profile_menu.dart';

import '../../profile/edit_profile/edit_profile_controller.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  Future<void> _refreshProfile(EditProfileController controller) async {
    await controller.loadUserProfile();  // Refresh user profile data
  }

  @override
  Widget build(BuildContext context) {
    final editController = Get.put(EditProfileController());
    return RefreshIndicator(
      onRefresh: () => _refreshProfile(editController),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Selamat Siang Admin",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: kBlackColor,
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Get.offNamed('/profile');  // Replace with the actual route name
              },
              child: ClipOval(
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  child: Container(
                    height: 50,
                    width: 50,
                    key: ValueKey<String>(editController.imageUrl.value ?? ''),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: editController.pickedImage.value != null
                            ? FileImage(editController.pickedImage.value!)
                            : editController.imageUrl.value != null
                            ? NetworkImage(editController.imageUrl.value!)
                            : AssetImage("assets/images/dashboard/default_profile.png") as ImageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
