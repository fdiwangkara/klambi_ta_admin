import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../../models/order_response_model.dart';
import '../../../models/status_response_model.dart';

class DetailOrdersController extends GetxController {
  late final SharedPreferences prefs;
  var isLoading = true.obs;
  var orderData = OrderModel(success: false, message: "", data: []).obs;
  var statusOptions = <String>[].obs;
  var selectedStatus = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    prefs =
    await SharedPreferences.getInstance(); // Initialize SharedPreferences
    fetchStatusOptions();
  }

  Future<void> fetchOrderData(int orderId) async {
    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse('https://klambi.ta.rplrus.com/api/order/history/index'),
      );
      if (response.statusCode == 200) {
        orderData.value = OrderModel.fromJson(json.decode(response.body));
        final order = orderData.value.data.firstWhere((order) =>
        order.order.id == orderId);
        selectedStatus.value = order.order.status;
      } else {
        Get.snackbar("Error", "Failed to load order data");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred");
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchStatusOptions() async {
    try {
      var token = prefs.getString("token");
      if (token == null) {
        Get.snackbar('Error', 'User not logged in. Token is missing.');
        return;
      }

      final response = await http.get(
        Uri.parse('https://klambi.ta.rplrus.com/api/statuses'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        StatusModel statusModel = StatusModel.fromJson(
            json.decode(response.body));
        statusOptions.value = statusModel.data;
      } else {
        Get.snackbar("Error", "Failed to load status options");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred");
    }
  }

  Future<void> updateOrderStatus(int orderId) async {
    try {
      var token = prefs.getString("token");
      if (token == null) {
        Get.snackbar('Error', 'User not logged in. Token is missing.');
        return;
      }

      final response = await http.post(
        Uri.parse(
            'https://klambi.ta.rplrus.com/api/order-history/$orderId/status'),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          "status": selectedStatus.value,
        }),
      );

      if (response.statusCode == 200) {
        final order = orderData.value.data.firstWhere((order) =>
        order.order.id == orderId);
        order.order.status = selectedStatus.value;
        Get.offAndToNamed("/navbar", arguments: 2);
        Get.snackbar("Success", "Order status updated successfully");
      } else {
        Get.snackbar("Error", "Failed to update order status");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred");
    }
  }
}