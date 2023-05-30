import 'package:carousel_slider/carousel_slider.dart';
import 'package:essential_beauty/widgets/custom_bottom_bar.dart';
import 'package:essential_beauty/widgets/flasch_nail_widgets/FlaschNail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../shared/tablet_detector.dart';
import '../../widgets/flasch_nail_widgets/flasch_nail_card.dart';
import '../../widgets/nails/custom_app_bar.dart';
import '../../widgets/nails/nail_details.dart';

class FlaschNailDetails extends StatelessWidget {
  final isTablet = TabletDetector.isTablet(
      MediaQueryData.fromWindow(WidgetsBinding.instance.window));

  FlaschNailDetails({super.key, required this.flaschNail, required this.nails});

  final FlaschNail flaschNail;
  final List<FlaschNail> nails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      // body: BaseFlaschNail(flaschNail: flaschNail),
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: CarouselSlider(
              options: CarouselOptions(
                initialPage: int.parse(flaschNail.id) - 1,
                viewportFraction: 1.0,
                height: MediaQuery.of(context).size.height,
              ),
              items: nails.where((nail) => !nail.withCalque).map((n) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      decoration: const BoxDecoration(color: Colors.white),
                      child: isTablet
                          ? BaseFlaschNail(flaschNail: n)
                          : BaseFlaschNailPhone(flaschNail: n),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          if (isTablet)
            const CustomBottomBar(
              categoryName: 'FLASCH NAIL',
              heroTag: 'FlaschNail',
              imagePath: "assets/categories/FlaschNailLarge.png",
            ),
        ],
      ),
    );
  }
}

class BaseFlaschNail extends StatelessWidget {
  const BaseFlaschNail({
    super.key,
    required this.flaschNail,
  });

  final FlaschNail flaschNail;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 1511.w,
        decoration:
            const BoxDecoration(color: Color.fromRGBO(240, 240, 240, 1)),
        padding: const EdgeInsets.all(15),
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
              heightFactor: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlaschNailCard(
                    flaschNail: flaschNail,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "FLASCH NAIL",
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
                        width: 300,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Ref:${flaschNail.id}",
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
                  Stack(
                    children: [
                      Container(
                        width: 300
                            .w, // Adjust the width to match your bottle image size
                        // height: 400, // Adjust the height to match your bottle image size
                        child: Image.asset("assets/bottle/flashnails.png",
                            width:
                                275.w), // Replace with your bottle image source
                      ),
                      const BottleShadow(),
                    ],
                  )
                  // widget(child: Container(child: Image.asset("assets/flasch_nail/DISCO.png", width: 275.w)))
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

class BaseFlaschNailPhone extends StatelessWidget {
  const BaseFlaschNailPhone({
    super.key,
    required this.flaschNail,
  });

  final FlaschNail flaschNail;

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
                    FlaschNailCard(
                      flaschNail: flaschNail,
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
                              "Ref:${flaschNail.id}",
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

class BottleShadow extends StatelessWidget {
  const BottleShadow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        width: 300.w, // Adjust the width to match your bottle image size
        height: 30.w, // Adjust the height to match the desired shadow height
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.w),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Shadow color
              offset: Offset(0, 8),
              spreadRadius: 5, // Offset in the y-axis
              blurRadius: 50.w, // Spread radius
            ),
          ],
        ),
      ),
    );
  }
}
