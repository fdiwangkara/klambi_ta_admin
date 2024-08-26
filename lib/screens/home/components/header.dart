import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_admin/helper/constants.dart';
import 'package:klambi_admin/screens/home/components/profile_menu.dart';
import 'package:shimmer/shimmer.dart'; // Import the shimmer package

import '../../profile/edit_profile/edit_profile_controller.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final editController = Get.put(EditProfileController());
    return Padding(
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
              Get.offNamed('/profile'); // Replace '/profile' with the actual route name you want to navigate to
            },
            child: CircleAvatar(
              radius: 20, // Set the radius to 20
              child: ClipOval(
                child: editController.pickedImage.value != null
                    ? Image.file(
                  editController.pickedImage.value!,
                  fit: BoxFit.cover,
                  width: 40,
                  height: 40,
                )
                    : editController.imageUrl.value != null
                    ? Image.network(
                  editController.imageUrl.value!,
                  fit: BoxFit.cover,
                  width: 40,
                  height: 40,
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: 40,
                        height: 40,
                        color: Colors.grey[300],
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: 40,
                        height: 40,
                        color: Colors.grey[300],
                      ),
                    );
                  },
                )
                    : Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: 40,
                    height: 40,
                    color: Colors.grey[300],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
