import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_admin/helper/constants.dart';
import 'package:klambi_admin/screens/product/add_product/add_product_controller.dart';
import 'package:klambi_admin/screens/product/add_product/components/add_form.dart';
import 'package:klambi_admin/screens/product/product_controller.dart';

class AddProductScreenView extends GetView<ProductController> {
  const AddProductScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddProductController());
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: kWhiteColor,
        backgroundColor: kBackgroundColor,
        leading: IconButton(
            onPressed: () {
              Get.offAndToNamed("/navbar", arguments: 1);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text(
          "Tambah Produk",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: kBlackColor  ,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Column(
          children: [
            AddForm(),
          ],
        ),
      ),
    );
  }
}
