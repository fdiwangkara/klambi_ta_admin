import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_admin/components/custom_textfield.dart';
import 'package:klambi_admin/helper/constants.dart';
import '../add_product_controller.dart';

class AddForm extends StatefulWidget {
  const AddForm({super.key});

  @override
  State<AddForm> createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  final AddProductController controller = Get.put(AddProductController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: const TextSpan(
              text: 'Upload Foto Produk',
              style: TextStyle(
                  color: kDarkGreyColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
              children: [
                TextSpan(
                  text: '*',
                  style: TextStyle(color: kDangerColor),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          GetBuilder<AddProductController>(
            builder: (controller) => Container(
              width: MediaQuery.of(context).size.width,
              height: 206,
              decoration: BoxDecoration(
                color: kBackgroundColor,
                border: Border.all(color: kLightGreyColor),
                borderRadius: BorderRadius.circular(10),
              ),
              child: controller.selectedImage == null
                  ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.add_circle_outline_outlined,
                      size: 40,
                      color: kPrimaryColor,
                    ),
                    onPressed: controller.pickImage,
                  ),
                  const Text(
                    'Foto Barang',
                    style: TextStyle(color: kBlackColor, fontSize: 14),
                  ),
                ],
              )
                  : Stack(
                alignment: Alignment.center,
                children: [
                  Image.file(
                    controller.selectedImage!,
                    width: width,
                    height: 206,
                    fit: BoxFit.cover,
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
                        color: kWhiteColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          RichText(
            text: const TextSpan(
              text: 'Nama Produk',
              style: TextStyle(
                  color: kDarkGreyColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
              children: [
                TextSpan(
                  text: '*',
                  style: TextStyle(color: kDangerColor),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          CustomTextFormField(
            hintText: 'Nama Produk...',
            controller: controller.titleController,
          ),
          const SizedBox(height: 20),
          RichText(
            text: const TextSpan(
              text: 'Harga Produk',
              style: TextStyle(
                  color: kDarkGreyColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
              children: [
                TextSpan(
                  text: '*',
                  style: TextStyle(color: kDangerColor),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: width / 2,
            child: CustomTextFormField(
              hintText: 'Harga Produk...',
              keyboardType: TextInputType.number,
              controller: controller.priceController,
            ),
          ),
          const SizedBox(height: 20),
          RichText(
            text: const TextSpan(
              text: 'Stok Awal',
              style: TextStyle(
                  color: kDarkGreyColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
              children: [
                TextSpan(
                  text: '*',
                  style: TextStyle(color: kDangerColor),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: width / 2,
            child: CustomTextFormField(
              hintText: 'Stok Awal...',
              keyboardType: TextInputType.number,
              controller: controller.stockController,
            ),
          ),
          const SizedBox(height: 20),
          RichText(
            text: const TextSpan(
              text: 'Kategori Produk',
              style: TextStyle(
                  color: kDarkGreyColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
              children: [
                TextSpan(
                  text: '*',
                  style: TextStyle(color: kDangerColor),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          GetBuilder<AddProductController>(
            builder: (controller) => DropdownButtonFormField<String>(
              value: controller.selectedCategory.value.isEmpty
                  ? null
                  : controller.selectedCategory.value,
              items: const [
                DropdownMenuItem(
                    value: 'Lengan Pendek', child: Text('Lengan Pendek')),
                DropdownMenuItem(
                    value: 'Lengan Panjang', child: Text('Lengan Panjang')),
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
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: kLightGreyColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          RichText(
            text: const TextSpan(
              text: 'Deskripsi Produk',
              style: TextStyle(
                  color: kDarkGreyColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
              children: [
                TextSpan(
                  text: '*',
                  style: TextStyle(color: kDangerColor),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          CustomTextFormField(
            hintText: 'Deskripsi Produk...',
            controller: controller.descriptionController,
            maxLines: 5,
          ),
          const SizedBox(height: 30),
          Center(
            child: Obx(
                  () => ElevatedButton(
                onPressed: controller.isAdding.value
                    ? null
                    : () async {
                  await controller.addProduct();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: controller.isAdding.value
                    ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: kWhiteColor,
                    strokeWidth: 3.0,
                  ),
                )
                    : const Text(
                  'Tambah Produk',
                  style: TextStyle(
                    color: kWhiteColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
