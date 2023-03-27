import 'dart:async';

import 'package:elhamdania/componant/componant.dart';
import 'package:elhamdania/componant/const.dart';
import 'package:elhamdania/moduel/define_screen/define_screen.dart';
import 'package:elhamdania/moduel/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => uid==null? DefineScreen():Home())));
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 230.h),
              child: Container(
                height: 130.h,
                width: 200.w,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage('images/hamdania.png'))),
              ),
            ),
          ),
          // defaultText(
          //     txt: 'مجتمع الحمدانية',
          //     fontSize: 21.sp,
          //     fontWeight: FontWeight.bold)
        ],
      ),
    );
  }
}
