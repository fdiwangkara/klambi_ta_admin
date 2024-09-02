import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_admin/helper/constants.dart';

import '../profile_controller.dart'; // Import the controller

class OptionList extends StatelessWidget {
  const OptionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Icons for the options
    final List<IconData> optionIcons = [
      Icons.edit,
      Icons.attach_money,
      Icons.logout,
    ];

    final List<String> optionTitles = [
      "Edit Profile",
      "Transaksi Masuk",
      "Logout",
    ];

    final List<Color> iconColors = [
      kPrimaryColor,
      kSecondaryColor,
      kDangerColor,
    ];

    final List<String> optionRoutes = [
      '/editProfile',
      '/transaction',
    ];

    final ProfileController profileController = Get.find<ProfileController>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(optionTitles.length, (index) {
        return GestureDetector(
          onTap: () {
            if (index == 2) {
              // Show confirmation dialog for logout
              _showConfirmationDialog(context, 'Konfirmasi Logout', 'Apakah anda yakin ingin Logout?', ()=> profileController.logout());
            } else {
              // Handle other options
              Get.offNamed(optionRoutes[index]);
            }
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.of(context).size.width * 0.9,
            height: 50,
            decoration: BoxDecoration(
              color: kSuperLightGreyColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(optionIcons[index], color: iconColors[index]),
                const SizedBox(width: 20),
                Expanded( // Ensures text takes available space
                  child: Text(
                    optionTitles[index],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Icon(Icons.arrow_forward_ios, color: kDarkGreyColor, size: 16,), // Right arrow icon
              ],
            ),
          ),
        );
      }),
    );
  }

  void _showConfirmationDialog(BuildContext context, String title, String content, VoidCallback onConfirm) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        backgroundColor: kWhiteColor,
        surfaceTintColor: kWhiteColor,
        shadowColor: kBlackColor,
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(
              'Batal',
              style: TextStyle(color: kDangerColor),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              onConfirm();
            },
            child: const Text(
              'Konfirmasi',
              style: TextStyle(color: kSecondaryColor),
            ),
          ),
        ],
      );
    },
    );
  }
}
