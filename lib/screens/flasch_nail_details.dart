import 'package:carousel_slider/carousel_slider.dart';
import 'package:essential_beauty/widgets/flasch_nail_widgets/FlaschNail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../widgets/flasch_nail_widgets/flasch_nail_card.dart';
import '../widgets/nails/Nail.dart';
import '../widgets/nails/custom_app_bar.dart';
import '../widgets/nails/nail_card.dart';
import '../widgets/nails/nail_details.dart';

class FlaschNailDetails extends StatelessWidget {
  const FlaschNailDetails(
      {super.key, required this.flaschNail, required this.nails});

  final FlaschNail flaschNail;
  final List<FlaschNail> nails;

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
          "assets/categories/FlaschNailLarge.png",
        ),
      ),
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
                "FLASCH NAIL",
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
      appBar: const CustomAppBar(),
      // body: BaseFlaschNail(flaschNail: flaschNail),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: CarouselSlider(
          options: CarouselOptions(initialPage: int.parse(flaschNail.id) - 1),
          items: nails.map((n) {
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
