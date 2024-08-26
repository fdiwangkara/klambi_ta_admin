import 'package:flutter/material.dart';
import 'package:klambi_admin/components/custom_icon.dart';
import 'package:klambi_admin/helper/constants.dart';
import 'package:klambi_admin/components/custom_textfield.dart';
import 'package:klambi_admin/models/product_response_model.dart';
import 'package:get/get.dart';
import '../edit_product_controller.dart'; // Adjust the import path as needed

class EditProductForm extends StatefulWidget {
  final Datum product;

  const EditProductForm({super.key, required this.product});

  @override
  _EditProductFormState createState() => _EditProductFormState();
}

class _EditProductFormState extends State<EditProductForm> {
  late EditProductController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(EditProductController());
    controller.initializeProductDetails(widget.product);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: GetBuilder<EditProductController>(
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Edit Gambar Produk',
                  style: const TextStyle(color: kDarkGreyColor, fontSize: 12, fontWeight: FontWeight.w500),
                  children: [
                    TextSpan(
                      text: '*',
                      style: const TextStyle(color: kDangerColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Stack(
                alignment: Alignment.center,
                children: [
                  controller.selectedImage != null
                      ? Image.file(
                    controller.selectedImage!,
                    width: width,
                    height: 206,
                    fit: BoxFit.cover,
                  )
                      : Image.network(
                    "https://klambi.ta.rplrus.com/storage/" + widget.product.imagee,  // Use the product's image URL
                    width: width,
                    height: 206,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: width,
                        height: 206,
                        color: Colors.grey,
                        child: Icon(Icons.image, color: Colors.white, size: 50),
                      );
                    },
                  ),
                  Container(
                    width: width,
                    height: 206,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  TextButton(
                    onPressed: controller.pickImage,
                    child: const Text(
                      'Ubah Foto',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  text: 'Edit Nama Produk',
                  style: const TextStyle(color: kDarkGreyColor, fontSize: 12, fontWeight: FontWeight.w500),
                  children: [
                    TextSpan(
                      text: '*',
                      style: const TextStyle(color: kDangerColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              CustomTextFormField(
                controller: controller.titleController,
                hintText: 'Nama Produk...',
              ),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  text: 'Edit Harga Produk',
                  style: const TextStyle(color: kDarkGreyColor, fontSize: 12, fontWeight: FontWeight.w500),
                  children: [
                    TextSpan(
                      text: '*',
                      style: const TextStyle(color: kDangerColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Container(
                width: width / 2,
                child: CustomTextFormField(
                  controller: controller.priceController,
                  hintText: 'Harga Produk...',
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  text: 'Edit Stok Produk',
                  style: const TextStyle(color: kDarkGreyColor, fontSize: 12, fontWeight: FontWeight.w500),
                  children: [
                    TextSpan(
                      text: '*',
                      style: const TextStyle(color: kDangerColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Container(
                width: width / 3,
                child: CustomTextFormField(
                  controller: controller.stockController,
                  hintText: 'Stok Produk...',
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  text: 'Edit Kategori Produk',
                  style: const TextStyle(color: kDarkGreyColor, fontSize: 12, fontWeight: FontWeight.w500),
                  children: [
                    TextSpan(
                      text: '*',
                      style: const TextStyle(color: kDangerColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              DropdownButtonFormField<String>(
                value: controller.selectedCategory.value,
                items: const [
                  DropdownMenuItem(value: 'Lengan Pendek', child: Text('Lengan Pendek')),
                  DropdownMenuItem(value: 'Lengan Panjang', child: Text('Lengan Panjang')),
                  DropdownMenuItem(value: 'Oversize', child: Text('Oversize')),
                ],
                onChanged: (value) {
                  controller.selectedCategory.value = value!;
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(16),
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: kDarkGreyColor,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  text: 'Edit Deskripsi Produk',
                  style: const TextStyle(color: kDarkGreyColor, fontSize: 12, fontWeight: FontWeight.w500),
                  children: [
                    TextSpan(
                      text: '*',
                      style: const TextStyle(color: kDangerColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Container(
                height: 200,
                child: CustomTextFormField(
                  controller: controller.descriptionController,
                  hintText: 'Deskripsi Produk...',
                  keyboardType: TextInputType.multiline,
                  maxLines: 100,
                ),
              ),
              const SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.6,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () => _showConfirmationDialog(
                        context,
                        'Konfirmasi Edit',
                        'Apakah Anda yakin untuk mengedit produk ini?',
                            () => controller.editProduct(widget.product.id), // Pass product ID
                      ), // Pass product ID
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Edit Produk',
                        style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  SizedBox(
                    width: width / 5,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () => _showConfirmationDialog(
                        context,
                        'Konfirmasi Edit',
                        'Apakah Anda yakin untuk menghapus produk ini?',
                            () => controller.deleteProduct(widget.product.id), // Pass product ID
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kDangerColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Icon(
                        Icons.delete,
                        color: kWhiteColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}


void _showConfirmationDialog(BuildContext context, String title, String content, VoidCallback onConfirm) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        backgroundColor: kWhiteColor,
        surfaceTintColor: kWhiteColor,
        shadowColor: kBlackColor,
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('Tidak', style: TextStyle(color: Colors.red)),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              onConfirm(); // Perform the action
            },
            child: Text('Ya', style: TextStyle(color: Colors.green)),
          ),
        ],
      );
    },
  );
}