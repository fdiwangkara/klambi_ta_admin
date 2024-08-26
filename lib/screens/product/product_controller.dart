import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../models/product_response_model.dart';

class ProductController extends GetxController {
  RxList<Datum> productList = <Datum>[].obs;
  RxList<String> categoryList = <String>[].obs;
  RxString selectedCategory = 'All'.obs;
  RxBool isLoading = false.obs;
  RxInt totalStock = 0.obs;
  RxInt totalReceive = 0.obs;
  RxInt totalSold = 0.obs;

  @override
  void onInit() {
    super.onInit();
    loadCategories();
    loadProducts("All");
  }

  Future<void> loadCategories() async {
    try {
      isLoading.value = true;
      final response = await http.get(
          Uri.parse("https://klambi.ta.rplrus.com/api/products/category/all"));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        categoryList.value = List<String>.from(data['data']);
      } else {
        print("Failed to load categories. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error loading categories: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadProducts(String category) async {
    try {
      isLoading.value = true;
      final categoryPath = "category/$category";
      final response = await http.get(
          Uri.parse("https://klambi.ta.rplrus.com/api/products/$categoryPath"));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        productList.value =
        List<Datum>.from(data['data'].map((x) => Datum.fromJson(x)));
        calculateTotals();
      } else {
        print("Failed to load products. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error loading products: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void calculateTotals() {
    int stock = 0;
    int received = 0;
    int sold = 0;

    for (var item in productList) {
      stock += item.stock;
      sold += item.sold;
      received += item.stock + item.sold; // Stock plus sold quantity
    }

    totalStock.value = stock;
    totalReceive.value = received;
    totalSold.value = sold;
  }

  void onCategoryChanged(String? newCategory) {
    if (newCategory != null) {
      selectedCategory.value = newCategory;
      loadProducts(newCategory);
    }
  }
}
