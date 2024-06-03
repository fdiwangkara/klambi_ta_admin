import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_admin/screens/product/product_controller.dart';

class ProductScreenView extends GetView<ProductController> {
  const ProductScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductController());
    return Scaffold(

    );
  }
}
