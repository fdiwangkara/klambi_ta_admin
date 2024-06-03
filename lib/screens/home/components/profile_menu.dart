import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../helper/constants.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: kLightGreyColor,
        ),
      ),
      onSelected: (int result) {
        switch (result) {
          case 0:
            // Navigate to settings
            print('Settings selected');
            break;
          case 1:
            // Perform logout
            Get.offAllNamed('/login');
            break;
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
        PopupMenuItem<int>(
          value: 0,
          child: Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Text('Settings'),
            ),
          ),
        ),
        PopupMenuItem<int>(
          enabled: false,
          child: Divider(
            color: kLightGreyColor,
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
        ),
        PopupMenuItem<int>(
          value: 1,
          child: Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Text(
                'Logout',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: kDangerColor,
                ),
              ),
            ),
          ),
        ),
      ],
      color: kWhiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(
          color: kLightGreyColor,
          width: 1,
        ),
      ),
      offset: Offset(0, 45),
      // Adjust this value if needed
      padding: EdgeInsets.zero,
    );
  }
}
