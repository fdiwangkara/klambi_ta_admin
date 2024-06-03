import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_admin/components/custom_icon.dart';
import '../../../components/form_error.dart';
import '../../../helper/constants.dart';
import '../../../helper/keyboard.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;
  final List<String?> errors = [];
  bool _obscureText = true; // State variable to manage password visibility

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              height: 70, // Increase the height to accommodate the error text
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                onSaved: (newValue) => email = newValue,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    removeError(error: kEmailNullError);
                  } else if (emailValidatorRegExp.hasMatch(value)) {
                    removeError(error: kInvalidEmailError);
                  }
                  return;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    addError(error: kEmailNullError);
                    return "";
                  } else if (!emailValidatorRegExp.hasMatch(value)) {
                    addError(error: kInvalidEmailError);
                    return "";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(16),
                  hintText: "Masukkan Email",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: kDarkGreyColor,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  prefixIcon: CustomIcon(svgIcon: "assets/icons/email_icon.svg", color: kDarkGreyColor,),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 70, // Increase the height to accommodate the error text
              child: TextFormField(
                obscureText: _obscureText,
                onSaved: (newValue) => password = newValue,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    removeError(error: kPassNullError);
                  } else if (value.length >= 8) {
                    removeError(error: kShortPassError);
                  }
                  return;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    addError(error: kPassNullError);
                    return "";
                  } else if (value.length < 8) {
                    addError(error: kShortPassError);
                    return "";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(16),
                  hintText: "Masukkan Password",
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: kDarkGreyColor,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  prefixIcon: const CustomIcon(svgIcon: "assets/icons/lock_icon.svg", color: kDarkGreyColor,),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: CustomIcon(
                      svgIcon: _obscureText
                          ? "assets/icons/eye_off_icon.svg"
                          : "assets/icons/eye_on_icon.svg",
                      color: kDarkGreyColor,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: remember,
                  activeColor: kSecondaryColor,
                  onChanged: (value) {
                    setState(() {
                      remember = value;
                    });
                  },
                ),
                const Text("Ingat Saya"),
                const Spacer(),
                GestureDetector(
                  onTap: () => () {},
                  child: const Text(
                    "Lupa password",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
            FormError(errors: errors),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  KeyboardUtil.hideKeyboard(context);
                  Get.offNamed("/navbar");
                }
              },
              child: const Text(
                "Masuk",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: kBlackColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
