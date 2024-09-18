import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

import '../../../models/product_response_model.dart';

class EditProductController extends GetxController {
  final titleController = TextEditingController();
  final imageController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  final categoryController = TextEditingController();
  final stockController = TextEditingController();

  final RxString selectedCategory = ''.obs;
  final RxBool isEditing = false.obs;  // Separate loading state for editing
  final RxBool isDeleting = false.obs; // Separate loading state for deleting
  File? selectedImage;

  // Initialize the controller with the product data
  void initializeProductDetails(Datum product) {
    titleController.text = product.title ?? '';
    imageController.text = product.imagee ?? '';
    priceController.text = product.price?.toString() ?? '0';
    descriptionController.text = product.descripsi ?? '';
    selectedCategory.value = product.category?.toString().split('.').last.replaceAll('_', ' ').toLowerCase().split(' ').map((word) => word[0].toUpperCase() + word.substring(1)).join(' ') ?? '';
    stockController.text = product.stock?.toString() ?? '0';
  }

  Future<void> pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImage = File(image.path);
      update();
    }
  }

  Future<void> editProduct(int productId) async {
    if (titleController.text.isEmpty ||
        priceController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        selectedCategory.value.isEmpty ||
        stockController.text.isEmpty) {
      Get.snackbar('Error', 'All fields are required');
      return;
    }

    isEditing(true);

    final url = Uri.parse('https://klambi.ta.rplrus.com/api/products/$productId');

    try {
      var request = http.MultipartRequest('POST', url); // Send as a PUT request for updating

      request.fields['title'] = titleController.text;
      request.fields['price'] = priceController.text;
      request.fields['descripsi'] = descriptionController.text;
      request.fields['category'] = selectedCategory.value;
      request.fields['rate'] = '0';
      request.fields['stock'] = stockController.text;

      if (selectedImage != null) {
        final file = File(selectedImage!.path);
        final bytes = await file.readAsBytes();

        request.files.add(http.MultipartFile.fromBytes(
          'imagee',
          bytes,
          filename: file.path.split('/').last, // optional, to add file name
        ));
      } else {
        final response = await http.get(Uri.parse("https://klambi.ta.rplrus.com/storage/" + imageController.text));

        if (response.statusCode == 200) {
          final bytes = response.bodyBytes;

          request.files.add(http.MultipartFile.fromBytes(
            'imagee',
            bytes,
            filename: "tes",
          ));
        } else {
          print('Failed to get image from URL');
        }
      }

      final response = await request.send();
      final responseData = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(responseData);

        if (jsonResponse['status'] == true) {
          Get.snackbar('Success', 'Product updated successfully');
          Get.offNamed("/navbar", arguments: 1);
        } else {
          Get.snackbar('Error', jsonResponse['message']);
        }
      } else {
        final jsonResponse = json.decode(responseData);
        Get.snackbar('Error', jsonResponse['message']);
      }
    } catch (e) {
      print(e.toString());
      Get.snackbar('Error', e.toString());
    } finally {
      isEditing(false);
    }
  }

  Future<void> deleteProduct(int productId) async {
    isDeleting(true);

    final url = Uri.parse('https://klambi.ta.rplrus.com/api/products/$productId');

    try {
      final response = await http.delete(url);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        Get.offNamed("/navbar", arguments: 1);
        Get.snackbar('Success', 'Product deleted successfully');
      } else {
        final jsonResponse = json.decode(response.body);

        Get.snackbar('Error', jsonResponse['message'] ?? 'Failed to delete product');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isDeleting(false);
    }
  }

  @override
  void onClose() {
    titleController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    stockController.dispose();
    super.onClose();
  }
}
