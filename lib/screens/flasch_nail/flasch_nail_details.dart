import 'package:carousel_slider/carousel_slider.dart';
import 'package:essential_beauty/widgets/custom_bottom_bar.dart';
import 'package:essential_beauty/widgets/flasch_nail_widgets/FlaschNail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/flasch_nail_widgets/flasch_nail_card.dart';
import '../../widgets/nails/custom_app_bar.dart';
import '../../widgets/nails/nail_details.dart';

class FlaschNailDetails extends StatelessWidget {
  const FlaschNailDetails(
      {super.key, required this.flaschNail, required this.nails});

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
                      child: BaseFlaschNail(flaschNail: n),
                    );
                  },
                );
              }).toList(),
            ),
          ),
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
  BaseFlaschNail({
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
                  Image.asset("assets/flasch_nail/DISCO.png", width: 275.w)
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
