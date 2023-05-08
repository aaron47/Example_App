import 'package:essential_beauty/screens/builder_gel.dart';
import 'package:essential_beauty/screens/cat_eyes.dart';
import 'package:essential_beauty/screens/cuticule_oil.dart';
import 'package:essential_beauty/screens/rubber_base_gel.dart';
import 'package:essential_beauty/widgets/categories/category.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'flasch_nail.dart';
import 'nails_polish.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: MediaQuery.of(context).size.height * 0.25,
      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Image.asset(
      //         "assets/essential.png",
      //         width: 732.w,
      //         height: 213.h,
      //       ),
      //     ],
      //   ),
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/EssentialTitleLarge.png",
            width: 732.w,
            height: 213.h,
          ),
          Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Category(
                      imgPath: "assets/categories/RubberBaseGelLarge.png",
                      categoryName: 'Rubber Base Gel',
                      onChangeScreen: () {
                        Get.to(const RubberBaseGelScreen());
                      },
                    ),
                    Category(
                      imgPath: "assets/categories/FlaschNailLarge.png",
                      categoryName: 'Flasch Nail',
                      onChangeScreen: () {
                        Get.to(FlaschNailScreen());
                      },
                    ),
                    Category(
                      imgPath: "assets/categories/NailsPolishLarge.png",
                      categoryName: 'Nails Polish',
                      onChangeScreen: () {
                        Get.to(const NailsPolishScreen());
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Category(
                      imgPath: "assets/categories/CatEyesLarge.png",
                      categoryName: 'Cat Eyes',
                      onChangeScreen: () {
                        Get.to(const CatEyesScreen());
                      },
                    ),
                    Category(
                        imgPath: "assets/categories/BuilderGelLarge.png",
                        categoryName: 'Builder Gel',
                        onChangeScreen: () {
                          Get.to(BuilderGelScreen());
                        }),
                    Category(
                      imgPath: "assets/categories/CuticuleOilLarge.png",
                      categoryName: 'Cuticule Oil',
                      onChangeScreen: () {
                        Get.to( CuticuleOilScreen());
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Center(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "MADE WITH LOVE BY SLOTH-LAB",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(20, 77, 81, 1),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
