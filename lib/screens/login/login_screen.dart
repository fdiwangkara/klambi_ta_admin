import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_admin/helper/constants.dart';
import 'package:klambi_admin/screens/login/components/login_form.dart';
import 'package:klambi_admin/screens/login/components/no_account.dart';
import 'package:klambi_admin/screens/login/login_controller.dart';

class LoginScreenView extends GetView<LoginController> {
  const LoginScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    Get.put(LoginController());
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SizedBox(
          height: height,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: Image.asset(
                  'assets/images/login/splash_image.png',
                  width: 100,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Image.asset(
                  'assets/images/login/splash2_image.png',
                  width: 150,
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: height / 6),
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
                        'Masuk Admin',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: kBlackColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    LoginForm(),
                    SizedBox(height: 10),
                    NoAccount(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
