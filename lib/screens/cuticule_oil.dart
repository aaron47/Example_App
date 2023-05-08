import 'package:essential_beauty/models/cuticul_oil.dart';
import 'package:essential_beauty/models/gel_builder.dart';
import 'package:essential_beauty/screens/builder_gel_details.dart';
import 'package:essential_beauty/screens/cuticul_oil_details.dart';
import 'package:essential_beauty/widgets/nails/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CuticuleOilScreen extends StatelessWidget {
  CuticuleOilScreen({super.key});

  final List<CuticulOil> builderOIlList = [
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.large(
        backgroundColor: Colors.transparent,
        elevation: 0,
        onPressed: () {
          Get.back();
        },
        child: Image.asset(
          "assets/categories/CuticuleOilLarge.png",
          width: 202.w,
        ),
      ),
      appBar: const CustomAppBar(),
      body: Column(
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
                    children: builderOIlList
                        .map((e) => GestureDetector(
                              onTap: () {
                                //  Get.to(BuilderGelDetails(gel: e), duration: Duration(milliseconds: 800));
                              },
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(CuticulOIlDetails(oil: e),
                                      duration:
                                          const Duration(milliseconds: 800));
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Hero(
                                      tag: 'oil${e.id}',
                                      child: Image.asset(
                                        e.imgPath,
                                        // width: 217.w,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.h,
                                    ),
                                    Hero(
                                      tag: 'id${e.id}',
                                      child: Text(
                                        e.id,
                                        style: TextStyle(
                                          fontSize: 30.sp,
                                          fontFamily: "Gotham",
                                          fontWeight: FontWeight.w700,
                                          color: const Color.fromRGBO(
                                              20, 76, 80, 1),
                                        ),
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
                        height: 425.27.h,
                        width: 533.56.w,
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(
                          "assets/cuticul_oil/oil_background.png",
                          width: 533.w,
                        ),
                      ),
                      SizedBox(
                        width: 533.56.w,
                        height: 425.27.h,
                        //  color: Colors.amber,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  "assets/cuticul_oil/Apple.png",
                                  width: 153.w,
                                  height: 393.h,
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.only(top: 15.h, bottom: 15.h),
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
                                Image.asset(
                                  "assets/cuticul_oil/Orange.png",
                                  width: 146.w,
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.only(top: 15.h, bottom: 15.h),
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
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
