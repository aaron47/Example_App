import 'package:carousel_slider/carousel_slider.dart';
import 'package:essential_beauty/screens/how_to_apply.dart';
import 'package:essential_beauty/widgets/custom_bottom_bar.dart';
import 'package:essential_beauty/widgets/nails/custom_app_bar.dart';
import 'package:essential_beauty/widgets/nails/nail_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../shared/tablet_detector.dart';
import 'Nail.dart';

class NailDetails extends StatelessWidget {
  const NailDetails({super.key, required this.nail, required this.nails});

  final Nail nail;
  final List<Nail> nails;

  @override
  Widget build(BuildContext context) {
    return TabletDetector.isTablet(
            MediaQueryData.fromWindow(WidgetsBinding.instance.window))
        ? NailsDetailsTablet(nail: nail, nails: nails)
        : NailsDetailsPhone(nail: nail, nails: nails);
  }
}

class NailsDetailsTablet extends StatelessWidget {
  const NailsDetailsTablet({
    super.key,
    required this.nail,
    required this.nails,
  });

  final Nail nail;
  final List<Nail> nails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: CarouselSlider(
              options: CarouselOptions(
                initialPage: int.parse(nail.id) - 1,
                viewportFraction: 1.0,
                height: MediaQuery.of(context).size.height,
              ),
              items: nails.map((n) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Container(
                        width: 1511.w,
                        height: MediaQuery.of(context).size.height,
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(240, 240, 240, 1)),
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
                                alignment: Alignment.topLeft,
                                child: Image.asset("assets/CloseButton.png",
                                    width: 66.21.w, height: 66.h),
                              ),
                            ),
                            Text(
                              "NAILS POLISH",
                              style: TextStyle(
                                fontSize: 32.sp,
                                fontFamily: "Gotham",
                                fontWeight: FontWeight.w700,
                                color: const Color.fromRGBO(35, 40, 55, 1),
                              ),
                            ),
                            BaseNail(nail: n),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          const CustomBottomBar(
            imagePath: "assets/categories/NailsPolishLarge.png",
            heroTag: "NailsPolish",
            categoryName: "NAILS POLISH",
          ),
        ],
      ),
    );
  }
}

class NailsDetailsPhone extends StatelessWidget {
  const NailsDetailsPhone({
    super.key,
    required this.nail,
    required this.nails,
  });

  final Nail nail;
  final List<Nail> nails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CarouselSlider(
        options: CarouselOptions(
          initialPage: int.parse(nail.id) - 1,
          height: MediaQuery.of(context).size.height,
          viewportFraction: 1,
        ),
        items: nails.map((n) {
          return Builder(
            builder: (BuildContext context) {
              return BaseNailPhone(nail: n);
            },
          );
        }).toList(),
      ),
    );
  }
}

class BaseNail extends StatelessWidget {
  const BaseNail({
    super.key,
    required this.nail,
  });

  final Nail nail;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
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
                      NailCard(nail: nail),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const PlayButtonLarge(
                            bottomMargin: 40,
                          ),
                          SizedBox(
                            width: 400.w,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Ref:${nail.id}",
                                    style: TextStyle(
                                      fontSize: 32.sp,
                                      fontFamily: "Gotham",
                                      fontWeight: FontWeight.w700,
                                      color:
                                          const Color.fromRGBO(80, 79, 79, 1),
                                    ),
                                  ),
                                  Text(
                                    "Base Color GEL",
                                    style: TextStyle(
                                      fontFamily: "Gotham",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 32.sp,
                                      color:
                                          const Color.fromRGBO(97, 95, 95, 1),
                                    ),
                                  ),
                                  Text(
                                    "SOAK OFF GEL POLISH",
                                    style: TextStyle(
                                      fontFamily: "Gotham",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 32.sp,
                                      color:
                                          const Color.fromRGBO(97, 95, 95, 1),
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Text(
                                    "Gel de base plus doux flexible et à forte adhérnce du gels de construction",
                                    style: TextStyle(
                                      fontFamily: "Gotham",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 24.sp,
                                      color: const Color.fromRGBO(
                                        126,
                                        126,
                                        126,
                                        1,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Text(
                                    "Time of polymerization in light of the UV lamp-2-3minutes LED-lamp-1 minute",
                                    style: TextStyle(
                                      fontFamily: "Gotham",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 24.sp,
                                      color: const Color.fromRGBO(
                                          126, 126, 126, 1),
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
                          Positioned(
                              bottom: 0,
                              right: 50,
                              child: Image.asset(
                                nail.imgPath,
                                width: 150.w,
                              )),
                          Image.asset("assets/bottleNailPolich.png",
                              width: 250.w),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 300.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BaseNailPhone extends StatelessWidget {
  const BaseNailPhone({super.key, required this.nail});

  final Nail nail;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            width: 75,
            height: 69,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(75),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(75),
              ),
              image: DecorationImage(
                image: AssetImage("assets/AppBarBackground.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: GestureDetector(
                onTap: () {
                  Get.to(() => const HowToApplyScreen());
                },
                child: Image.asset("assets/PlayButton.png")),
          ),
        ),
        Center(
          heightFactor: 1,
          child: NailCard(nail: nail),
        ),
        const SizedBox(height: 10),
        Container(
          width: 300,
          decoration: const BoxDecoration(
            border: Border(
              left: BorderSide(
                color: Color.fromRGBO(126, 126, 126, 0.5),
                width: 2,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ref:${nail.id}",
                  style: const TextStyle(
                    fontSize: 25,
                    fontFamily: "Gotham",
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(80, 79, 79, 1),
                  ),
                ),
                const Text(
                  "Soak oof gell polish",
                  style: TextStyle(
                    fontFamily: "Gotham",
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Color.fromRGBO(97, 95, 95, 1),
                  ),
                ),
                const Text(
                  "Time of polymerization in light of the UV lamp-2-3minutes LED-lamp-1 minute",
                  style: TextStyle(
                    fontFamily: "Gotham",
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Color.fromRGBO(126, 126, 126, 1),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class PlayButtonLarge extends StatelessWidget {
  const PlayButtonLarge({
    super.key,
    required this.bottomMargin,
  });

  final double bottomMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 80, bottom: bottomMargin),
      width: 158.w,
      height: 147.h,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(75),
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(75),
        ),
        image: DecorationImage(
          image: AssetImage("assets/AppBarBackground.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: GestureDetector(
        onTap: () {
          Get.to(const HowToApplyScreen());
        },
        child: Image.asset(
          "assets/PlayButtonLarge.png",
          width: 65.w,
          height: 65.h,
        ),
      ),
    );
  }
}
