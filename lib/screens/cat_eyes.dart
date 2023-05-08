import 'package:essential_beauty/screens/cat_eyes_details.dart';
import 'package:essential_beauty/widgets/nails/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../models/cat_eye_nail.dart';

class CatEyesScreen extends StatelessWidget {
  const CatEyesScreen({super.key});

  final List<CatEyeNail> catEyeNails = const [
    CatEyeNail(imgPath: "assets/cat_eyes/SILVER.png", ref: "SILVER"),
    CatEyeNail(imgPath: "assets/cat_eyes/RED.png", ref: "RED"),
    CatEyeNail(imgPath: "assets/cat_eyes/CHAMPAGNE.png", ref: "CHAMPAGNE"),
    CatEyeNail(imgPath: "assets/cat_eyes/PINK.png", ref: "PINK"),
    CatEyeNail(imgPath: "assets/cat_eyes/ORANGE.png", ref: "ORANGE"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "MADE WITH LOVE BY SLOTH-LAB",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                "CAT EYES",
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
      floatingActionButton: FloatingActionButton.large(
        backgroundColor: Colors.transparent,
        elevation: 0,
        onPressed: () {
          Get.back();
        },
        child: Image.asset(
          "assets/categories/CatEyesLarge.png",
        ),
      ),
      appBar: const CustomAppBar(),
      body: Center(
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
                    "FLASCH NAIL",
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
                          Get.to(CatEyesDetails(nail: nail));
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              nail.imgPath,
                              // width: MediaQuery.of(context).size.width / 10,
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
    );
  }
}
