import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../models/order_response_model.dart';
import '../../models/status_response_model.dart';

class OrdersController extends GetxController {
  late final SharedPreferences prefs;
  var orders = <Datum>[].obs;
  var isLoading = true.obs;
  var statusList = <String>[].obs;
  var selectedStatus = ''.obs;  // This should be an empty string initially

  @override
  void onInit() async {
    super.onInit();
    prefs = await SharedPreferences.getInstance();
    fetchOrders();
    fetchStatusData();
  }

  void fetchOrders() async {
    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse('https://klambi.ta.rplrus.com/api/order/history/index'),
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        OrderModel orderModel = OrderModel.fromJson(jsonData);
        orders.value = orderModel.data;
      } else {
        Get.snackbar('Error', 'Failed to load orders');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch data');
    } finally {
      isLoading(false);
    }
  }

  List<Datum> get filteredOrders {
    if (selectedStatus.value.isEmpty) {
      return orders;
    } else {
      return orders.where((order) => order.order.status == selectedStatus.value).toList();
    }
  }

  void fetchStatusData() async {
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
        var jsonData = json.decode(response.body);
        StatusModel statusModel = StatusModel.fromJson(jsonData);
        statusList.value = statusModel.data;
        if (statusList.isNotEmpty) {
          selectedStatus.value = statusList[0];
        }
        print('Status List: ${statusList.value}');
      } else {
        Get.snackbar('Error', 'Failed to load status data');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch data');
    }
  }

  void onStatusSelected(String status) {
    selectedStatus.value = status;
  }

  Map<int, double> getWeeklySummary() {
    Map<int, double> weeklySummary = {
      0: 0.0,
      1: 0.0,
      2: 0.0,
      3: 0.0,
      4: 0.0,
      5: 0.0,
      6: 0.0,
    };

    for (var order in orders) {
      if (order.order.status == 'pesanan_selesai') {
        int day = order.order.orderTime.weekday % 7;  // Convert to 0-based (Sunday=0, ..., Saturday=6)
        weeklySummary[day] = (weeklySummary[day] ?? 0) + order.order.totalPrice;
      }
    }

    return weeklySummary;
  }

}

