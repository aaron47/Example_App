import 'package:carousel_slider/carousel_slider.dart';
import 'package:essential_beauty/screens/flasch_nail/flasch_nail_details.dart';
import 'package:essential_beauty/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../models/cat_eye_nail.dart';
import '../../shared/tablet_detector.dart';
import '../../widgets/nails/custom_app_bar.dart';
import '../../widgets/nails/nail_details.dart';

class CatEyesDetails extends StatelessWidget {
  final isTablet = TabletDetector.isTablet(
      MediaQueryData.fromWindow(WidgetsBinding.instance.window));
  CatEyesDetails({super.key, required this.nail, required this.nails});

  final CatEyeNail nail;
  final List<CatEyeNail> nails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 1.0,
                height: MediaQuery.of(context).size.height,
                initialPage: int.parse(nail.id) - 1,
              ),
              items: nails.map((n) {
                return Builder(
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      //decoration: const BoxDecoration(color: Colors.white),
                      child: isTablet
                          ? BaseCatEyeNail(nail: n)
                          : BaseCatEyeNailPhone(nail: n),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          const CustomBottomBar(
            imagePath: "assets/categories/CatEyesLarge.png",
            heroTag: "CatEyes",
            categoryName: "CAT EYES",
          ),
        ],
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
    return Container(
      width: 1511.w,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(color: Color.fromRGBO(240, 240, 240, 1)),
      // padding: const EdgeInsets.all(50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Align(
              alignment: Alignment.topRight,
              child: Image.asset("assets/CloseButton.png",
                  width: 66.21.w, height: 66.h),
            ),
          ),
          Center(
            // heightFactor: 1,
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
                SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.width * 0.005),
                    Stack(
                      children: [
                        const BottleShadow(),
                        Image.asset(
                          "assets/bottle/catEyes.png",
                          width: 275.w,
                          // height: 594.h,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BaseCatEyeNailPhone extends StatelessWidget {
  const BaseCatEyeNailPhone({
    super.key,
    required this.nail,
  });

  final CatEyeNail nail;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // InkWell(
            //   onTap: () {
            //     Get.back();
            //   },
            //   child: Align(
            //     alignment: Alignment.topRight,
            //     child: Image.asset("assets/CloseButton.png",
            //         width: 66.21.w, height: 66.h),
            //   ),
            // ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                Row(
                  children: [
                    _CatEyeNailCardPhone(
                      catEyeNail: nail,
                    ),
                    const PlayButtonLargePhone(
                      bottomMargin: 130,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: Colors
                                .grey, // Replace with your desired border color
                            width:
                                1.0, // Replace with your desired border width
                          ),
                        ),
                      ),
                      width: 400,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "REF:${nail.ref}",
                              style: const TextStyle(
                                fontSize: 25,
                                fontFamily: "Gotham",
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(80, 79, 79, 1),
                              ),
                            ),
                            const Text(
                              "Flasching Disco Gel",
                              style: TextStyle(
                                fontFamily: "Gotham",
                                fontWeight: FontWeight.w400,
                                fontSize: 25,
                                color: const Color.fromRGBO(97, 95, 95, 1),
                              ),
                            ),
                            const Text(
                              "Time of polymerization in light of the UV lamp-2-3minutes LED-lamp-1 minute",
                              style: TextStyle(
                                fontFamily: "Gotham",
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                                color: Color.fromRGBO(126, 126, 126, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                // widget(child: Container(child: Image.asset("assets/flasch_nail/DISCO.png", width: 275.w)))
              ],
            ),
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
    return SizedBox(
      width: 360.13.w,
      height: 700.h,
      child: Stack(
        children: [
          Image.asset(
            "assets/flasch_nail/FlaschNailCard1.png",
            width: 379.13.w,
            height: 630.79.h,
            fit: BoxFit.contain,
          ),
          Align(
            alignment: Alignment.center,
            child: Transform.rotate(
              angle: 525,
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50.h, left: 50.w),
                    child: Image.asset(
                      catEyeNail.imgPath,
                      fit: BoxFit.contain,
                      width: 211.12.w,
                      height: 783.43.h,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CatEyeNailCardPhone extends StatelessWidget {
  final CatEyeNail catEyeNail;

  const _CatEyeNailCardPhone({required this.catEyeNail});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Image.asset(
            "assets/flasch_nail/FlaschNailCard1.png",
            width: 900.w,
            height: 400.h,
            fit: BoxFit.contain,
          ),
          Positioned.fill(
            child: Align(
              child: Transform.rotate(
                angle: 166.8,
                child: Stack(
                  children: [
                    Image.asset(
                      catEyeNail.imgPath,
                      fit: BoxFit.contain,
                      width: 500.w,
                      height: 704.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
