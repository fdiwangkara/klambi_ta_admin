import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../helper/constants.dart';

class StockContainer extends StatelessWidget {
  const StockContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> stockData = [
      {
        'icon': 'assets/icons/box_yellow_icon.svg',
        'subtitle': 'Stok Tersedia',
        'quantity': '20 Pcs',
      },
      {
        'icon': 'assets/icons/box_green_icon.svg',
        'subtitle': 'Stok Diterima',
        'quantity': '35 Pcs',
      },
      {
        'icon': 'assets/icons/box_red_icon.svg',
        'subtitle': 'Stok Terjual',
        'quantity': '15 Pcs',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 226,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          border: Border.all(color: kLightGreyColor),
        ),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Data Penjualan - saat ini',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              SizedBox(height: 30), // Add spacing between title and rows
              Expanded(
                child: Column(
                  children: List.generate(stockData.length, (index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              stockData[index]['icon']!,
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                stockData[index]['subtitle']!,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: kDarkGreyColor,
                                ),
                              ),
                            ),
                            Spacer(),
                            Text(
                              stockData[index]['quantity']!,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: kBlackColor,
                              ),
                            ),
                          ],
                        ),
                        Divider(color: kLightGreyColor),
                      ],
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
