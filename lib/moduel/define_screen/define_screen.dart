import 'package:elhamdania/componant/componant.dart';
import 'package:elhamdania/componant/const.dart';
import 'package:elhamdania/componant/style.dart';
import 'package:elhamdania/cubit/Home_state.dart';
import 'package:elhamdania/cubit/home_cubit.dart';
import 'package:elhamdania/moduel/define_screen/get_screens.dart';
import 'package:elhamdania/moduel/home/home.dart';
import 'package:elhamdania/moduel/splash_screen/splash_scren.dart';
import 'package:elhamdania/share/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Screens {
  String? image;
  String? title;
  String? subTitle;
  String? subsTitle;
  Screens({this.image, this.subTitle, this.title, this.subsTitle});
}

class DefineScreen extends StatefulWidget {
  DefineScreen({Key? key}) : super(key: key);

  @override
  State<DefineScreen> createState() => _DefineScreenState();
}

class _DefineScreenState extends State<DefineScreen> {
  PageController controller = PageController();

  String page = '1';

  List<Screens> screen = [
    Screens(
        image: 'images/w.png',
        title: "مجتمع الحمدانية",
        subsTitle: "العروض والخدمات المتاحة داخل الحي",
        subTitle: 'نجعل من السهل العثور على جميع'),
    Screens(
        image: 'images/x.png',
        title: "اضف عرضك بسهولة",
        subTitle: 'سهولة اضافة العروض والاعلانات ',
        subsTitle: "خلال دقائق فقط")
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.only(top: 40.h, right: 20.w, left: 20.w),
              child: Column(children: [
                InkWell(
                  onTap: () {
                    CacheHelper.setShared(key: kUid, value: '112')
                        .then((value) {
                      nextPageUntil(
                        context: context,
                        page: Home(),
                      );
                      HomeCubit.get(context).getDetails();
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          defaultText(
                              txt: '»',
                              fontSize: 25.sp,
                              fontWeight: FontWeight.bold),
                          defaultText(
                              txt: 'تخطي',
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold),
                        ],
                      ),
                      // if (page == '1' || page == '3')
                      SmoothPageIndicator(
                        controller: controller,
                        count: 2,
                        effect: WormEffect(
                            activeDotColor: Colors.red,
                            dotColor: secandColor,
                            offset: 20,
                            dotHeight: 8,
                            dotWidth: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Expanded(
                  child: Container(
                    height: 750.h,
                    width: double.infinity,
                    child: PageView(
                      controller: controller,
                      onPageChanged: (int index) {
                        if (index == 0) {
                          setState(() {
                            page = '1';
                          });
                        } else if (index == 1) {
                          setState(() {
                            page = '2';
                          });
                        }
                        // else if (index == 2) {
                        //   setState(() {
                        //     page = '3';
                        //   });
                        // }
                        print(page);
                      },
                      children: [
                        // SplashScreen(),
                        Container(
                          height: 600.h,
                          width: double.infinity,
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                'images/step2.svg',
                                height: 400,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                height: 19,
                              ),
                              defaultText(
                                txt: "مجتمع الحمدانية",
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              defaultText(
                                txt: "العروض والخدمات المتاحة داخل الحي",
                                fontSize: 15.sp,
                                fontWeight: FontWeight.normal,
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              defaultText(
                                txt: 'نجعل من السهل العثور على جميع',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.normal,
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 600.h,
                          width: double.infinity,
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                'images/ste3.svg',
                                height: 400.h,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                height: 19.h,
                              ),
                              defaultText(
                                txt: "اضف عرضك بسهولة",
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              defaultText(
                                txt: 'سهولة اضافة العروض والاعلانات ',
                                fontSize: 15.sp,
                                fontWeight: FontWeight.normal,
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              defaultText(
                                txt: "خلال دقائق فقط",
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              )
                            ],
                          ),
                        ),
                      ],
                      // itemBuilder: (context, index) => getScreens(screen[index]),
                      // itemCount: screen.length,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                if (page == '2')
                  InkWell(
                    onTap: () {
                     CacheHelper.setShared(key: kUid, value: '112')
                        .then((value) {
                      nextPageUntil(
                        context: context,
                        page: Home(),
                      );
                      HomeCubit.get(context).getDetails();
                    });
                    },
                    child: Container(
                      height: 30.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: mainColor),
                      child: Center(
                          child: defaultText(
                              txt: 'البدء',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                SizedBox(
                  height: 20,
                ),
                // if (page == '2' || page == '3')
                SmoothPageIndicator(
                  controller: controller,
                  count: 2,
                  effect: WormEffect(
                      activeDotColor: mainColor,
                      dotColor: secandColor,
                      offset: 20,
                      dotHeight: 8,
                      dotWidth: 16),
                ),
                SizedBox(
                  height: 20.h,
                )
              ]),
            ),
          );
        });
  }
}
