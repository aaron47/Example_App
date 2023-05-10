


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'custom_ripple_effect.dart';

class CustomButtomBar extends StatelessWidget {
  const CustomButtomBar({
    super.key, required this.imagePath, required this.heroTag, required this.categoryName,
  });
  final String imagePath;
  final String heroTag;
  final String categoryName;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 80.h,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.withOpacity(0.2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "MADE WITH LOVE BY SLOTH-LAB",
                      style: TextStyle(
                        fontFamily: "Gotham",
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color.fromRGBO(150, 150, 150, 1),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 250.w),
                    alignment: Alignment.centerRight,
                    child: Text(
                      categoryName,
                      style: TextStyle(
                        fontFamily: "Gotham",
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color.fromRGBO(150, 150, 150, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Hero(
              tag: heroTag,
              child: CustomImageRippleEffect(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: Colors.white,
                      width: 10.0,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      imagePath,
                    ),
                  ),
                ),
                onTap: () {
                  Get.back();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
