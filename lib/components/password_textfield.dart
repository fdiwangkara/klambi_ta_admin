import 'package:flutter/material.dart';
import 'package:klambi_admin/helper/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'form_error.dart';

class PasswordTextfield extends StatefulWidget {
  const PasswordTextfield({super.key});

  @override
  _PasswordTextfieldState createState() => _PasswordTextfieldState();
}

class _PasswordTextfieldState extends State<PasswordTextfield> {
  bool _obscureText = true;
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? password;
  final List<String?> errors = [];

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _passwordController,
            obscureText: _obscureText,
            cursorColor: kSecondaryColor,
            onChanged: (value) {
              if (value.isNotEmpty) {
                setState(() {
                  errors.remove(kPassNullError);
                  errors.remove(kShortPassError);
                });
              } else if (value.length >= 8) {
                setState(() {
                  errors.remove(kShortPassError);
                });
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                setState(() {
                  errors.add(kPassNullError);
                });
                return "";
              } else if (value.length < 8) {
                setState(() {
                  errors.add(kShortPassError);
                });
                return "";
              }
              return null;
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: kBackgroundColor,
              contentPadding: const EdgeInsets.all(16),
              border: searchOutlineInputBorder,
              enabledBorder: searchOutlineInputBorder,
              focusedBorder: focusedOutlineInputBorder,
              hintText: "Example123",
              hintStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: kDarkGreyColor,
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 20, right: 15),
                child: SvgPicture.asset('assets/icons/lock_icon.svg'),
              ),
              suffixIcon: IconButton(
                icon: _obscureText
                    ? SvgPicture.asset('assets/icons/eye_off_icon.svg')
                    : SvgPicture.asset('assets/icons/eye_on_icon.svg'),
                onPressed: _togglePasswordVisibility,
              ),
            ),
          ),
          FormError(errors: errors),
          const SizedBox(height: 16),
        ],
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

const kPassNullError = "Please enter your password";
const kShortPassError = "Password is too short";
