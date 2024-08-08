import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:klambi_admin/models/product_response_model.dart'; // Adjust the import path as needed

class EditProductController extends GetxController {
  Future<void> editProduct(Datum product, String title, int price, String description, double rate, String imageUrl, String? category) async {
    final url = Uri.parse('https://klambi.ta.rplrus.com/api/products/${product.id}');

    final productData = {
      'title': title,
      'price': price,
      'descripsi': description,
      'rate': rate,
      'image_url': imageUrl.isEmpty ? 'https://via.placeholder.com/150' : imageUrl,
      'category': category ?? product.category, // Ensure category is handled
      'updated_at': DateTime.now().toIso8601String(),
    };

    try {
      final response = await http.put(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(productData),
      );

      if (response.statusCode == 200) {
        Get.offNamed("/navbar", arguments: 1);
        Get.snackbar('Success', 'Product edited successfully');
      } else {
        Get.snackbar('Error', 'Failed to edit product');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> deleteProduct(int id) async {
    final url = Uri.parse('https://klambi.ta.rplrus.com/api/products/$id');

    try {
      final response = await http.delete(url);

      if (response.statusCode == 200) {
        Get.offNamed("/navbar", arguments: 1);
        Get.snackbar('Success', 'Product deleted successfully');
        // Add any additional logic if needed
      } else {
        Get.snackbar('Error', 'Failed to delete product');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
