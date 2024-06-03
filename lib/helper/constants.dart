import 'package:flutter/material.dart';

// warna klambi
const kPrimaryColor = Color(0xFFF6B60D);
const kSecondaryColor = Color(0xFF00A28A);
const kThirdColor = Color(0xFFF3533B);
const kFourthColor = Color(0xFF1B99D3);
const kWhiteColor = Color(0xFFFFFFFF);
const kBlackColor = Color(0xFF000000);
const kBackgroundColor = Color(0xFFFAFAFA);
const kDarkGreyColor = Color(0xFF8B8B8B);
const kLightGreyColor = Color(0xFFE7E7E7);
const kSuperLightGreyColor = Color(0xFFF5F5F5);
const kDangerColor = Color(0xFFFF0000);

// durasi animasi
const kAnimationDuration = Duration(milliseconds: 200);

const defaultDuration = Duration(milliseconds: 250);

// Pemberitahuan Error
final RegExp emailValidatorRegExp =
RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Email Belum diisi!";
const String kInvalidEmailError = "Email Tidak Valid!";
const String kPassNullError = "Password Belum Diisi!";
const String kShortPassError = "Password Terlalu Pendek!";
const String kMatchPassError = "Password Salah!";
const String kNamelNullError = "Nama Belum Diisi!";
const String kConfirmPassError = "Password Tidak Sama!";