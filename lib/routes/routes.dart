import 'package:get/get.dart';
import 'package:klambi_admin/components/navbar.dart';
import 'package:klambi_admin/screens/home/home_binding.dart';
import 'package:klambi_admin/screens/home/home_screen.dart';
import 'package:klambi_admin/screens/login/login_binding.dart';
import 'package:klambi_admin/screens/login/login_screen.dart';
import 'package:klambi_admin/screens/orders/orders_binding.dart';
import 'package:klambi_admin/screens/orders/orders_screen.dart';
import 'package:klambi_admin/screens/product/add_product/add_product_binding.dart';
import 'package:klambi_admin/screens/product/add_product/add_product_screen.dart';
import 'package:klambi_admin/screens/product/edit_product/edit_product_binding.dart';
import 'package:klambi_admin/screens/product/edit_product/edit_product_screen.dart';
import 'package:klambi_admin/screens/product/product_binding.dart';
import 'package:klambi_admin/screens/product/product_screen.dart';
import 'package:klambi_admin/screens/profile/chat/chat_binding.dart';
import 'package:klambi_admin/screens/profile/chat/chat_screen.dart';
import 'package:klambi_admin/screens/profile/edit_profile/edit_profile_binding.dart';
import 'package:klambi_admin/screens/profile/edit_profile/edit_profile_screen.dart';
import 'package:klambi_admin/screens/profile/profile_binding.dart';
import 'package:klambi_admin/screens/profile/profile_screen.dart';
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
    name: '/addProduct',
    page: () => const AddProductScreenView(),
    binding: AddProductBinding(),
  ),
  GetPage(
    name: '/editProduct',
    page: () => const EditProductScreenView(),
    binding: EditProductBinding(),
  ),
  GetPage(
    name: '/orders',
    page: () => const OrdersScreenView(),
    binding: OrdersBinding(),
  ),
  GetPage(
    name: '/profile',
    page: () => const ProfileScreenView(),
    binding: ProfileBinding(),
  ),
  GetPage(
    name: '/editProfile',
    page: () => const EditProfileScreenView(),
    binding: EditProfileBinding(),
  ),
  GetPage(
    name: '/chat',
    page: () => const ChatScreenView(),
    binding: ChatBinding(),
  ),
  GetPage(
    name: '/navbar',
    page: () =>  LandingPage(),
    // binding: OrdersBinding(),
  ),
];


