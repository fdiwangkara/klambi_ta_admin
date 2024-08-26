import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_admin/models/login_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'components/toast_message.dart';

class LoginController extends GetxController {
  late final SharedPreferences prefs;
  RxBool isLoading = false.obs;
  RxString message = "".obs;
  String? token = "";

  @override
  void onInit() {
    super.onInit();
    setPreference();
  }

  Future<void> setPreference() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> loginAction(String email, String password) async {
    print('LOGIN...');

    if (email.isEmpty || password.isEmpty) {
      message.value = "Field Tidak Boleh Kosong";
      Get.snackbar("Oops!", message.value);
      return;
    }
    try {
      isLoading.value = true;

      final url = Uri.parse("https://klambi.ta.rplrus.com/api/admin/login");
      final body = {"email": email, "password": password};

      final response = await http.post(
        Uri.parse("https://klambi.ta.rplrus.com/api/admin/login"),
        body: body,
      );
      print(response.body.toString());

      if (response.statusCode == 200) {
        LoginAdmin loginResponseModel = loginAdminFromJson(response.body);
        loginAdminFromJson(response.body);

        await prefs.setString("username", loginResponseModel.data.name);
        await prefs.setString("email", loginResponseModel.data.email);
        await prefs.setString("token", loginResponseModel.data.token);

        String? savedToken = await prefs.getString("token");
        print("Token yang disimpan: $savedToken");
        Get.snackbar("Yeay!", "Berhasil login");
        Get.offAllNamed('/navbar'); // Navigate to the main screen
        await prefs.getString("username");
        await prefs.getString("email");
        await prefs.getString("token");

        Get.offAllNamed('/navbar'); // Navigate to the main screen
      } else {
        message.value = "Username atau Password salah : ${response.statusCode}";
        Get.snackbar("Gagal Login!", message.value);
      }
    } catch (e) {
      message.value = "An error occurred";
      Get.snackbar("Uh Oh!", message.value);
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}
