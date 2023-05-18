import 'package:essential_beauty/models/cuticul_oil.dart';
import 'package:essential_beauty/screens/cuticul_oil/cuticul_oil_details.dart';
import 'package:essential_beauty/screens/rubber_base_gel/rubber_base_gel.dart';
import 'package:essential_beauty/widgets/custom_bottom_bar.dart';
import 'package:essential_beauty/widgets/nails/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'bottle_screen.dart';

class CuticuleOilScreen extends StatelessWidget {
  CuticuleOilScreen({super.key});

  final List<Bottle> bottles = const [
    Bottle("01", imgPath: "assets/cuticul_oil/Apple.png", ref: "Apple"),
    Bottle("02", imgPath: "assets/cuticul_oil/Orange.png", ref: "Orange"),
  ];

  final List<CuticulOil> builderOilList = [
    CuticulOil(
      imgPath: "assets/cuticul_oil/01.png",
      description:
          "ce soin riche aux huiles naturelles régénere à la base de huil de ricin , restructure et hydrate lescuticules fissuré et séchesil assoucit la peau et permet de détacher en douceur les cutils des angles et accélére leur repousse soigne l’épiderme et améliore sa capacitéde tétention de l’humidité",
      id: "01",
    ),
    CuticulOil(
      imgPath: "assets/cuticul_oil/02.png",
      description:
          "ce soin riche aux huiles naturelles régénere à la base de huil de ricin , restructure et hydrate lescuticules fissuré et séchesil assoucit la peau et permet de détacher en douceur les cutils des angles et accélére leur repousse soigne l’épiderme et améliore sa capacitéde tétention de l’humidité",
      id: "02",
    ),
    CuticulOil(
      imgPath: "assets/cuticul_oil/03.png",
      description:
          "ce soin riche aux huiles naturelles régénere à la base de huil de ricin , restructure et hydrate lescuticules fissuré et séchesil assoucit la peau et permet de détacher en douceur les cutils des angles et accélére leur repousse soigne l’épiderme et améliore sa capacitéde tétention de l’humidité",
      id: "03",
    ),
    CuticulOil(
      imgPath: "assets/cuticul_oil/04.png",
      description:
          "ce soin riche aux huiles naturelles régénere à la base de huil de ricin , restructure et hydrate lescuticules fissuré et séchesil assoucit la peau et permet de détacher en douceur les cutils des angles et accélére leur repousse soigne l’épiderme et améliore sa capacitéde tétention de l’humidité",
      id: "04",
    ),
    CuticulOil(
      imgPath: "assets/cuticul_oil/05.png",
      description:
          "ce soin riche aux huiles naturelles régénere à la base de huil de ricin , restructure et hydrate lescuticules fissuré et séchesil assoucit la peau et permet de détacher en douceur les cutils des angles et accélére leur repousse soigne l’épiderme et améliore sa capacitéde tétention de l’humidité",
      id: "05",
    ),
    CuticulOil(
      imgPath: "assets/cuticul_oil/06.png",
      description:
          "ce soin riche aux huiles naturelles régénere à la base de huil de ricin , restructure et hydrate lescuticules fissuré et séchesil assoucit la peau et permet de détacher en douceur les cutils des angles et accélére leur repousse soigne l’épiderme et améliore sa capacitéde tétention de l’humidité",
      id: "06",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Stack(
        children: [
          Row(
            children: [
              const ButtonPlayVideo(),
              Container(
                width: 1511.w,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(240, 240, 240, 1)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          "CUTICULE OIL",
                          style: TextStyle(
                            fontSize: 32.sp,
                            fontFamily: "Gotham",
                            fontWeight: FontWeight.w700,
                            color: const Color.fromRGBO(11, 43, 45, 1),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: builderOilList
                                  .map((e) => GestureDetector(
                                        onTap: () {
                                          //  Get.to(BuilderGelDetails(gel: e), duration: Duration(milliseconds: 800));
                                        },
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.to(
                                                CuticulOilDetails(
                                                    oil: e,
                                                    oils: builderOilList),
                                                duration: const Duration(
                                                    milliseconds: 800));
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Hero(
                                                tag: 'oil${e.id}',
                                                flightShuttleBuilder:
                                                    (BuildContext flightContext,
                                                        Animation<double>
                                                            animation,
                                                        HeroFlightDirection
                                                            flightDirection,
                                                        BuildContext
                                                            fromHeroContext,
                                                        BuildContext
                                                            toHeroContext) {
                                                  return RotationTransition(
                                                    turns: Tween(
                                                            begin: 0.0,
                                                            end: 0.25)
                                                        .animate(
                                                            animation), // Control the animation to perform half turns
                                                    child: Image.asset(
                                                      e.imgPath,
                                                      // width: 217.w,
                                                    ),
                                                  );
                                                },
                                                child: Image.asset(
                                                  e.imgPath,
                                                  // width: 217.w,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 20.h,
                                              ),
                                              Text(
                                                e.id,
                                                style: TextStyle(
                                                  fontSize: 30.sp,
                                                  fontFamily: "Gotham",
                                                  fontWeight: FontWeight.w700,
                                                  color: const Color.fromRGBO(
                                                      20, 76, 80, 1),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                            Stack(
                              children: [
                                Container(
                                  height: 470.h,
                                  width: 600.56.w,
                                  // color: Colors.white,
                                  alignment: Alignment.bottomCenter,
                                  child: Image.asset(
                                    "assets/cuticul_oil/oil_background.png",
                                    width: 533.w,
                                  ),
                                ),
                                Positioned.fill(
                                  child: SizedBox(
                                    width: 500.w,
                                    height: 600.h,
                                    //  color: Colors.amber,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Get.to(
                                                  () => BottleScreen(
                                                    bottle: bottles[0],
                                                    bottles: bottles,
                                                  ),
                                                );
                                              },
                                              child: Image.asset(
                                                "assets/cuticul_oil/Apple.png",
                                                width: 153.w,
                                                height: 393.h,
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: 5.h, bottom: 15.h),
                                              child: Text(
                                                "Apple",
                                                style: TextStyle(
                                                  fontSize: 20.sp,
                                                  fontFamily: "Gotham",
                                                  fontWeight: FontWeight.w700,
                                                  color: const Color.fromRGBO(
                                                    150,
                                                    150,
                                                    150,
                                                    1,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Get.to(
                                                  () => BottleScreen(
                                                    bottle: bottles[1],
                                                    bottles: bottles,
                                                  ),
                                                );
                                              },
                                              child: Image.asset(
                                                "assets/cuticul_oil/Orange.png",
                                                width: 153.w,
                                                height: 393.h,
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 5.h, bottom: 15.h),
                                              child: Text(
                                                "Orange",
                                                style: TextStyle(
                                                  fontSize: 20.sp,
                                                  fontFamily: "Gotham",
                                                  fontWeight: FontWeight.w700,
                                                  color: const Color.fromRGBO(
                                                    150,
                                                    150,
                                                    150,
                                                    1,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
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
                    )
                  ],
                ),
              ),
            ],
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
