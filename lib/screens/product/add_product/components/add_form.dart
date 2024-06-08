import 'package:flutter/material.dart';
import 'package:klambi_admin/components/custom_icon.dart';
import 'package:klambi_admin/helper/constants.dart';
import 'package:klambi_admin/components/custom_textfield.dart';

class AddForm extends StatelessWidget {
  const AddForm({super.key});

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
              text: 'Upload Foto Produk',
              style: const TextStyle(color: kDarkGreyColor, fontSize: 12, fontWeight: FontWeight.w500,),
              children: [
                TextSpan(
                  text: '*',
                  style: const TextStyle(color: kDangerColor),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              // Handle onTap
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 206,
              decoration: BoxDecoration(
                color: kBackgroundColor,
                border: Border.all(color: kLightGreyColor),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_circle_outline_outlined, color: kPrimaryColor, size: 40),
                  const SizedBox(height: 8),
                  Text(
                    'Foto Barang',
                    style: TextStyle(color: kBlackColor, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          RichText(
            text: TextSpan(
              text: 'Nama Produk',
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
          const CustomTextFormField(
            hintText: 'Nama Produk...',
          ),
          const SizedBox(height: 20),
          RichText(
            text: TextSpan(
              text: 'Harga Produk',
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
            child: const CustomTextFormField(
              hintText: 'Harga Produk...',
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(height: 20),
          RichText(
            text: TextSpan(
              text: 'Potongan Harga',
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
            child: const CustomTextFormField(
              hintText: 'Potongan Harga...',
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(height: 20),
          RichText(
            text: TextSpan(
              text: 'Kategori Produk',
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
            items: const [
              DropdownMenuItem(value: 'Lengan Pendek', child: Text('Lengan Pendek')),
              DropdownMenuItem(value: 'Lengan Panjang', child: Text('Lengan Panjang')),
              DropdownMenuItem(value: 'Oversize', child: Text('Oversize')),
            ],
            onChanged: (value) {
              // Handle dropdown value change
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
              text: 'Deskripsi Produk',
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
            child: const CustomTextFormField(
              hintText: 'Deskripsi Produk...',
              keyboardType: TextInputType.multiline,
              maxLines: 100, // Allowing multiple lines
            ),
          ),
          const SizedBox(height: 20),
          RichText(
            text: TextSpan(
              text: 'Stok Awal',
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
            width: MediaQuery.of(context).size.width / 3, // Set the width for the stock field
            child: const CustomTextFormField(
              hintText: 'Stok Awal...',
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(height: 50),
          SizedBox(
            width: width,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                // Handle button press
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Tambah Produk',
                style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
