import 'package:elhamdania/componant/componant.dart';
import 'package:elhamdania/model/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget getSearch(Data data) {
  return Container(
    height: 70.h,
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: ListTile(
          title: defaultText(
            txt: data.name,
            color: Colors.black,
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
          ),
        
          subtitle: Text(
            '${data.description}',
            textDirection: TextDirection.rtl,
            maxLines: 2,
            style: TextStyle(
              color: Colors.grey,
              fontFamily: 'GE_SS_Two',
              fontSize: 11,
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
