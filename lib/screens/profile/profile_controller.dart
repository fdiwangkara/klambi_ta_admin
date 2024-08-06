import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  late final SharedPreferences prefs;
  RxString name = "".obs;
  RxString email = "".obs;

  @override
  void onInit() {
    super.onInit();
    setPreference();
  }

  Future<void> setPreference() async {
    prefs = await SharedPreferences.getInstance();
    getUser();
  }

  void getUser() {
    name.value = prefs.getString("username") ?? "";
    email.value = prefs.getString("email") ?? "";
  }

  Future<void> logout() async {
    prefs.clear();
    Get.offAllNamed("/login");
  }
}