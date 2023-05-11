import 'package:carousel_slider/carousel_slider.dart';
import 'package:essential_beauty/screens/how_to_apply.dart';
import 'package:essential_beauty/widgets/custom_bottom_bar.dart';
import 'package:essential_beauty/widgets/nails/custom_app_bar.dart';
import 'package:essential_beauty/widgets/nails/nail_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'Nail.dart';

class NailDetails extends StatelessWidget {
  const NailDetails({super.key, required this.nail, required this.nails});

  final Nail nail;
  final List<Nail> nails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomBar(
        imagePath: "assets/categories/NailsPolishLarge.png",
        heroTag: "NailsPolish",
        categoryName: "NAILS POLISH",
      ),
      appBar: const CustomAppBar(),
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
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(240, 240, 240, 1)),
                    padding: const EdgeInsets.all(50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
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
      heightFactor: 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
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
                width: 200,
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
                        "Soak off gell polish",
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
          Image.asset("assets/nails/ManicureBottle.png", width: 275.w)
        ],
      ),
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
