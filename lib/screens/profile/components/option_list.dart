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
      Icons.chat,
      Icons.logout,
    ];

    final List<String> optionTitles = [
      "Edit Profile",
      "Chat Dengan Customer",
      "Logout",
    ];

    final List<Color> iconColors = [
      kPrimaryColor,
      kSecondaryColor,
      kDangerColor,
    ];

    final List<String> optionRoutes = [
      '/editProfile',
      '/chat',
      // Remove the route for logout since we handle it separately
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(optionTitles.length, (index) {
        return GestureDetector(
          onTap: () {
            if (index == 2) {
              // Show confirmation dialog for logout
              _showLogoutDialog(context);
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
                Text(
                  optionTitles[index],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevents closing dialog by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Konfirmasi Logout"),
          content: const Text("Yakin ingin keluar?"),
          actions: <Widget>[
            TextButton(
              child: const Text("Tidak"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: const Text("Ya"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                final ProfileController profileController = Get.find<ProfileController>();
                profileController.logout();
              },
            ),
          ],
        );
      },
    );
  }
}
