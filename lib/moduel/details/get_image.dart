import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

getImage(context, String? image) {
  showModalBottomSheet(
      backgroundColor: Colors.grey[300],
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
      )),
      context: context,
      isScrollControlled: true,
      builder: (context) => Container(
            height: 800.h,
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Divider(
                  height: 20,
                  thickness: 3,
                  color: Colors.grey,
                  indent: 130,
                  endIndent: 130,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Expanded(
                  child: Container(
                    height: 600.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image: NetworkImage(image!),
                          fit: BoxFit.contain,
                        )),
                    // child: Image.asset(
                    //   image!,
                    //   height: 600.h,
                    //   width: double.infinity,
                    //   fit: BoxFit.contain,
                    // ),
                  ),
                )
              ],
            ),
          ));
}
