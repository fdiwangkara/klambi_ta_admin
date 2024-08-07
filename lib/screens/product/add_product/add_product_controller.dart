import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:klambi_admin/models/product_response_model.dart'; // Make sure to import your product model

class AddProductController extends GetxController {
  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  final categoryController = TextEditingController();

  final RxString selectedCategory = ''.obs;
  final RxBool isLoading = false.obs;

  Future<void> addProduct() async {
    if (titleController.text.isEmpty ||
        priceController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        selectedCategory.value.isEmpty) {
      Get.snackbar('Error', 'All fields are required');
      return;
    }

    final url = Uri.parse('https://klambi.ta.rplrus.com/api/products');

    final productData = {
      'title': titleController.text,
      'price': int.parse(priceController.text),
      'descripsi': descriptionController.text,
      'category': selectedCategory.value,
      'rate': 0, // Default value, change as needed
      'image_url': 'https://via.placeholder.com/150', // Placeholder image URL, change as needed
      'created_at': DateTime.now().toIso8601String(),
      'updated_at': DateTime.now().toIso8601String(),
    };

    isLoading(true);

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(productData),
      );

      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Product added successfully');
        clearFields();
        Get.offNamed("/navbar", arguments: 1);
        // You can add more logic to refresh the product list if needed
      } else {
        Get.snackbar('Error', 'Failed to add product');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }

  void clearFields() {
    titleController.clear();
    priceController.clear();
    descriptionController.clear();
    selectedCategory.value = '';
  }
}
