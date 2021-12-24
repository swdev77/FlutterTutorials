import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

final edgeInsets = EdgeInsets.fromLTRB(
  0,
  getProportionateScreenWidth(10),
  getProportionateScreenWidth(10),
  getProportionateScreenWidth(10),
);

const kImagesPath = 'assets/images';
const kIconsPath = 'assets/icons';

final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = 'Please enter your email';
const String kInvalidEmailError = 'Pleae enter valid email';
const String kPassNullError = 'Please enter your password';
const String kShortPassError = 'Password is too short';
const String kMatchPassError = 'Password don\'t match';
