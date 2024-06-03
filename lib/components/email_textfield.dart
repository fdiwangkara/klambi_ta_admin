import 'package:flutter/material.dart';
import 'package:klambi_admin/helper/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmailTextfield extends StatelessWidget {
  const EmailTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Form(
        child: TextFormField(
          cursorColor: kSecondaryColor, // Set cursor color to kSecondaryColor
          decoration: InputDecoration(
            filled: true,
            fillColor: kBackgroundColor,
            contentPadding: const EdgeInsets.all(16),
            border: searchOutlineInputBorder,
            enabledBorder: searchOutlineInputBorder,
            focusedBorder: focusedOutlineInputBorder,
            hintText: "Example@test.com",
            hintStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: kDarkGreyColor,
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 20, right: 15),
              child: SvgPicture.asset('assets/icons/email_icon.svg'),
            ),
          ),
        ),
      ),
    );
  }
}

const searchOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(10)),
  borderSide: BorderSide(
    color: kLightGreyColor,
    width: 1,
  ),
);

const focusedOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(10)),
  borderSide: BorderSide(
    color: kPrimaryColor, // Set focused border color to kPrimaryColor
    width: 1,
  ),
);
