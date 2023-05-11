import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../models/cat_eye_nail.dart';
import '../widgets/nails/custom_app_bar.dart';
import '../widgets/nails/nail_details.dart';

class CatEyesDetails extends StatelessWidget {
  const CatEyesDetails({super.key, required this.nail, required this.nails});

  final CatEyeNail nail;
  final List<CatEyeNail> nails;

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
      // body: BaseCatEyeNail(nail: nail),

      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: CarouselSlider(
          options: CarouselOptions(
            initialPage: int.parse(nail.id) - 1,
          ),
          items: nails.map((n) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: BaseCatEyeNail(nail: n),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}

class BaseCatEyeNail extends StatelessWidget {
  const BaseCatEyeNail({
    super.key,
    required this.nail,
  });

  final CatEyeNail nail;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration:
            const BoxDecoration(color: Color.fromRGBO(240, 240, 240, 1)),
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              heightFactor: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _CatEyeNailCard(
                    catEyeNail: nail,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "CAT EYES",
                        style: TextStyle(
                          fontSize: 32.sp,
                          fontFamily: "Gotham",
                          fontWeight: FontWeight.w700,
                          color: const Color.fromRGBO(35, 40, 55, 1),
                        ),
                      ),
                      const PlayButtonLarge(
                        bottomMargin: 0,
                      ),
                      SizedBox(
                        width: 350,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Ref:${nail.ref}",
                                style: TextStyle(
                                  fontSize: 32.sp,
                                  fontFamily: "Gotham",
                                  fontWeight: FontWeight.w700,
                                  color: const Color.fromRGBO(80, 79, 79, 1),
                                ),
                              ),
                              Text(
                                "Flasching Disco Gel",
                                style: TextStyle(
                                  fontFamily: "Gotham",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 32.sp,
                                  color: const Color.fromRGBO(97, 95, 95, 1),
                                ),
                              ),
                              Text(
                                "Time of polymerization in light of the UV lamp-2-3minutes LED-lamp-1 minute",
                                style: TextStyle(
                                  fontFamily: "Gotham",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 24.sp,
                                  color: const Color.fromRGBO(126, 126, 126, 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class _CatEyeNailCard extends StatelessWidget {
  final CatEyeNail catEyeNail;

  const _CatEyeNailCard({required this.catEyeNail});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/flasch_nail/FlaschNailCard1.png",
          width: 379.13.w,
          height: 630.79.h,
          fit: BoxFit.contain,
        ),
        Positioned.fill(
          child: Align(
            child: Transform.rotate(
              angle: 170,
              child: Stack(
                children: [
                  Image.asset(
                    catEyeNail.imgPath,
                    fit: BoxFit.contain,
                    width: 203.94.w,
                    height: 760.13.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
