import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_admin/routes/routes.dart';
import 'package:klambi_admin/screens/home/home_screen.dart';
import 'package:klambi_admin/screens/orders/orders_screen.dart';
import 'package:klambi_admin/screens/product/product_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/navbar.dart';
import 'helper/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure initialization
  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.containsKey('username'); // Corrected check
  runApp(MyApp(
    isLoggedIn: isLoggedIn,
  ));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, this.isLoggedIn = false});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Klambi App - Admin',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(context),
      getPages: routes,
      initialRoute: isLoggedIn ? '/navbar' : '/login', // Use isLoggedIn to decide the initial route
    );
  }
}
