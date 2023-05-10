import 'package:essential_beauty/models/cuticul_oil.dart';
import 'package:essential_beauty/models/gel_builder.dart';
import 'package:essential_beauty/screens/how_to_apply.dart';
import 'package:essential_beauty/widgets/nails/custom_app_bar.dart';
import 'package:essential_beauty/widgets/nails/nail_card.dart';
import 'package:essential_beauty/widgets/nails/nail_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CuticulOIlDetails extends StatelessWidget {
  const CuticulOIlDetails({super.key, required this.oil});

  final CuticulOil oil;

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
        ),
      ),
      appBar: const CustomAppBar(),
      body: Center(
        child: Container(
          width: 1511.w,
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
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 95.h),
                          child: Image.asset(
                            "assets/cuticul_oil/Card-oil.png",
                            // height: 651.h,
                            // width: 533.w,
                          ),
                        ),
                        Positioned.fill(
                          child: Align(
                            child: RotatedBox(
                              quarterTurns: 1,
                              child: Container(
                                // margin: EdgeInsets.only(right: 700.w),
                                child: Hero(
                                  tag: 'oil${oil.id}',
                                  child: Image.asset(
                                    oil.imgPath,
                                    fit: BoxFit.contain,
                                    height: 92.17.h,
                                    width: 836.49.w,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                  "Ref:${oil.id}",
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontFamily: "Gotham",
                                    fontWeight: FontWeight.w700,
                                    color: const Color.fromRGBO(80, 79, 79, 1),
                                  ),
                                ),
                                SizedBox(
                                  width: 600.w,
                                  child: Text(
                                    "ce soin riche aux huiles naturelles régénere à la base de huil de ricin , restructure et hydrate lescuticules fissuré et séchesil assoucit la peau et permet de détacher en douceur les cutils des angles et accélére leur repousse soigne l’épiderme et améliore sa capacitéde tétention de l’humidité",
                                    style: TextStyle(
                                      fontFamily: "Gotham",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 24.sp,
                                      color: const Color.fromRGBO(
                                          126, 126, 126, 1),
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
              const SizedBox(height: 12.5),
            ],
          ),
        ),
      ),
    );
  }
}
//  body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Stack(
//               children: [
//                 Center(
//                   child: Container(
//                     margin: EdgeInsets.only(top: 95.h),
//                     child: Image.asset(
//                       "assets/cuticul_oil/Card-oil.png",
//                       // height: 651.h,
//                       // width: 533.w,
//                     ),
//                   ),
//                 ),
//                 Center(
//                   child: RotatedBox(
//                     quarterTurns: 1,
//                     child: Container(
//                       // margin: EdgeInsets.only(right: 700.w),
//                       child: Hero(
//                         tag: 'oil${oil.id}',
//                         child: Image.asset(
//                           oil.imgPath,
//                           fit: BoxFit.contain,
//                           height: 95.h,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 12.h,
//             ),
//           ],
//         ),
//       ),