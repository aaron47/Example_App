import 'package:essential_beauty/models/cuticul_oil.dart';
import 'package:essential_beauty/models/gel_builder.dart';
import 'package:essential_beauty/screens/how_to_apply.dart';
import 'package:essential_beauty/widgets/nails/custom_app_bar.dart';
import 'package:essential_beauty/widgets/nails/nail_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CuticulOIlDetails extends StatelessWidget {
  const CuticulOIlDetails({super.key, required this.oil});

  final CuticulOil oil;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton.large(
        backgroundColor: Colors.transparent,
        elevation: 0,
        onPressed: () {
          Get.back();
        },
        child: Image.asset(
          "assets/categories/CuticuleOil.png",
        ),
      ),
      appBar: const CustomAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 95.h
                    ),
                    child: Image.asset(
                      "assets/cuticul_oil/Card-oil.png",
                                  // height: 651.h,
                      // width: 533.w,
                    ),
                  ),
                ),
                Center(
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: Container(
                      // margin: EdgeInsets.only(right: 700.w),
                      child: Hero(
                        tag: 'oil${oil.id}',
                        child: Image.asset(
                          oil.imgPath,
                          fit: BoxFit.contain,
                          height: 95.h,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 12.h,
            ),
          ],
        ),
      ),
    );
  }
}
