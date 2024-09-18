import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_admin/components/form_error.dart';
import 'package:klambi_admin/components/custom_textfield.dart';
import '../../../helper/constants.dart';
import '../../../helper/keyboard.dart';
import '../login_controller.dart';

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
  final loginController = Get.put(LoginController());
  final TextEditingController ctrUsername = TextEditingController();
  final TextEditingController ctrPassword = TextEditingController();

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
              child: CustomTextFormField(
                hintText: "Masukkan Username",
                svgIcon: "assets/icons/person_icon.svg",
                keyboardType: TextInputType.text,
                controller: ctrUsername,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    removeError(error: kNamelNullError);
                  }
                  return;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    addError(error: kNamelNullError);
                    return "";
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 70, // Increase the height to accommodate the error text
              child: CustomTextFormField(
                hintText: "Masukkan Password",
                svgIcon: "assets/icons/lock_icon.svg",
                obscureText: _obscureText,
                controller: ctrPassword,
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
                hasSuffixIcon: true,
                onSuffixIconTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
            ),
            FormError(errors: errors),
            const SizedBox(height: 25),
            Obx(() => ElevatedButton(
              onPressed: loginController.isLoading.value
                  ? null
                  : () {
                if (_formKey.currentState!.validate()) {
                  loginController.loginAction(
                    ctrUsername.text,
                    ctrPassword.text,
                  );
                }
              },
              child: loginController.isLoading.value
                  ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 3.0,
                  color: kWhiteColor,
                ),
              )
                  : const Text(
                "Masuk",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: kBlackColor,
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
