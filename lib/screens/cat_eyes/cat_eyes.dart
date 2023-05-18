import 'dart:math';

import 'package:essential_beauty/widgets/custom_bottom_bar.dart';
import 'package:essential_beauty/widgets/custom_ripple_effect.dart';
import 'package:essential_beauty/widgets/nails/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../models/cat_eye_nail.dart';
import 'cat_eyes_details.dart';

class CatEyesScreen extends StatelessWidget {
  const CatEyesScreen({super.key});

  final List<CatEyeNail> catEyeNails = const [
    CatEyeNail(imgPath: "assets/cat_eyes/SILVER.png", ref: "SILVER", id: "1"),
    CatEyeNail(imgPath: "assets/cat_eyes/RED.png", ref: "RED", id: "2"),
    CatEyeNail(
        imgPath: "assets/cat_eyes/CHAMPAGNE.png", ref: "CHAMPAGNE", id: "3"),
    CatEyeNail(imgPath: "assets/cat_eyes/PINK.png", ref: "PINK", id: "4"),
    CatEyeNail(imgPath: "assets/cat_eyes/ORANGE.png", ref: "ORANGE", id: "5"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Container(
              width: 1511.w,
              decoration:
                  const BoxDecoration(color: Color.fromRGBO(240, 240, 240, 1)),
              padding: const EdgeInsets.all(50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: const Center(
                      child: Text(
                        "CAT EYES",
                        style: TextStyle(
                          fontFamily: "Gotham",
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(35, 40, 55, 1),
                          fontSize: 32,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    alignment: Alignment.bottomCenter,
                    width: MediaQuery.of(context).size.width -
                        MediaQuery.of(context).size.width / 3.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (var nail in catEyeNails)
                          GestureDetector(
                            onTap: () {
                              Get.to(CatEyesDetails(
                                nail: nail,
                                nails: catEyeNails,
                              ));
                            },
                            child: Column(
                              children: [
                                Transform.rotate(
                                  angle: pi,
                                  child: Image.asset(
                                    nail.imgPath,
                                    height: 496.h,
                                    width: 133.w,
                                    // width: MediaQuery.of(context).size.width / 10,
                                  ),
                                ),
                                SizedBox(height: 15.h),
                                Text(
                                  nail.ref,
                                  style: TextStyle(
                                    fontFamily: "Gotham",
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                    fontSize: 32.sp,
                                  ),
                                )
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const CustomBottomBar(
            categoryName: 'CAT EYES',
            heroTag: 'CatEyes',
            imagePath: "assets/categories/CatEyesLarge.png",
          ),
        ],
      ),
    );
  }
}
