import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_admin/screens/register/components/have_account.dart';
import 'package:klambi_admin/screens/register/register_controller.dart';

import '../../helper/constants.dart';
import 'components/regsiter_form.dart';

class RegisterScreenView extends GetView<RegisterController> {
  const RegisterScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RegisterController());
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                'assets/images/login/splash_image.png',
                width: 100,
                height: 150,
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Center(
                      child: Image.asset(
                        'assets/images/logo_klambi.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Text(
                        'Daftar Admin',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: kBlackColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    RegisterForm(),
                    SizedBox(height: 10),
                    HaveAccount(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
