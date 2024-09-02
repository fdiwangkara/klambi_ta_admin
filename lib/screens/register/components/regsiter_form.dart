import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_admin/components/form_error.dart';
import 'package:klambi_admin/components/custom_textfield.dart';
import '../../../helper/constants.dart';
import '../../../helper/keyboard.dart';
import '../register_controller.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  String? namaAdmin;
  String? email;
  String? password;
  String? confirmPassword;
  bool? remember = false;
  final List<String?> errors = [];
  bool _obscureText = true; // State variable to manage password visibility

  // Controllers for email and password fields
  final registerController = Get.put(RegisterController());
  final TextEditingController ctrUsername = TextEditingController();
  final TextEditingController ctrPassword = TextEditingController();
  final TextEditingController ctrConfirmPass = TextEditingController();
  final TextEditingController ctrEmail = TextEditingController();

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
  void dispose() {
    // Dispose the controllers when the widget is disposed
    ctrEmail.dispose();
    ctrPassword.dispose();
    ctrConfirmPass.dispose();
    ctrUsername.dispose();
    super.dispose();
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
                hintText: "Masukkan Nama Admin",
                svgIcon: "assets/icons/person_icon.svg",
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
                controller: ctrEmail, // Add the email controller here
                hintText: "Masukkan Email",
                svgIcon: "assets/icons/email_icon.svg",
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
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 70, // Increase the height to accommodate the error text
              child: CustomTextFormField(
                controller: ctrPassword, // Add the password controller here
                hintText: "Masukkan Password",
                svgIcon: "assets/icons/lock_icon.svg",
                obscureText: _obscureText,
                onSaved: (newValue) => password = newValue,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    removeError(error: kPassNullError);
                  } else if (value.length >= 8) {
                    removeError(error: kShortPassError);
                  }
                  password = value; // Update the password value
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
            const SizedBox(height: 10),
            Container(
              height: 70,
              child: CustomTextFormField(
                hintText: "Konfirmasi Password",
                svgIcon: "assets/icons/lock_icon.svg",
                obscureText: true, // Always obscure text for confirmation field
                controller: ctrConfirmPass,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    removeError(error: kConfirmPassError);
                  } else if (value == password) {
                    removeError(error: kMatchPassError);
                  }
                  confirmPassword = value;
                  return;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    addError(error: kConfirmPassError);
                    return "";
                  } else if (value != password) {
                    addError(error: kMatchPassError);
                    return "";
                  }
                  return null;
                },
                hasSuffixIcon: false, // No visibility toggle for confirmation field
              ),
            ),
            FormError(errors: errors),
            const SizedBox(height: 20),
            Obx(() => ElevatedButton(
              onPressed: registerController.isLoading.value
                  ? null
                  : () {
                if (_formKey.currentState!.validate()) {
                  registerController.registerAction(
                    ctrUsername.text,
                    ctrEmail.text,
                    ctrPassword.text,
                    ctrConfirmPass.text,
                  );
                }
              },
              child: registerController.isLoading.value
                  ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 3.0,
                  color: kWhiteColor,
                ),
              )
                  : const Text(
                "Daftar",
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
