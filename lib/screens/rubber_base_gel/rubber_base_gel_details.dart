import 'package:carousel_slider/carousel_slider.dart';
import 'package:essential_beauty/screens/flasch_nail/flasch_nail_details.dart';
import 'package:essential_beauty/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../shared/tablet_detector.dart';
import '../../widgets/nails/Nail.dart';
import '../../widgets/nails/custom_app_bar.dart';
import '../../widgets/nails/nail_details.dart';
import '../how_to_apply.dart';

class RubberBaseGelDetails extends StatelessWidget {
  RubberBaseGelDetails({super.key, required this.nail, required this.nails});

  final Nail nail;
  final List<Nail> nails;

  final isTablet = TabletDetector.isTablet(
      MediaQueryData.fromWindow(WidgetsBinding.instance.window));

  @override
  Widget build(BuildContext context) {
    return isTablet
        ? RubberBaseGelDetailsTablet(nail: nail, nails: nails)
        : RubberBaseGelDetailsPhone(nail: nail, nails: nails);
  }
}

class RubberBaseGelDetailsTablet extends StatelessWidget {
  const RubberBaseGelDetailsTablet({
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
                // enableInfiniteScroll: true,
                //    enlargeCenterPage: true,
                //     enlargeFactor: 0.8,
              ),
              items: nails.map((n) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      decoration: const BoxDecoration(color: Colors.white),
                      child: BaseGelNail(nail: n),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          const CustomBottomBar(
            categoryName: 'RUBBER BASE GEL',
            heroTag: 'RubberBaseGel',
            imagePath: "assets/categories/RubberBaseGelLarge.png",
          ),
        ],
      ),
    );
  }
}

class RubberBaseGelDetailsPhone extends StatelessWidget {
  const RubberBaseGelDetailsPhone({
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
                height: MediaQuery.of(context).size.height,
                viewportFraction: 1,
                // enableInfiniteScroll: true,
                //    enlargeCenterPage: true,
                //     enlargeFactor: 0.8,
              ),
              items: nails.map((n) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      decoration: const BoxDecoration(color: Colors.white),
                      child: BaseGelNailPhone(nail: n),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          const CustomBottomBar(
            categoryName: 'RUBBER BASE GEL',
            heroTag: 'RubberBaseGel',
            imagePath: "assets/categories/RubberBaseGelLarge.png",
          ),
        ],
      ),
    );
  }
}

class BaseGelNail extends StatelessWidget {
  const BaseGelNail({
    super.key,
    required this.nail,
  });

  final Nail nail;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Center(
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
                    alignment: Alignment.topLeft,
                    child: Image.asset("assets/CloseButton.png",
                        width: 66.21.w, height: 66.h),
                  ),
                ),
                Text(
                  "RUBBER BASE GEL",
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontFamily: "Gotham",
                    fontWeight: FontWeight.w700,
                    color: const Color.fromRGBO(35, 40, 55, 1),
                  ),
                ),
                Center(
                  heightFactor: 1,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _RubberBaseGelCard(nail: nail),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const PlayButtonLarge(
                            bottomMargin: 40,
                          ),
                          SizedBox(
                            width: 300.w,
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
                          const BottleShadow(),
                          Image.asset("assets/bottle/basegel.png",
                              width: 275.w),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BaseGelNailPhone extends StatelessWidget {
  const BaseGelNailPhone({super.key, required this.nail});

  final Nail nail;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Hero(
            tag: "HowToApply",
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
                    Get.to(() => const HowToApplyScreen(),
                        duration: Duration(milliseconds: 800));
                  },
                  child: Image.asset("assets/PlayButton.png")),
            ),
          ),
        ),
        Center(
          heightFactor: 1,
          child: _RubberBaseGelCard(nail: nail),
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

class _RubberBaseGelCard extends StatelessWidget {
  final Nail nail;

  final isTablet = TabletDetector.isTablet(
      MediaQueryData.fromWindow(WidgetsBinding.instance.window));
  _RubberBaseGelCard({required this.nail});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        isTablet
            ? Container(
                child: Image.asset(
                  "assets/nails/Card.png",
                  width: 379.13.w,
                  height: 630.79.h,
                  fit: BoxFit.contain,
                ),
              )
            : Image.asset(
                "assets/nails/Card.png",
                // width: 183.13.w,
                // height: 304.79.h,
                fit: BoxFit.contain,
              ),
        Positioned.fill(
          child: Align(
            child: isTablet
                ? Hero(
                    tag: "RubberBaseGel${nail.id}",
                    child: Image.asset(
                      "assets/rubber_base_gel/${nail.id}.png",
                      fit: BoxFit.contain,
                      height: 478.h,
                      width: 216.w,
                      // height: 200,
                    ),
                  )
                : Image.asset(
                    "assets/rubber_base_gel/${nail.id}.png",
                    fit: BoxFit.contain,
                    height: 700.h,
                    width: 500.w,
                    // height: 200,
                  ),
          ),
        )
      ],
    );
  }
}
