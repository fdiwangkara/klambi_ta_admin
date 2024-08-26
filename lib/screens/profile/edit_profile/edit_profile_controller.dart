import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:klambi_admin/models/show_profile_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../models/edit_profile_response_model.dart';
import '../profile_controller.dart';

class EditProfileController extends GetxController {
  final controller = Get.put(ProfileController());
  late SharedPreferences prefs;
  var pickedImage = Rxn<File>();
  var imageUrl = Rxn<String>();
  RxString username = "".obs;

  var isLoading = false.obs;
  var adminProfile = UserProfile(name: '', email: '', image: '').obs;

  final TextEditingController ctrName = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    loadUserProfile();
    loadImageFromPrefs();
  }


  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      pickedImage.value = File(pickedFile.path);
      imageUrl.value = null;

      // Simpan jalur file gambar ke SharedPreferences
      await prefs.setString('userImage', pickedFile.path);
    }
  }

  Future<void> loadUserProfile() async {
    isLoading(true);
    prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    final response = await http.get(
      Uri.parse('https://klambi.ta.rplrus.com/api/showProfile'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      print(token);
      var data = ShowProfileResponse.fromJson(jsonDecode(response.body)).data;
      adminProfile.value = data;
      print(response.body);
    } else {
      print(response.body);
      print('Failed to load profile');
      print(ctrName.value);

    }
    isLoading(false);
  }

  Future<void> updateProfile(String name, File? imageFile) async {
    isLoading(true);
    var token = prefs.getString("token");

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://klambi.ta.rplrus.com/api/profile'),
    );

    request.headers['Authorization'] = 'Bearer $token';
    request.fields['name'] = name;

    if (imageFile != null) {
      var imageStream = http.ByteStream(imageFile.openRead());
      var imageLength = await imageFile.length();
      var multipartFile = http.MultipartFile(
        'image',
        imageStream,
        imageLength,
        filename: imageFile.path.split('/').last,
      );
      request.files.add(multipartFile);
    }

    var response = await request.send();

    if (response.statusCode == 200) {
      var responseData = await http.Response.fromStream(response);
      var updatedData = EditModel.fromJson(jsonDecode(responseData.body)).data;
      adminProfile.value = UserProfile(
        name: updatedData.name,
        email: adminProfile.value.email,
        image: updatedData.image,
      );
      Get.snackbar("Success", "Profil Berhasil Diubah!");
    } else {
      Get.snackbar("Failed", "Profil Gagal Diubah!");
    }
    isLoading(false);
  }

  void loadImageFromPrefs() async {
    prefs = await SharedPreferences.getInstance();
    var savedImagePath = prefs.getString('userImage');
    if (savedImagePath != null && savedImagePath.isNotEmpty) {
      pickedImage.value = File(savedImagePath); // Load image from file
    }
  }
}