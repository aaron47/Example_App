import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/nails/custom_app_bar.dart';
import '../../widgets/nails/nail_details.dart';

class Bottle {
  final String bottleId;
  final String imgPath;
  final String ref;

  const Bottle(this.bottleId, {required this.imgPath, required this.ref});
}

class BottleScreen extends StatelessWidget {
  const BottleScreen({super.key, required this.bottles, required this.bottle});

  final List<Bottle> bottles;
  final Bottle bottle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1.0,
              height: MediaQuery.of(context).size.height,
              initialPage: int.parse(bottle.bottleId) - 1,
            ),
            items: bottles.map((bottle) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(color: Colors.white),
                    child: BaseBottle(bottle: bottle),
                  );
                },
              );
            }).toList(),
          ),
          const CustomBottomBar(
            imagePath: "assets/categories/CuticuleOilLarge.png",
            heroTag: "CuticuleOil",
            categoryName: "CUTICULE OIL",
          ),
        ],
      ),
    );
  }
}

class BaseBottle extends StatelessWidget {
  const BaseBottle({
    super.key,
    required this.bottle,
  });
  final Bottle bottle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            width: 1511.w,
            decoration:
                const BoxDecoration(color: Color.fromRGBO(240, 240, 240, 1)),
            // height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 95.h),
                            child: Image.asset(
                              "assets/nails/Card.png",
                              fit: BoxFit.contain,
                              height: 552.h,
                              width: 308.w,
                            ),
                          ),
                          Positioned.fill(
                            child: Align(
                              child: Hero(
                                tag: bottle.ref,
                                child: Image.asset(
                                  bottle.imgPath,
                                  fit: BoxFit.contain,
                                  height: 581.h,
                                  width: 200.w,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "CUTICULE OIL",
                            style: TextStyle(
                              fontSize: 32.sp,
                              fontFamily: "Gotham",
                              fontWeight: FontWeight.w700,
                              color: const Color.fromRGBO(35, 40, 55, 1),
                            ),
                          ),
SizedBox(height: 30.h,)      ,                    const PlayButtonLarge(
                            bottomMargin: 0,
                          ),
                          SizedBox(
                            width: 450,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Ref:${bottle.ref}",
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontFamily: "Gotham",
                                      fontWeight: FontWeight.w700,
                                      color: const Color.fromRGBO(80, 79, 79, 1),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 700.w,
                                    child: Text(
                                      "ce soin riche aux huiles naturelles régénere à la base de huil de ricin , restructure et hydrate lescuticules fissuré et séchesil assoucit la peau et permet de détacher en douceur les cutils des angles et accélére leur repousse soigne l’épiderme et améliore sa capacitéde tétention de l’humidité",
                                      style: TextStyle(
                                        fontFamily: "Gotham",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 24.sp,
                                        color: const Color.fromRGBO(126, 126, 126, 1),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.2),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
