import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_admin/screens/home/components/chart_graph.dart';
import 'package:klambi_admin/screens/home/components/header.dart';
import 'package:klambi_admin/screens/home/components/information_scroll.dart';
import 'package:klambi_admin/screens/home/components/stock_container.dart';
import 'package:klambi_admin/screens/home/home_controller.dart';

import '../../helper/constants.dart';

class HomeScreenView extends GetView<HomeController> {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Header(),
            Divider(color: kLightGreyColor),
            SizedBox(height: 20),
            InformationScroll(),
            SizedBox(height: 20),
            StockContainer(),
            SizedBox(height: 20),
            ChartGraph(),
          ],
        ),
      ),
    );
  }
}
