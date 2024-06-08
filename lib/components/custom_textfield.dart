import 'package:flutter/material.dart';
import 'package:klambi_admin/components/custom_icon.dart';
import 'package:klambi_admin/helper/constants.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? svgIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final bool hasSuffixIcon;
  final Function()? onSuffixIconTap;
  final int? maxLines; // Add this property

  const CustomTextFormField({
    Key? key,
    this.hintText,
    this.svgIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.hasSuffixIcon = false,
    this.onSuffixIconTap,
    this.maxLines = 1, // Default value is 1
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator,
      maxLines: maxLines, // Use the maxLines property
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: kDarkGreyColor,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: svgIcon != null ? CustomIcon(svgIcon: svgIcon!, color: kDarkGreyColor) : null,
        suffixIcon: hasSuffixIcon
            ? GestureDetector(
          onTap: onSuffixIconTap,
          child: CustomIcon(
            svgIcon: obscureText ? "assets/icons/eye_off_icon.svg" : "assets/icons/eye_on_icon.svg",
            color: kDarkGreyColor,
          ),
        )
            : null,
      ),
    );
  }
}
