import 'package:carousel_slider/carousel_slider.dart';
import 'package:essential_beauty/models/gel_builder.dart';
import 'package:essential_beauty/screens/how_to_apply.dart';
import 'package:essential_beauty/shared/tablet_detector.dart';
import 'package:essential_beauty/widgets/custom_bottom_bar.dart';
import 'package:essential_beauty/widgets/nails/custom_app_bar.dart';
import 'package:essential_beauty/widgets/nails/nail_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BuilderGelDetails extends StatelessWidget {
  BuilderGelDetails({super.key, required this.gel, required this.gels});

  final BuilderGel gel;
  final List<BuilderGel> gels;
  final isTablet = TabletDetector.isTablet(MediaQueryData.fromWindow(WidgetsBinding.instance.window));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomBar(
        categoryName: 'BUILDER GEL',
        heroTag: 'BuilderGel',
        imagePath: "assets/categories/BuilderGelLarge.png",
      ),
      appBar: AppBar(),
      body: BaseBuilderGelDetailWidget(gel: gel),
    );
  }
}

class BaseBuilderGelDetailWidget extends StatelessWidget {
  BaseBuilderGelDetailWidget({
    super.key,
    required this.gel,
  });

  final BuilderGel gel;
  final isTablet = TabletDetector.isTablet(MediaQueryData.fromWindow(WidgetsBinding.instance.window));

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Stack(
              children: [
                Container(
                  margin:isTablet ? EdgeInsets.only(bottom : 20.h,left: 420.w) :  EdgeInsets.only(left: 220.w, top: 150.w),
                  child: Image.asset(
                    gel.shape,
                    width: isTablet ?840.w : MediaQuery.of(context).size.width,
                  ),
                ),
                Container(
                  margin: isTablet ? EdgeInsets.only(left: 650.w, top: 00.w) : EdgeInsets.only(left: MediaQuery.of(context).size.width/4, top: MediaQuery.of(context).size.height/9),
                  child: Hero(
                    tag: 'Gel${gel.id}',
                    child: Image.asset(
                      gel.imgPath,
                       width:isTablet ?640.w:  1280.w,
                    ),
                  ),
                ),
                Container(
                  margin: isTablet ? EdgeInsets.only(right: 350.w) : EdgeInsets.only(right: MediaQuery.of(context).size.width/7, top: MediaQuery.of(context).size.height/4),
                  child: Hero(
                    tag: 'Cover${gel.id}',
                    child: Image.asset(
                      "assets/gel_builder/Coverr5.png",
                       width:isTablet ?860.w:  1920.w,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Hero(
            tag: 'Icon${gel.id}',
            child: Image.asset(
              gel.icon,
              width: isTablet ? 77.w : 154.w,
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            gel.id,
            style: TextStyle(
              fontSize: isTablet ? 24.sp : 70.sp,
              fontFamily: "Gotham",
              fontWeight: FontWeight.w700,
              color: const Color.fromRGBO(20, 76, 80, 1),
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
        ],
      ),
    );
  }
}
