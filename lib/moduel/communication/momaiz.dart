import 'package:elhamdania/componant/componant.dart';
import 'package:elhamdania/componant/style.dart';
import 'package:elhamdania/moduel/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class Momaiaze extends StatelessWidget {
  const Momaiaze({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Uri urlm = Uri.parse('https://momyyaz.com/');
    Future<void> getLocationMo() async {
      await launchUrl(urlm);
    }

    final Uri whatsMom = Uri.parse('whatsapp://send?phone=⁦+20 109 698 3281⁩');

    return Scaffold(
      body: Column(children: [
        Padding(
          padding: EdgeInsets.only(right: 10.w, left: 10.w,top: 120.h),
          child: Container(
            height: MediaQuery.of(context).size.height - 160,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                border: Border.all(width: .2, color: Colors.black)),
            child: Padding(
              padding: EdgeInsets.only(left: 10.w, top: 60.h, right: 10.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          nextPage(context: context, page: Home());
                        },
                        child: Text(
                          ' العودة الي الصفحة الرئيسية »',
                          style: TextStyle(
                              color: Colors.redAccent,
                              fontFamily: 'GE_SS_Two',
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                      
                      
                    ],
                  ),
                  SizedBox(height: 40.w,),
                  Text(
                        ' للتواصل مع مميز ',
                        style: TextStyle(
                            color: txtColor,
                            fontFamily: 'GE_SS_Two',
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                      ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          getLocationMo();
                        },
                        child: Container(
                          height: 30.h,
                          width: 90.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: mainColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              defaultText(
                                  txt: 'الموقع',
                                  color: txtColor,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.bold),
                              SizedBox(
                                width: 5.w,
                              ),
                              SvgPicture.asset(
                                'images/g-map icone (1).svg',
                                height: 15.h,
                                width: 15.w,
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          launchUrl(whatsMom);
                        },
                        child: Container(
                            height: 30.h,
                            width: 90.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: mainColor,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                defaultText(
                                    txt: 'واتساب',
                                    color: txtColor,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold),
                                SvgPicture.asset(
                                  'images/wwww.svg',
                                  height: 25.h,
                                  width: 25.w,
                                )
                              ],
                            )),
                      ),
                      InkWell(
                        onTap: () {
                          launch("tel://‎+20 109 698 3281");
                        },
                        child: Container(
                            height: 30.h,
                            width: 90.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: mainColor,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                defaultText(
                                    txt: 'اتصال',
                                    color: txtColor,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold),
                                SizedBox(
                                  width: 10.w,
                                ),
                                SvgPicture.asset(
                                  'images/04.svg',
                                  height: 20.h,
                                  width: 20.w,
                                )
                              ],
                            )),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
