import 'package:flutter/material.dart';
import 'package:klambi_admin/components/custom_icon.dart';
import 'package:klambi_admin/helper/constants.dart';
import 'package:klambi_admin/components/custom_textfield.dart';
import 'package:klambi_admin/models/product_response_model.dart';
import '../edit_product_controller.dart'; // Adjust the import path as needed

class EditProductForm extends StatefulWidget {
  final Datum product;

  const EditProductForm({super.key, required this.product});

  @override
  _EditProductFormState createState() => _EditProductFormState();
}

class _EditProductFormState extends State<EditProductForm> {
  late TextEditingController _titleController;
  late TextEditingController _priceController;
  late TextEditingController _descriptionController;
  late TextEditingController _imageUrlController;
  String? _categoryValue;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.product.title ?? '');
    _priceController = TextEditingController(text: widget.product.price?.toString() ?? '0');
    _descriptionController = TextEditingController(text: widget.product.descripsi ?? '');
    _imageUrlController = TextEditingController(text: widget.product.imageUrl ?? '');
    _categoryValue = widget.product.category?.toString().split('.').last.replaceAll('_', ' ').toLowerCase().split(' ').map((word) => word[0].toUpperCase() + word.substring(1)).join(' ') ?? 'Unknown';
    print('Initial category value: $_categoryValue'); // Debug print
  }

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: 'Edit URL Gambar Produk',
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
            controller: _imageUrlController,
            hintText: 'URL Gambar Produk...',
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
            controller: _titleController,
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
              controller: _priceController,
              hintText: 'Harga Produk...',
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
            value: _categoryValue,
            items: const [
              DropdownMenuItem(value: 'Lengan Pendek', child: Text('Lengan Pendek')),
              DropdownMenuItem(value: 'Lengan Panjang', child: Text('Lengan Panjang')),
              DropdownMenuItem(value: 'Oversize', child: Text('Oversize')),
            ],
            onChanged: (value) {
              setState(() {
                _categoryValue = value;
              });
              print('Selected category value: $value'); // Debug print
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
            height: 200, // Adjusted height for the description field
            child: CustomTextFormField(
              controller: _descriptionController,
              hintText: 'Deskripsi Produk...',
              keyboardType: TextInputType.multiline,
              maxLines: 100, // Allowing multiple lines
            ),
          ),
          const SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: width / 1.5,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Retrieve values from the text controllers
                    final String title = _titleController.text;
                    final int price = int.tryParse(_priceController.text) ?? 0;
                    final String description = _descriptionController.text;
                    final String imageUrl = _imageUrlController.text;
                    final double rate = 0.0; // Assuming rate is fixed or add a controller for it

                    // Call the edit method
                    final editProductController = EditProductController();
                    editProductController.editProduct(
                      widget.product,
                      title,
                      price,
                      description,
                      rate,
                      imageUrl,
                      _categoryValue, // Ensure category value is passed
                    );
                  },
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
                  onPressed: () {
                    // Show confirmation dialog
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Konfirmasi Hapus"),
                          content: Text("Anda yakin ingin menghapus produk ini?"),
                          actions: [
                            TextButton(
                              child: Text("Tidak"),
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                            ),
                            TextButton(
                              child: Text("Ya"),
                              onPressed: () {
                                // Call the delete method
                                final editProductController = EditProductController();
                                editProductController.deleteProduct(widget.product.id);
                                Navigator.of(context).pop(); // Close the dialog
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kDangerColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Icon(
                    Icons.delete,
                    color: kWhiteColor,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
