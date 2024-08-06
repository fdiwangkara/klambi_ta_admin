import 'package:flutter/material.dart';
import 'package:klambi_admin/helper/constants.dart';

class emailText extends StatelessWidget {
  final String email;

  const emailText({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Text(
      email,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: "General Sans",
        color: kDarkGreyColor,
      ),
    );
  }
}

class usernameText extends StatelessWidget {
  final String username;

  const usernameText({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Text(
      username,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        fontFamily: "General Sans",
        color: kBlackColor,
      ),
    );
  }
}
