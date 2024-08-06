import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_admin/helper/constants.dart';
import 'package:klambi_admin/screens/home/components/profile_menu.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
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
              radius: 20, // Radius of 20 gives a diameter of 40
              backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Dummy image URL
            ),
          ),
        ],
      ),
    );
  }
}
