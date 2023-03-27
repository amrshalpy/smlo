import 'package:date_count_down/date_count_down.dart';
import 'package:datetime_countdown/datetime_countdown.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:elhamdania/componant/componant.dart';
import 'package:elhamdania/componant/style.dart';
import 'package:elhamdania/cubit/home_cubit.dart';
import 'package:elhamdania/model/details.dart';
import 'package:elhamdania/model/product.dart';
import 'package:elhamdania/moduel/details/details.dart';
import 'package:elhamdania/moduel/home/get_story.dart';
import 'package:elhamdania/moduel/home/story_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:status_view/status_view.dart';
import 'package:story_view/story_view.dart';

Widget getProduct(Data product, BuildContext context) {
  var h = MediaQuery.of(context).size.height;
  var w = MediaQuery.of(context).size.width;

  String now = DateTime.now().toString();
  return now != product.endsAt
      ? InkWell(
          onTap: () {
            nextPage(
                context: context,
                page: Details(
                  storyImage: product.storyimage,
                  location: product.address,
                  logo: product.logo,
                  desc: product.longDescription != ''
                      ? product.longDescription
                      : product.description,
                  name: product.name,
                  images: product.images,
                  phone: product.phone,
                  whatsapp: product.whatsapp,
                ));
          },
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: .3, color: txtColor),
                ),
                // height: 260,
                width: double.infinity,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: w * .6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                defaultText(
                                    txt: product.name,
                                    color: txtColor,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold),
                                SizedBox(
                                  height: 4.h,
                                ),
                                Text(
                                  maxLines: 2,
                                  textDirection: TextDirection.rtl,
                                  '${product.description}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'GE_SS_Two',
                                    fontSize: 9,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                SizedBox(
                                  height: 13.h,
                                ),
                                Text(
                                  softWrap: true,
                                  textDirection: TextDirection.rtl,
                                  product.category!.name != null
                                      ? '${product.category!.name}'
                                      : ' ',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'GE_SS_Two',
                                    fontSize: 11,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {
                             if (product.videos!.isNotEmpty||product.storyimage!.isNotEmpty)
                              nextPage(
                                  context: context,
                                  page: MoreStories(
                                    images: product.images,
                                    video: product.videos,
                                    name: product.name,
                                    storyImages: product.storyimage,
                                  ));

                              // for (var video in product.videos!) {
                              //   HomeCubit.get(context).openFile(video.file,product.name);
                              // }
                            },
                            child: StatusView(
                              radius: 40,
                              spacing: 15,
                              strokeWidth: 2,
                              indexOfSeenStatus: 2,
                              numberOfStatus: product.storyimage!.length +
                                  product.videos!.length,
                              padding: 4,
                              centerImageUrl: product.image != null
                                  ? "${product.image}"
                                  : 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.iconfinder.com%2Ficons%2F4748139%2Fempty_state_gallery_image_images_photo_photos_pictures_icon&psig=AOvVaw2u7g9iYTrC3yFm7_BJn-qO&ust=1677889123330000&source=images&cd=vfe&ved=0CA8QjRxqFwoTCNColJ2-vv0CFQAAAAAdAAAAABAK',
                              seenColor: Colors.grey,
                              unSeenColor: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 10.h,
                              ),
                              child: InkWell(
                                onTap: () {
                                  nextPage(
                                      context: context,
                                      page: Details(
                                        storyImage: product.storyimage,
                                        location: product.address,
                                        logo: product.logo,
                                        desc: product.longDescription != ''
                                            ? product.longDescription
                                            : product.description,
                                        name: product.name,
                                        images: product.images,
                                        phone: product.phone,
                                        whatsapp: product.whatsapp,
                                      ));
                                },
                                child: Container(
                                    height: 30,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: mainColor,
                                    ),
                                    child: Center(
                                      child: defaultText(
                                          txt: ' لمعرفة التفاصيل',
                                          color: txtColor,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                            child: Container(
                              width: 140.w,
                              child: Column(
                                children: [
                                  defaultText(
                                      txt: 'باقي على العرض',
                                      color: Colors.grey,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        'images/time icon (1).svg',
                                        height: 20.h,
                                        width: 20.w,
                                      ),
                                      CountDownText(
                                        due:
                                            DateTime.parse("${product.endsAt}"),
                                        finishedText: 'انتهاء العرض',
                                        showLabel: false,
                                        longDateName: true,
                                        daysTextLong: ":",
                                        hoursTextLong: ":",
                                        minutesTextLong: ":",
                                        secondsTextLong: "",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.bold,
                                          // fontFamily: 'GE_SS_Two',
                                        ),
                                      )
                                      // color: Colors.red,
                                      // fontSize: 15.sp,
                                      // fontWeight: FontWeight.bold),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: Container(
                                height: 30.h,
                                width: 80.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: mainColor,
                                ),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      defaultText(
                                          txt: ' ${product.discount}  ',
                                          color: txtColor,
                                          fontSize: 9.sp,
                                          fontWeight: FontWeight.bold),
                                      // defaultText(
                                      //     txt: 'وفر',
                                      //     color: txtColor,
                                      //     fontSize: 11,
                                      //     fontWeight: FontWeight.bold),
                                    ])),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                    left: 10.w,
                    top: 50.h,
                  ),
                  child: Container(
                    height: 30.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        image: product.logo != null
                            ? DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage('${product.logo}'))
                            : DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.iconfinder.com%2Ficons%2F4748139%2Fempty_state_gallery_image_images_photo_photos_pictures_icon&psig=AOvVaw2u7g9iYTrC3yFm7_BJn-qO&ust=1677889123330000&source=images&cd=vfe&ved=0CA8QjRxqFwoTCNColJ2-vv0CFQAAAAAdAAAAABAK'))),
                  )),
            ],
          ),
        )
      : SizedBox();
}
