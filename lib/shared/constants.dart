import 'package:flutter/material.dart';

String baseUrl = "https://pokeapi.co/api/v2/";

double xSmallSize = 10;
double smallSize = 12;
double regularSize = 14;
double mediumSize = 16;
double baseSize = 18;
double megaSize = 20;
double extraSize = 24;

Color blackColor = Color(0xff000000);
Color greyColor = Color(0xff96A996);
Color whiteColor = Color(0xffFFFFFF);
Color errorColor = Color(0xffE64848);
Color successColor = Color(0xff61B176);
Color infoColor = Color(0xff509CE4);

FontWeight fontLight = FontWeight.w300;
FontWeight fontRegular = FontWeight.w400;
FontWeight fontMedium = FontWeight.w500;
FontWeight fontSemiBold = FontWeight.w600;
FontWeight fontBold = FontWeight.w700;
FontWeight fontExtraBold = FontWeight.w800;
FontWeight fontBlackBold = FontWeight.w900;

Map<String, Color> pokeColors = {
  "normal": Color(0xffB9BBB7),
  "poison": Color(0xffA55C9C),
  "psychic": Color(0xffB9BBB7),
  "grass": Color(0xff8CD550),
  "ground": Color(0xffE8C454),
  "ice": Color(0xff95F1FE),
  "fire": Color(0xffF95542),
  "rock": Color(0xffCFBD73),
  "dragon": Color(0xff8A75FD),
  "water": Color(0xff55AEFE),
  "bug": Color(0xffC3D21F),
  "dark": Color(0xff8D6855),
  "fighting": Color(0xffAD594C),
  "ghost": Color(0xff7875D6),
  "steel": Color(0xffC3C1DA),
  "flying": Color(0xff78A5FF),
  "electric": Color(0xffFBE33B),
  "fairy": Color(0xffFCAEFF),
};

Color? getPokeColor(String type) {
  if (pokeColors[type] == null) return Color(0xffB9BBB7);
  return pokeColors[type];
}