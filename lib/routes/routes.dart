import 'package:get/get.dart';
import 'package:klambi_admin/screens/login/login_binding.dart';
import 'package:klambi_admin/screens/login/login_screen.dart';
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
];


