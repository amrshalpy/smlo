import 'package:elhamdania/componant/componant.dart';
import 'package:elhamdania/moduel/define_screen/define_screen.dart';
import 'package:flutter/material.dart';

Widget getScreens(Screens screen) {
  return Column(
    children: [
      Image.asset(
        '${screen.image}',
        height: 400,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
      SizedBox(
        height: 19,
      ),
      defaultText(
        txt: '${screen.title}',
        fontSize: 25,
        fontWeight: FontWeight.w600,
      ),
      SizedBox(
        height: 20,
      ),
      defaultText(
        txt: '${screen.subTitle}',
        fontSize: 20,
        fontWeight: FontWeight.normal,
      ),
      SizedBox(
        height: 5,
      ),
      defaultText(
        txt: '${screen.subsTitle}',
        fontSize: 19,
        fontWeight: FontWeight.normal,
      )
   
    ],
  );
}
