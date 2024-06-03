import 'package:flutter/material.dart';

import '../../../helper/constants.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Semua Produk',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            width: width / 2.5,
            height: 36,
            decoration: BoxDecoration(
              color: kBackgroundColor,
              border: Border.all(
                color: kLightGreyColor,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: DropdownButtonHideUnderline(
              child: Center(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: 'Semua Barang',
                  items: <String>[
                    'Semua Barang',
                    'Lengan Panjang',
                    'Lengan Pendek',
                    'Oversize'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Center(
                        child: Text(value),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    // Handle dropdown value change
                  },
                  alignment: Alignment.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: kBlackColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
