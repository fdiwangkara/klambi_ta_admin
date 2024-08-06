import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_admin/helper/constants.dart';
import 'package:klambi_admin/screens/product/add_product/add_product_controller.dart';
import 'package:klambi_admin/screens/product/add_product/components/add_form.dart';

import 'edit_product_controller.dart';

class EditProductScreenView extends GetView<EditProductController> {
  const EditProductScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditProductController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        leading: IconButton(
            onPressed: () {
              Get.offAndToNamed("/navbar", arguments: 1);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text(
          "Edit Produk",
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
