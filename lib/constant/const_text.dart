import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/const_colors.dart';

class ConstText {
  static const appbarTitle =
      Text("English Words", style: TextStyle(color: ConstColor.morrowWhite));

  static const alertAddCard =
      Text("Başlık", style: TextStyle(color: ConstColor.morrowWhite));

  static const addCardButton =
      Text("ADD Card", style: TextStyle(color: ConstColor.morrowWhite));

  static const alertAddWord = Text("Başlık kelime ekle",
      style: TextStyle(
          color: ConstColor.amethystShow, fontWeight: FontWeight.w700));

  static const addWordButton =
      Text("Add Word", style: TextStyle(color: ConstColor.morrowWhite));

  static const labelFront = Text(
    "Front",
    style: TextStyle(
        color: ConstColor.purpleParadise, fontWeight: FontWeight.bold),
  );

  static const labelBack = Text(
    "Back",
    style: TextStyle(
        color: ConstColor.purpleParadise, fontWeight: FontWeight.bold),
  );

  static const deleteItem = Text("Are You Removing?");
}
