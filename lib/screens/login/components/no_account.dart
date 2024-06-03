import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_admin/helper/constants.dart';

class NoAccount extends StatelessWidget {
  const NoAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Tidak ada Akun Admin?",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: kBlackColor,
          ),
        ),
        SizedBox(width: 5),
        InkWell(
          onTap: (){
            Get.offNamed('/register');
          },
          child: Text(
            "Daftar Admin",
            style: TextStyle(
              fontSize: 12,
              color: kSecondaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }
}
