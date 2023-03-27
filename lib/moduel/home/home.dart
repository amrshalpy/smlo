import 'package:elhamdania/componant/componant.dart';
import 'package:elhamdania/componant/style.dart';
import 'package:elhamdania/cubit/Home_state.dart';
import 'package:elhamdania/cubit/home_cubit.dart';
import 'package:elhamdania/model/product.dart';
import 'package:elhamdania/moduel/communication/add.dart';
import 'package:elhamdania/moduel/details/details.dart';
import 'package:elhamdania/moduel/home/get_new_offers.dart';
import 'package:elhamdania/moduel/home/get_products.dart';
import 'package:elhamdania/moduel/home/get_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index1 = 0;
  ScrollController controller = ScrollController();
  ScrollController controllerX = ScrollController();
  var txtController = TextEditingController();
  bool isSearch = false;
  bool isNoty = false;
  bool isPrivacy = false;
  bool isAbout = false;
  bool isUpdate = false;
  bool isMomaiaz = false;

  void _goToElement(int index) {
    controller.animateTo(
        (120.0 *
            index), // 100 is the height of container and index of 6th element is 5
        duration: const Duration(seconds: 2),
        curve: Curves.fastOutSlowIn);
  }

  Uri url = Uri.parse('https://momyyaz.com/');
  Future<void> getLocationMo() async {
    await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );
  }

  final Uri whatsMom = Uri.parse('whatsapp://send?phone=⁦+20 109 698 3281⁩');

  var scafolldKey = GlobalKey<ScaffoldState>();
  void openDrawer() {
    scafolldKey.currentState!.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> backScreen() async {
      setState(() {
        isSearch = false;
        isMomaiaz = false;

        isNoty = false;
        isPrivacy = false;
        isAbout = false;
        isUpdate = false;

        txtController.clear();
      });
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => Home()));
      return true;
    }

    return BlocProvider(
        create: (context) => HomeCubit()
          ..getDetails()
          ..getCategories()
          ..getNewOffers()
          ..getPrivacy(),
        // ..fetchData(),

        child: WillPopScope(
          onWillPop: backScreen,
          child: Scaffold(
            // drawerEnableOpenDragGesture: false,
            key: scafolldKey,
            drawer: Drawer(
                child: Stack(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 40.h, bottom: 15.h, right: 20.w, left: 30.h),
                      child: Row(
                        children: [
                          Container(
                            child: Image.asset(
                              'images/hamdania.png',
                              height: 100.h,
                              width: 170.w,
                              fit: BoxFit.contain,
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 2,
                      color: txtColor,
                      indent: 10,
                      endIndent: 20,
                      height: .001,
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    InkWell(
                      onTap: () {
                        scafolldKey.currentState!.closeDrawer();
                        nextPage(context: context, page: Home());
                      },
                      child: Container(
                        height: 40.h,
                        width: 250.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: mainColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            defaultText(
                                txt: 'الصفحة الرئيسية',
                                color: txt2Color,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.bold),
                            SizedBox(
                              width: 10.w,
                            ),
                            Icon(
                              Icons.arrow_circle_right_outlined,
                              size: 31,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    InkWell(
                      onTap: () {
                        scafolldKey.currentState!.closeDrawer();
                        setState(() {
                          isPrivacy = true;
                        });
                      },
                      child: Container(
                        height: 40.h,
                        width: 250.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: mainColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            defaultText(
                                txt: 'سياسة الاستخدام',
                                color: txt2Color,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.bold),
                            SizedBox(
                              width: 10.w,
                            ),
                            SvgPicture.asset(
                              'images/01.svg',
                              semanticsLabel: 'Acme Logo',
                              height: 30.h,
                              width: 30,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isAbout = true;
                        });
                        scafolldKey.currentState!.closeDrawer();
                      },
                      child: Container(
                        height: 40.h,
                        width: 250.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: mainColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            defaultText(
                                txt: 'معلومات التطبيــق',
                                color: txt2Color,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.bold),
                            SizedBox(
                              width: 10.w,
                            ),
                            SvgPicture.asset(
                              'images/02.svg',
                              height: 30.h,
                              width: 30.w,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    InkWell(
                      onTap: () {
                        scafolldKey.currentState!.closeDrawer();
                      },
                      child: Container(
                        height: 40.h,
                        width: 250.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: mainColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            defaultText(
                                txt: 'تقيــــــم التطبيــق',
                                color: txt2Color,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.bold),
                            SizedBox(
                              width: 10.w,
                            ),
                            SvgPicture.asset(
                              'images/03.svg',
                              height: 30.h,
                              width: 30.w,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    InkWell(
                      onTap: () {
                        scafolldKey.currentState!.closeDrawer();
                        nextPage(context: context, page: Communication());
                      },
                      child: Container(
                        height: 40.h,
                        width: 250.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: mainColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            defaultText(
                                txt: 'اتصـــل بنـــا',
                                color: txt2Color,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.bold),
                            SizedBox(
                              width: 10.w,
                            ),
                            SvgPicture.asset(
                              'images/04.svg',
                              height: 30.h,
                              width: 30.w,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    InkWell(
                      onTap: () {
                        scafolldKey.currentState!.closeDrawer();
                        setState(() {
                          isUpdate = true;
                          isAbout = false;
                        });
                      },
                      child: Container(
                        height: 40.h,
                        width: 250.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: mainColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            defaultText(
                                txt: 'اعدادات التطبيــق',
                                color: txt2Color,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.bold),
                            SizedBox(
                              width: 10.w,
                            ),
                            SvgPicture.asset(
                              'images/05.svg',
                              height: 30.h,
                              width: 30.w,
                            )
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 50.h,
                      ),
                      child: InkWell(
                        onTap: () {
                          scafolldKey.currentState!.closeDrawer();
                          //  nextPage(context: context, page: Momaiaze());
//
                          setState(() {
                            isMomaiaz = !isMomaiaz;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            defaultText(
                                txt: ' مميز ',
                                color: mainColor,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold),
                            defaultText(
                                txt: 'تصميم وتطوير',
                                color: txtColor,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )),

            backgroundColor: groundColor,
            body: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Stack(
                  children: [
                    Stack(
                      children: [
                        Image.asset('images/ground2.png'),
                        Column(
                          children: [
                            Container(
                              height: 130.h,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 35.h, left: 10.w, right: 10.w),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              isNoty = false;
                                              isSearch = false;
                                              isAbout = false;
                                              isPrivacy = false;
                                            });
                                            openDrawer();
                                          },
                                          child: CircleAvatar(
                                            maxRadius: 18,
                                            backgroundColor: mainColor,
                                            child: Icon(
                                              Icons.menu,
                                              color: txtColor,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 9.w,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              isNoty = !isNoty;

                                              isSearch = false;
                                              isAbout = false;
                                              isPrivacy = false;
                                            });
                                            // cubit.getNewOffers();
                                            print('data');
                                          },
                                          child: CircleAvatar(
                                            maxRadius: 18,
                                            backgroundColor: mainColor,
                                            child: Icon(
                                              Icons.notifications_sharp,
                                              color: txtColor,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Container(
                                          width: 150.w,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              defaultText(
                                                  txt: 'الحمدانية',
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.bold),
                                              SvgPicture.asset(
                                                  'images/logox.svg'),
                                              defaultText(
                                                  txt: 'مجتمع',
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.bold),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            nextPage(
                                                context: context,
                                                page: Communication());
                                            setState(() {
                                              isNoty = false;
                                              isSearch = false;
                                              isAbout = false;
                                              isPrivacy = false;
                                            });
                                          },
                                          child: CircleAvatar(
                                            maxRadius: 18,
                                            backgroundColor: mainColor,
                                            child: Icon(
                                              Icons.add,
                                              color: txtColor,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 9.w,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              isSearch = !isSearch;
                                              isNoty = false;

                                              isAbout = false;
                                              isPrivacy = false;
                                              txtController.text = '';
                                              txtController.clear();
                                            });
                                          },
                                          child: CircleAvatar(
                                            maxRadius: 18,
                                            backgroundColor: mainColor,
                                            child: Icon(
                                              Icons.search_sharp,
                                              color: txtColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    BlocConsumer<HomeCubit, HomeState>(
                                        listener: (context, state) {},
                                        builder: (context, state) {
                                          HomeCubit cubit =
                                              HomeCubit.get(context);
                                          return cubit.categoriesModel != null
                                              ? Container(
                                                  height: 30.h,
                                                  width: double.infinity,
                                                  child: cubit.categoriesModel!
                                                          .data!.isNotEmpty
                                                      ? ListView.separated(
                                                          controller:
                                                              controller,
                                                          separatorBuilder:
                                                              (context,
                                                                      index) =>
                                                                  SizedBox(
                                                                    width: 13.w,
                                                                  ),
                                                          itemCount: cubit
                                                              .categoriesModel!
                                                              .data!
                                                              .length,
                                                          reverse: true,
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          shrinkWrap: true,
                                                          physics:
                                                              BouncingScrollPhysics(),
                                                          itemBuilder: (context,
                                                                  index) =>
                                                              GestureDetector(
                                                                onTap: () {
                                                                  setState(() {
                                                                    cubit.getcategoryId(cubit
                                                                        .categoriesModel!
                                                                        .data![
                                                                            index]
                                                                        .id!);
                                                                    index1 =
                                                                        index;
                                                                  });
                                                                  cubit.getDetails(
                                                                      categoryIdx:
                                                                          cubit
                                                                              .categoryId);
                                                                  _goToElement(
                                                                      index1 -
                                                                          1);
                                                                  if (index1 ==
                                                                      index) {}
                                                                },
                                                                child: Container(
                                                                    height: 20.h,
                                                                    // width: 100.w,
                                                                    decoration: BoxDecoration(
                                                                      color: index1 ==
                                                                              index
                                                                          ? txtColor
                                                                          : mainColor,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              7),
                                                                    ),
                                                                    child: Center(
                                                                      child: defaultText(
                                                                          txt:
                                                                              '   ${cubit.categoriesModel!.data![index].name}   ',
                                                                          color: index1 == index
                                                                              ? mainColor
                                                                              : txtColor,
                                                                          fontSize: 12
                                                                              .sp,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    )),
                                                              ))
                                                      : Center(
                                                          child:
                                                              CupertinoActivityIndicator()),
                                                )
                                              : Center(
                                                  child:
                                                      CupertinoActivityIndicator());
                                        })
                                  ],
                                ),
                              ),
                            ),
                            BlocConsumer<HomeCubit, HomeState>(
                                listener: (context, state) {},
                                builder: (context, state) {
                                  HomeCubit cubit = HomeCubit.get(context);
                                  return Expanded(
                                      child: cubit.detailsModel != null
                                          ? Container(
                                              // height: 500.h,
                                              width: double.infinity,
                                              child: Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 5, left: 5),
                                                  child: cubit.detailsModel!
                                                          .data!.isNotEmpty
                                                      ? ListView.separated(
                                                          // controller: cubit
                                                          //             .detailsModel!
                                                          //             .links!
                                                          //             .next ==
                                                          //         null
                                                          //     ? controllerX
                                                          //     : cubit.controller,
                                                          physics:
                                                              BouncingScrollPhysics(),
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          shrinkWrap: true,
                                                          controller:
                                                              cubit.sController,
                                                          itemBuilder: (context, index) => getProduct(
                                                              cubit
                                                                  .detailsModel!
                                                                  .data![index],
                                                              context),
                                                          separatorBuilder:
                                                              (context,
                                                                      index) =>
                                                                  SizedBox(
                                                                    height:
                                                                        10.h,
                                                                  ),
                                                          itemCount: cubit
                                                              .detailsModel!
                                                              .data!
                                                              .length)
                                                      : cubit.pages > 1
                                                          ? Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 150
                                                                          .h),
                                                              child: Container(
                                                                height: 40.h,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  // border: Border.all(
                                                                  //     color: Colors.black,
                                                                  //     width: .3)
                                                                ),
                                                                child: Column(
                                                                  children: [
                                                                    Center(
                                                                      child: defaultText(
                                                                          txt:
                                                                              '   لا تتوفر اي عروض اخري للعودة للاعلي   ',
                                                                          color:
                                                                              txtColor,
                                                                          fontSize: 15
                                                                              .sp,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          10.h,
                                                                    ),
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        cubit
                                                                            .reducePage();
                                                                      },
                                                                      child: defaultText(
                                                                          txt:
                                                                              ' اضغط هنا ',
                                                                          color:
                                                                              mainColor,
                                                                          fontSize: 15
                                                                              .sp,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            )
                                                          : Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 150
                                                                          .h),
                                                              child: Container(
                                                                height: 40.h,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  // border: Border.all(
                                                                  //     color: Colors.black,
                                                                  //     width: .3)
                                                                ),
                                                                child: Column(
                                                                  children: [
                                                                    Center(
                                                                      child: defaultText(
                                                                          txt:
                                                                              '  لا تتوفر اي عروض  ',
                                                                          color:
                                                                              txtColor,
                                                                          fontSize: 15
                                                                              .sp,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            )),
                                            )
                                          : Center(
                                              child:
                                                  CupertinoActivityIndicator(),
                                            ));
                                })
                          ],
                        ),
                      ],
                    ),
                    // if (isSearch == true)

                    BlocConsumer<HomeCubit, HomeState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          HomeCubit cubit = HomeCubit.get(context);
                          return Padding(
                            padding: EdgeInsets.only(
                              top: 35.h,
                              left: 10.w,
                            ),
                            child: AnimatedContainer(
                              duration: Duration(seconds: 4),
                              curve: Curves.bounceInOut,
                              child: Container(
                                height: isSearch == true ? 40.h : 0,
                                width: isSearch == true ? 290.w : 0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      width: .05, color: Colors.black),
                                ),
                                child: isSearch == true
                                    ? Center(
                                        child: TextField(
                                          controller: txtController,
                                          onChanged: (txt) {
                                            cubit.getSearchDetails(txt: txt);
                                          },
                                          textAlign: TextAlign.end,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'search',
                                              prefix: txtController == null
                                                  ? Icon(Icons.search)
                                                  : IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          txtController.clear();
                                                        });
                                                      },
                                                      icon: Icon(
                                                        Icons.clear_rounded,
                                                        size: 14,
                                                      )),
                                              contentPadding: EdgeInsets.only(
                                                  right: 10.w, bottom: 7.h)),
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            ),
                          );
                        }),

                    BlocConsumer<HomeCubit, HomeState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          HomeCubit cubit = HomeCubit.get(context);

                          return cubit.searchOffers != null &&
                                  txtController.text != ''
                              ? Padding(
                                  padding: EdgeInsets.only(
                                      top: 85.h, left: 5.w, right: 5.w),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Column(
                                      children: [
                                        cubit.searchOffers!.data!.isNotEmpty
                                            ? Expanded(
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 20.h, bottom: 20.h),
                                                  child: ListView.builder(
                                                    shrinkWrap: true,
                                                    physics:
                                                        ClampingScrollPhysics(),
                                                    itemBuilder:
                                                        (context, index) {
                                                      var search = cubit
                                                          .searchOffers!
                                                          .data![index];
                                                      return InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            isSearch = false;
                                                            txtController
                                                                .clear();
                                                            txtController.text =
                                                                '';
                                                          });
                                                          nextPage(
                                                              context: context,
                                                              page: Details(
                                                                desc: search.longDescription !=
                                                                        ''
                                                                    ? search
                                                                        .longDescription
                                                                    : search
                                                                        .description,
                                                                images: search
                                                                    .images,
                                                                location: search
                                                                    .address,
                                                                logo:
                                                                    search.logo,
                                                                name:
                                                                    search.name,
                                                                phone: search
                                                                    .phone,
                                                                whatsapp: search
                                                                    .whatsapp,
                                                              ));
                                                        },
                                                        child: getSearch(cubit
                                                            .searchOffers!
                                                            .data![index]),
                                                      );
                                                    },
                                                    itemCount: cubit
                                                        .searchOffers!
                                                        .data!
                                                        .length,
                                                  ),
                                                ),
                                              )
                                            : Center(
                                                child:
                                                    CupertinoActivityIndicator())
                                      ],
                                    ),
                                  ),
                                )
                              : SizedBox();
                        }),

                    BlocConsumer<HomeCubit, HomeState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          HomeCubit cubit = HomeCubit.get(context);

                          return cubit.offer != null && isNoty == true
                              ? Padding(
                                  padding: EdgeInsets.only(
                                      top: 80.h, left: 5.w, right: 5.w),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: cubit.offer!.data!.isNotEmpty
                                        ? Padding(
                                            padding: EdgeInsets.only(
                                                top: 20.h, bottom: 20.h),
                                            child: ListView.builder(
                                              physics: BouncingScrollPhysics(),
                                              shrinkWrap: true,
                                              itemBuilder: (context, index) {
                                                var offers =
                                                    cubit.offer!.data![index];
                                                return InkWell(
                                                  onTap: () {
                                                    nextPage(
                                                        context: context,
                                                        page: Details(
                                                          desc: offers.longDescription !=
                                                                  ''
                                                              ? offers
                                                                  .longDescription
                                                              : offers
                                                                  .description,
                                                          images: offers.images,
                                                          location:
                                                              offers.address,
                                                          logo: offers.logo,
                                                          name: offers.name,
                                                          phone: offers.phone,
                                                          whatsapp:
                                                              offers.whatsapp,
                                                        ));
                                                    setState(() {
                                                      isNoty = false;
                                                    });
                                                  },
                                                  child: getOffers(cubit
                                                      .offer!.data![index]),
                                                );
                                              },
                                              itemCount:
                                                  cubit.offer!.data!.length,
                                            ),
                                          )
                                        : Center(
                                            child:
                                                CupertinoActivityIndicator()),
                                  ),
                                )
                              : SizedBox();
                        }),

                    BlocConsumer<HomeCubit, HomeState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          HomeCubit cubit = HomeCubit.get(context);

                          return isPrivacy == true
                              ? Padding(
                                  padding: EdgeInsets.only(
                                      top: 80.h, left: 5.w, right: 5.w),
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height - 70,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      border: Border.all(
                                          color: Colors.grey, width: .03),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: SingleChildScrollView(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 40.h,
                                            left: 10.w,
                                            right: 10.w,
                                            bottom: 10.h),
                                        child: ReadMoreText(
                                          '${cubit.privacy!.data!.privacyPolicy}',
                                          trimLines: 37,
                                          colorClickableText: Colors.pink,
                                          textDirection: TextDirection.rtl,
                                          textAlign: TextAlign.center,
                                          trimMode: TrimMode.Line,
                                          trimCollapsedText: 'عرض المزيد',
                                          trimExpandedText: 'عرض اقل',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "GE_SS_Two",
                                            color: txtColor,
                                          ),
                                          moreStyle: TextStyle(
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "GE_SS_Two",
                                            color: Colors.redAccent,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : SizedBox();
                        }),

                    BlocConsumer<HomeCubit, HomeState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          HomeCubit cubit = HomeCubit.get(context);

                          return isAbout == true
                              ? Padding(
                                  padding: EdgeInsets.only(
                                      top: 80.h, left: 5.w, right: 5.w),
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height - 70,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      border: Border.all(
                                          color: Colors.grey, width: .03),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: SingleChildScrollView(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 50.h,
                                            left: 10.w,
                                            right: 10.w,
                                            bottom: 10.h),
                                        child: ReadMoreText(
                                          '${cubit.privacy!.data!.about}',
                                          trimLines: 37,
                                          colorClickableText: Colors.pink,
                                          textDirection: TextDirection.rtl,
                                          textAlign: TextAlign.center,
                                          trimMode: TrimMode.Line,
                                          trimCollapsedText: 'عرض المزيد',
                                          trimExpandedText: 'عرض اقل',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "GE_SS_Two",
                                            color: txtColor,
                                          ),
                                          moreStyle: TextStyle(
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "GE_SS_Two",
                                            color: Colors.redAccent,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : SizedBox();
                        }),

                    if (isUpdate == true)
                      Padding(
                        padding:
                            EdgeInsets.only(top: 80.h, left: 10.w, right: 10.w),
                        child: Container(
                          height: MediaQuery.of(context).size.height - 70,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(.8),
                            // border: Border.all(color: Colors.grey, width: .03),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Container(
                                margin:
                                    EdgeInsets.only(right: 10.w, left: 10.w),
                                height: 70.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  border: Border.all(
                                      color: Colors.grey, width: .03),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Center(
                                    child: Padding(
                                  padding: EdgeInsets.only(top: 10.h),
                                  child: Column(
                                    children: [
                                      defaultText(
                                          txt:
                                              '  لا يوجد تحديثات جديدة للتطبيق الان  ',
                                          color: txtColor,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            isUpdate = false;
                                          });
                                        },
                                        child: Row(
                                          children: [
                                            defaultText(
                                                txt: ' »   ',
                                                color: txtColor,
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.bold),
                                            defaultText(
                                                txt: 'خروج ',
                                                color: Colors.redAccent,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ))),
                          ),
                        ),
                      )
                  ],
                ),
                // cubit.pages > 1 && cubit.detailsModel!.data!.isNotEmpty
                //     ? Positioned(
                //         bottom: 40.h,
                //         right: 10.w,
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.end,
                //           children: [
                //             InkWell(
                //               onTap: () {
                //                 if (cubit.detailsModel!.links!.next == null) {
                //                   cubit.reducePages();
                //                   controllerX.animateTo(0.0,
                //                       duration: Duration(seconds: 2),
                //                       curve: Curves.easeInOut);
                //                 } else {
                //                   cubit.reducePages();
                //                   cubit.controller.animateTo(0.0,
                //                       duration: Duration(seconds: 2),
                //                       curve: Curves.easeInOut);
                //                 }
                //               },
                //               child: AnimatedContainer(
                //                 duration: Duration(seconds: 3),
                //                 curve: Curves.bounceInOut,
                //                 child: CircleAvatar(
                //                   backgroundColor: Colors.blueAccent.shade100,
                //                   maxRadius: cubit.isTop == true ? 20 : 0,
                //                   child: Icon(
                //                     Icons.arrow_upward,
                //                     color: Colors.white,
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           ],
                //         ),
                //       )
                //     : SizedBox(),

                Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        color: Colors.grey.shade300),
                    width: isMomaiaz == true ? double.infinity : 0,
                    height: isMomaiaz == true ? 230.w : 0,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 30.h),
                        child: isMomaiaz == true
                            ? Column(
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              isMomaiaz = false;
                                            });
                                          },
                                          icon: Icon(
                                            Icons.arrow_back,
                                            color: Colors.black,
                                          )),
                                      SizedBox(
                                        width: 50.w,
                                      ),
                                      defaultText(
                                          txt: 'للاتصال بنا',
                                          color: txtColor,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold)
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                    child: Divider(
                                      endIndent: 20,
                                      indent: 20,
                                      thickness: 2,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          getLocationMo();
                                          scafolldKey.currentState!
                                              .closeDrawer();
                                          setState(() {
                                            isMomaiaz = false;
                                          });
                                        },
                                        child: Container(
                                          height: isMomaiaz == true ? 30.h : 0,
                                          width: isMomaiaz == true ? 90.w : 0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            color: mainColor,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
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
                                      SizedBox(
                                        width: isMomaiaz == true ? 10 : 0,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          launchUrl(whatsMom);
                                          scafolldKey.currentState!
                                              .closeDrawer();
                                          setState(() {
                                            isMomaiaz = false;
                                          });
                                        },
                                        child: Container(
                                            height:
                                                isMomaiaz == true ? 30.h : 0,
                                            width: isMomaiaz == true ? 90.w : 0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              color: mainColor,
                                            ),
                                            child: isMomaiaz == true
                                                ? Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      defaultText(
                                                          txt: 'واتساب',
                                                          color: txtColor,
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      // SizedBox(
                                                      //   width: 5.w,
                                                      // ),
                                                      SvgPicture.asset(
                                                        'images/wwww.svg',
                                                        height: 22.h,
                                                        width: 22.w,
                                                      )
                                                    ],
                                                  )
                                                : SizedBox()),
                                      ),
                                      SizedBox(
                                        width: isMomaiaz == true ? 10 : 0,
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          launch("tel://⁦+20 109 698 3281⁩");
                                          scafolldKey.currentState!
                                              .closeDrawer();
                                          setState(() {
                                            isMomaiaz = false;
                                          });
                                        },
                                        child: Container(
                                            height:
                                                isMomaiaz == true ? 30.h : 0,
                                            width: isMomaiaz == true ? 80.w : 0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              color: mainColor,
                                            ),
                                            child: isMomaiaz == true
                                                ? Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      defaultText(
                                                          txt: 'اتصال',
                                                          color: txtColor,
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      SizedBox(
                                                        width: 10.w,
                                                      ),
                                                      SvgPicture.asset(
                                                        'images/04.svg',
                                                        height: 15.h,
                                                        width: 15.w,
                                                      )
                                                    ],
                                                  )
                                                : SizedBox()),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            : SizedBox(),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
