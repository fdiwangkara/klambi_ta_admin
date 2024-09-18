import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class AddProductController extends GetxController {
  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  final categoryController = TextEditingController();
  final stockController = TextEditingController();

  final RxString selectedCategory = ''.obs;
  final RxBool isLoading = false.obs;
  final RxBool isAdding = false.obs;
  File? selectedImage;

  Future<void> pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImage = File(image.path);
      update();
    }
  }

  Future<void> addProduct() async {
    if (titleController.text.isEmpty ||
        priceController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        selectedCategory.value.isEmpty ||
        stockController.text.isEmpty ||
        selectedImage == null) {
      Get.snackbar('Error', 'All fields are required');
      return;
    }

    isAdding(true); // Set isAdding to true when starting the process

    final url = Uri.parse('https://klambi.ta.rplrus.com/api/products');
    isLoading(true);

    try {
      var request = http.MultipartRequest('POST', url);

      // Add text fields to the request
      request.fields['title'] = titleController.text;
      request.fields['price'] = priceController.text;
      request.fields['descripsi'] = descriptionController.text;
      request.fields['category'] = selectedCategory.value;
      request.fields['rate'] = '0'; // Default value for rate
      request.fields['stock'] = stockController.text;
      request.fields['created_at'] = DateTime.now().toIso8601String();
      request.fields['updated_at'] = DateTime.now().toIso8601String();

      // Add image to the request
      if (selectedImage != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'imagee',
          selectedImage!.path,
        ));
      }

      // Send the request
      final response = await request.send();

      // Process the response
      final responseData = await response.stream.bytesToString();
      print('Response Data: $responseData');

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(responseData);

        if (jsonResponse['status'] == true) {
          Get.snackbar('Success', 'Product added successfully');
          clearFields();
          Get.offNamed("/navbar", arguments: 1);
        } else {
          Get.snackbar('Error', jsonResponse['message'] ?? 'Failed to add product');
        }
      } else {
        Get.snackbar('Error', 'Failed to add product');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isAdding(false); // Set isAdding to false when the process finishes
      isLoading(false);
    }
  }

  void clearFields() {
    titleController.clear();
    priceController.clear();
    descriptionController.clear();
    selectedCategory.value = '';
    stockController.clear();
    selectedImage = null;
    update();
  }
}
