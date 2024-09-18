import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../login/components/toast_message.dart';

class RegisterController extends GetxController {
  RxBool isLoading = false.obs;
  RxString message = "".obs;

  Future<void> registerAction(String username, String email, String password,
      String confirmPassword) async {
    try {
      isLoading.value = true;
      if (username.isEmpty ||
          password.isEmpty ||
          confirmPassword.isEmpty) {
        message.value = "Fields Tidak Boleh Kosong";

        isLoading.value = false;
        Get.snackbar("Oops!", message.value);
        return;
      }
      if (password != confirmPassword) {
        message.value = "Password dan Konfirmasi password Tidak Sama";

        isLoading.value = false;
        Get.snackbar("Oops!", message.value);
        return;
      }

      final url = Uri.parse("https://klambi.ta.rplrus.com/api/admin/register");
      final body = {
        "username": username,
        "password": password,
        "password_confirmation": confirmPassword,
      };

      print(body);
      final response = await http.post(url, body: body);
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        // final responseData = registerResponseModelFromJson(response.body);
        // message.value = responseData.message;

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('username', username);
        print(response.statusCode);

        isLoading.value = false;
        Get.snackbar("Selamat", "Registrasi Berhasil!");
        Get.offAllNamed('/login'); // Navigate to the main screen
      } else {
        message.value = "Registrasi Gagal: ${response.statusCode}";
        Get.snackbar("Oops!", message.value);
        isLoading.value = false;
      }
    } catch (e) {
      message.value = "Akun Sudah Digunakanf";
      Get.snackbar("Masalah!", message.value);
      print(e);
      isLoading.value = false;
    }
  }

  Future<bool> checkIfRegistered() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('username');
  }
}
