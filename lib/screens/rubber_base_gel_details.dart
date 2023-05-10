import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../widgets/nails/Nail.dart';
import '../widgets/nails/custom_app_bar.dart';
import '../widgets/nails/nail_card.dart';
import '../widgets/nails/nail_details.dart';

class RubberBaseGelDetails extends StatelessWidget {
  const RubberBaseGelDetails({super.key, required this.nail, required this.nails});

  final Nail nail;
  final List<Nail> nails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton.large(
          backgroundColor: Colors.transparent,
          elevation: 0,
          onPressed: () {
            Get.back();
          },
          child: Image.asset(
            "assets/categories/RubberBaseGelLarge.png",
          ),
        ),
        appBar: const CustomAppBar(),
        body: CarouselSlider(
          options: CarouselOptions(
            initialPage: int.parse(nail.id) - 1,
            // enableInfiniteScroll: true,
            //    enlargeCenterPage: true,
            //     enlargeFactor: 0.8,
          ),
          items: nails.map((n) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(color: Colors.white),
                    child: BaseGelNail(nail: n));
              },
            );
          }).toList(),
        )

        //BaseGelNail(nail: nail),
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
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Container(
          width: 1511.w,
          decoration: const BoxDecoration(color: Color.fromRGBO(240, 240, 240, 1)),
          padding: const EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                          width: 300,
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
                                    color: const Color.fromRGBO(80, 79, 79, 1),
                                  ),
                                ),
                                Text(
                                  "Base Color GEL",
                                  style: TextStyle(
                                    fontFamily: "Gotham",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 32.sp,
                                    color: const Color.fromRGBO(97, 95, 95, 1),
                                  ),
                                ),
                                Text(
                                  "SOAK OFF GEL POLISH",
                                  style: TextStyle(
                                    fontFamily: "Gotham",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 32.sp,
                                    color: const Color.fromRGBO(97, 95, 95, 1),
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
                                    color: const Color.fromRGBO(126, 126, 126, 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.15),
                    Image.asset("assets/rubber_base_gel/RubberBaseGelBottle.png", width: 275.w)
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class _RubberBaseGelCard extends StatelessWidget {
  final Nail nail;

  const _RubberBaseGelCard({required this.nail});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/nails/Card.png",
          width: 379.13.w,
          height: 630.79.h,
          fit: BoxFit.contain,
        ),
        Positioned.fill(
          child: Align(
            child: Image.asset(
              "assets/rubber_base_gel/${nail.id}.png",
              fit: BoxFit.contain,
              height: 478.h,
              width: 216.w,
              // height: 200,
            ),
          ),
        )
      ],
    );
  }
}
