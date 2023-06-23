import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_widget_cache.dart';
import 'package:glass/glass.dart';

import '../shared/tablet_detector.dart';
import 'custom_ripple_effect.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    super.key,
    required this.imagePath,
    required this.heroTag,
    required this.categoryName,
  });
  final String imagePath;
  final String heroTag;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    final isTablet = TabletDetector.isTablet(MediaQueryData.fromWindow(WidgetsBinding.instance.window));
    return isTablet
        ? CustomBottomBarTablet(
            categoryName: categoryName,
            heroTag: heroTag,
            imagePath: imagePath,
          )
        : CustomBottomBarMobile(
            categoryName: categoryName,
            heroTag: heroTag,
            imagePath: imagePath,
          );
  }
}

class CustomBottomBarTablet extends StatelessWidget {
  const CustomBottomBarTablet({
    super.key,
    required this.categoryName,
    required this.heroTag,
    required this.imagePath,
  });

  final String categoryName;
  final String heroTag;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        height: 125.h,
        color: Colors.transparent,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 5.h,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Colors.white, Colors.grey],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60.h,
                      width: MediaQuery.of(context).size.width,
                      // color: Colors.grey.withOpacity(0.2),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 20),
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Text(
                                  "MADE WITH LOVE BY SLOTH-LAB",
                                  style: TextStyle(
                                    fontFamily: "Gotham",
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                    color: const Color.fromRGBO(150, 150, 150, 1),
                                  ),
                                ),
                                Image.asset("assets/sloth.png")
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 250.w),
                            alignment: Alignment.centerRight,
                            child: Text(
                              categoryName,
                              style: TextStyle(
                                fontFamily: "Gotham",
                                fontSize: 28.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromRGBO(150, 150, 150, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ).asGlass(
                      tintColor: Colors.transparent,
                      clipBorderRadius: BorderRadius.circular(15.0),
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
      ),
    );
  }
}

class CustomBottomBarMobile extends StatelessWidget {
  const CustomBottomBarMobile({
    super.key,
    required this.categoryName,
    required this.heroTag,
    required this.imagePath,
  });

  final String categoryName;
  final String heroTag;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        height: 125.h,
        color: Colors.transparent,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: double.infinity,
                    height: 5.h,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Colors.white, Colors.grey],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60.h,
                    width: MediaQuery.of(context).size.width,
                    // color: Colors.grey.withOpacity(0.2),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 20),
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: const [],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 20),
                          alignment: Alignment.centerRight,
                          child: Text(
                            categoryName,
                            style: const TextStyle(
                              fontFamily: "Gotham",
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(150, 150, 150, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ).asGlass(
                    tintColor: Colors.transparent,
                    clipBorderRadius: BorderRadius.circular(15.0),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Hero(
                tag: heroTag,
                child: CustomImageRippleEffect(
                  child: Center(
                    child: Image.asset(
                      imagePath,
                      width: 70.5,
                      height: 70.5,
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
      ),
    );
  }
}
