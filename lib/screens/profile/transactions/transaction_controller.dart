import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../models/order_response_model.dart';

class TransactionController extends GetxController {
  late final SharedPreferences prefs;
  var isLoading = true.obs;
  var orderData = OrderModel(success: false, message: "", data: []).obs;

  @override
  void onInit() async {
    super.onInit();
    prefs = await SharedPreferences.getInstance(); // Initialize SharedPreferences
    fetchOrderData(); // Fetch order data when the controller is initialized
  }

  Future<void> fetchOrderData() async {
    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse('https://klambi.ta.rplrus.com/api/order/history/index'),
      );
      if (response.statusCode == 200) {
        orderData.value = OrderModel.fromJson(json.decode(response.body));
        filterOldOrders(); // Filter out old orders
      } else {
        Get.snackbar("Error", "Failed to load order data");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred");
    } finally {
      isLoading(false);
    }
  }

  void filterOldOrders() {
    final oneWeekAgo = DateTime.now().subtract(Duration(days: 7));
    orderData.value.data = orderData.value.data.where((order) {
      return order.order.orderTime.isAfter(oneWeekAgo);
    }).toList();
  }

  List<Datum> getCompletedOrders() {
    return orderData.value.data.where((order) => order.order.status == 'pesanan_selesai').toList();
  }
}
