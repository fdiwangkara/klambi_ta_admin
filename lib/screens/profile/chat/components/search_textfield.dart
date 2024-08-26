import 'package:flutter/material.dart';
import '../../../../helper/constants.dart';

class SearchTextfields extends StatelessWidget {
  const SearchTextfields({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: 50,
      decoration: BoxDecoration(
        color: kLightGreyColor, // Updated background color
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
          prefixIcon: Icon(
            Icons.search,
            size: 24,
            color: kDarkGreyColor,
          ),
          hintText: 'Cari Percakapan',
          hintStyle: TextStyle(color: kDarkGreyColor, fontSize: 16),
        ),
      ),
    );
  }
}
