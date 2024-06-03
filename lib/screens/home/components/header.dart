import 'package:flutter/material.dart';
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
          ProfileMenu(),
        ],
      ),
    );
  }
}
