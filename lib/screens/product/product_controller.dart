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
          Uri.parse("https://klambi.ta.rplrus.com/api/category"));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        categoryList.value = List<String>.from(data['data']);
        print(categoryList);
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
      final categoryPath ="category/$category";
      final response = await http.get(
          Uri.parse("https://klambi.ta.rplrus.com/api/$categoryPath"));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        productList.value =
        List<Datum>.from(data['data'].map((x) => Datum.fromJson(x)));
      } else {
        print("Failed to load products. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error loading products: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void onCategoryChanged(String? newCategory) {
    if (newCategory != null) {
      selectedCategory.value = newCategory;
      loadProducts(newCategory);
    }
  }
}

