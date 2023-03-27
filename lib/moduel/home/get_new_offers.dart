import 'package:elhamdania/componant/componant.dart';
import 'package:elhamdania/model/new_offers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget getOffers(Data data) {
  return Container(
    height: 70.h,
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: ListTile(
          title: defaultText(
            txt: data.name,
            color: Colors.black,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
          subtitle: Text(
            '${data.description}',
            textDirection: TextDirection.rtl,
            maxLines: 2,
            style: TextStyle(
              color: Colors.grey,
              fontFamily: 'GE_SS_Two',
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
          trailing: CircleAvatar(
            maxRadius: 40,
            backgroundImage: NetworkImage('${data.image}'),
          ),
        ),
      ),
    ),
  );
}
