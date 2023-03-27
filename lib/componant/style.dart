import 'package:flutter/material.dart';

Color mainColor = Color(0xffecb451);
Color secandColor = Color(0xff555555);
Color txtColor = Color(0xff1b2835);
Color txt2Color = Color(0xff31302a);
Color iconColor = Color(0xff292a2a);
// Color groundColor = Color(0xffeff0f1);
Color groundColor = Color(0xfff2f0ed);
Widget crdientColor() {
  return Container(
      decoration: BoxDecoration(),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [secandColor, mainColor])),
      ));
}
