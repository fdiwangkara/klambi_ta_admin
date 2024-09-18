import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../../models/get_user_response_model.dart';

class ChatController extends GetxController {
  late final SharedPreferences prefs;
  var isLoading = true.obs;
  var userList = <Datum>[].obs;
  String? token;

  @override
  void onInit() async {
    super.onInit();
    prefs = await SharedPreferences.getInstance(); // Initialize SharedPreferences
    token = prefs.getString("token"); // Get token from SharedPreferences
    if (token == null) {
      Get.snackbar('Error', 'User not logged in. Token is missing.');
      return;
    }
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse('https://klambi.ta.rplrus.com/api/admin/users/all'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token', // Use the token from SharedPreferences
        },
      );
      if (response.statusCode == 200) {
        final result = getUserModelFromJson(response.body);
        userList.assignAll(result.data);
      } else {
        Get.snackbar("Error", "Failed to load users");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred");
    } finally {
      isLoading(false);
    }
  }
}
