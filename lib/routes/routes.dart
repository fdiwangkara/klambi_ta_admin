import 'package:get/get.dart';
import 'package:klambi_admin/components/navbar.dart';
import 'package:klambi_admin/screens/home/home_binding.dart';
import 'package:klambi_admin/screens/home/home_screen.dart';
import 'package:klambi_admin/screens/login/login_binding.dart';
import 'package:klambi_admin/screens/login/login_screen.dart';
import 'package:klambi_admin/screens/orders/orders_binding.dart';
import 'package:klambi_admin/screens/orders/orders_screen.dart';
import 'package:klambi_admin/screens/product/product_binding.dart';
import 'package:klambi_admin/screens/product/product_screen.dart';
import 'package:klambi_admin/screens/register/register_binding.dart';
import 'package:klambi_admin/screens/register/register_screen.dart';

List<GetPage> routes = [
  GetPage(
    name: '/login',
    page: () => const LoginScreenView(),
    binding: LoginBinding(),
  ),
  GetPage(
    name: '/register',
    page: () => const RegisterScreenView(),
    binding: RegisterBinding(),
  ),
  GetPage(
    name: '/home',
    page: () => const HomeScreenView(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: '/product',
    page: () => const ProductScreenView(),
    binding: ProductBinding(),
  ),
  GetPage(
    name: '/orders',
    page: () => const OrdersScreenView(),
    binding: OrdersBinding(),
  ),
  GetPage(
    name: '/navbar',
    page: () =>  LandingPage(),
    // binding: OrdersBinding(),
  ),
];


