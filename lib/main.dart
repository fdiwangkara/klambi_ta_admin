import'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_admin/routes/routes.dart';
import 'package:klambi_admin/screens/home/home_screen.dart';
import 'package:klambi_admin/screens/orders/orders_screen.dart';
import 'package:klambi_admin/screens/product/product_screen.dart';
import 'components/navbar.dart';
import 'helper/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Klambi App - Admin',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(context),
      getPages: routes,
      initialRoute: '/login',
    );
  }
}