import 'package:carousel_slider/carousel_slider.dart';
import 'package:essential_beauty/models/gel_builder.dart';
import 'package:essential_beauty/screens/how_to_apply.dart';
import 'package:essential_beauty/widgets/nails/custom_app_bar.dart';
import 'package:essential_beauty/widgets/nails/nail_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BuilderGelDetails extends StatelessWidget {
  const BuilderGelDetails({super.key, required this.gel, required this.gels});

  final BuilderGel gel;
  final List<BuilderGel> gels;

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
          "assets/categories/BuilderGelLarge.png",
        ),
      ),
      appBar: const CustomAppBar(),
      // body: BaseBuilderGelDetailWidget(gel: gel),

      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: CarouselSlider(
          options: CarouselOptions(
            initialPage: int.parse(gel.id) - 1,
            // enableInfiniteScroll: true,
            //    enlargeCenterPage: true,
            //     enlargeFactor: 0.8,
          ),
          items: gels.map((n) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: BaseBuilderGelDetailWidget(gel: n),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}

class BaseBuilderGelDetailWidget extends StatelessWidget {
  const BaseBuilderGelDetailWidget({
    super.key,
    required this.gel,
  });

  final BuilderGel gel;

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
                  margin: EdgeInsets.only(left: 350.w, top: 100.w),
                  child: Image.asset(
                    gel.shape,
                    // width: 533.w,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 550.w, top: 100.w),
                  child: Hero(
                    tag: 'Gel${gel.id}',
                    child: Image.asset(
                      gel.imgPath,
                      // width: 533.w,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 650.w),
                  child: Hero(
                    tag: 'Cover${gel.id}',
                    child: Image.asset(
                      "assets/gel_builder/Coverr5.png",
                      // width: 533.w,
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
              width: 77.w,
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            gel.id,
            style: TextStyle(
              fontSize: 24.sp,
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
