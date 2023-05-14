import 'package:essential_beauty/widgets/nails/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/nails/nail_details.dart';

class OrangeDetailsScreen extends StatelessWidget {
  const OrangeDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Center(
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
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 95.h),
                          child: Image.asset(
                            "assets/nails/Card.png",
                            fit: BoxFit.contain,
                            height: 652.h,
                            width: 408.w,
                          ),
                        ),
                        Positioned.fill(
                          child: Align(
                            child: Image.asset(
                              "assets/cuticul_oil/Orange.png",
                              fit: BoxFit.contain,
                              height: 681.h,
                              width: 265.w,
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
                          width: 375,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Ref:Orange",
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
