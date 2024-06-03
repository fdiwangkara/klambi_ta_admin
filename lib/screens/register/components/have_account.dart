import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_admin/helper/constants.dart';

class HaveAccount extends StatelessWidget {
  const HaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Sudah Ada Akun Admin?",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: kBlackColor,
          ),
        ),
        SizedBox(width: 5),
        InkWell(
          onTap: (){
            Get.offNamed('/login');
          },
          child: Text(
            "Masuk Sebagai Admin",
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
