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
  late SharedPreferences prefs;
  var pickedImage = Rxn<File>();
  var imageUrl = Rxn<String>();

  var isLoading = false.obs;
  var userProfile = UserProfile(username: '', image: '').obs;

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
      await prefs.setString('userImage', pickedFile.path);
    }
  }

  Future<void> loadUserProfile() async {
    isLoading(true);
    try {
      prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");

      if (token == null || token.isEmpty) {
        Get.snackbar('Error', 'Authentication token not found');
        return;
      }

      final response = await http.get(
        Uri.parse('https://klambi.ta.rplrus.com/api/showProfile'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        var data = ShowProfile.fromJson(jsonDecode(response.body)).data;
        userProfile.value = data;
        ctrName.text = data.username;
        imageUrl.value = data.image;
      } else if (response.statusCode == 401) {
        Get.snackbar('Unauthorized', 'Please log in again.');
        // Handle token refresh or user logout here if necessary
      } else {
        print('Failed to load profile with status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        Get.snackbar('Error', 'Failed to load profile');
      }
    } catch (e) {
      print('An error occurred while loading the profile: $e');
      Get.snackbar('Error', 'An unexpected error occurred');
    } finally {
      isLoading(false);
    }
  }




  Future<void> updateProfile(String username, File? imageFile) async {
    isLoading(true);
    var token = prefs.getString("token");

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://klambi.ta.rplrus.com/api/profile'),
    );

    request.headers['Authorization'] = 'Bearer $token';
    request.fields['username'] = username;

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
      var updatedData = ShowProfile.fromJson(jsonDecode(responseData.body)).data;
      userProfile.value = UserProfile(
        username: updatedData.username,
        image: updatedData.image, // This might be null, which is now acceptable
      );
    } else {
      print('Failed to update profile');
    }
    isLoading(false);
  }


  void loadImageFromPrefs() async {
    prefs = await SharedPreferences.getInstance();
    var savedImagePath = prefs.getString('userImage');
    if (savedImagePath != null && savedImagePath.isNotEmpty) {
      pickedImage.value = File(savedImagePath);
    }
  }
}
