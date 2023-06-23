import 'package:essential_beauty/models/gel_builder.dart';
import 'package:essential_beauty/screens/rubber_base_gel/rubber_base_gel.dart';
import 'package:essential_beauty/shared/tablet_detector.dart';
import 'package:essential_beauty/widgets/custom_bottom_bar.dart';
import 'package:essential_beauty/widgets/nails/custom_app_bar.dart';
import 'package:essential_beauty/widgets/nails/nail_details.dart';
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
      appBar: const CustomAppBar(),
      // body: BaseBuilderGelDetailWidget(gel: gel),
      body: Stack(
        children: [
          Container(
            // decoration: const BoxDecoration(color: Colors.white),
            child: isTablet ? BaseBuilderGelDetailWidget(gel: gel) : BaseBuilderGelDetailWidgetPhone(gel: gel),
          ),
          const CustomBottomBar(
            categoryName: 'BUILDER GEL',
            heroTag: 'BuilderGel',
            imagePath: "assets/categories/BuilderGelLarge.png",
          ),
        ],
      ),
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
    return Row(
      children: [
        const ButtonPlayVideo(),
        Container(
          width: 1511.w,
          decoration: const BoxDecoration(color: Color.fromRGBO(240, 240, 240, 1)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: isTablet ? const EdgeInsets.all(20) : const EdgeInsets.all(20),
                  child: Text(
                    "Builder gel",
                    style: TextStyle(
                      fontSize: isTablet ? 32 : 22,
                      fontFamily: "Gotham",
                      fontWeight: FontWeight.w700,
                      color: const Color.fromRGBO(11, 43, 45, 1),
                    ),
                  ),
                ),
              ),
              Center(
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
                          Align(
                            alignment: Alignment.topCenter,
                            child: Stack(
                              children: [
                                SizedBox(
                                  width: 840.w,
                                  height: 840.w,
                                ),
                                Image.asset(
                                  gel.shape,
                                  width: isTablet ? 840.w : MediaQuery.of(context).size.width,
                                ),
                                Positioned.fill(
                                  top: 840.w - (77.w + 10.h + 30.h),
                                  bottom: 0.0,
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Hero(
                                          tag: 'Icon${gel.id}',
                                          child: Image.asset(
                                            gel.icon,
                                            width: isTablet ? 77.w : 154.w,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.h,
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
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Positioned.fill(
                            child: Center(
                              child: SizedBox(
                                width: isTablet ? 460.w + 440.w - 100.w : 900.w + 880.w,
                                height: 460.w + 30.w, // 460+440
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        // margin: isTablet
                                        //     ? EdgeInsets.only(left: 650.w, top: 00.w)
                                        //     : EdgeInsets.only(left: MediaQuery.of(context).size.width / 4, top: MediaQuery.of(context).size.height / 9),
                                        child: Hero(
                                          tag: 'Gel${gel.id}',
                                          child: Image.asset(
                                            gel.imgPath,
                                            width: isTablet ? 460.w : 900.w,
                                            // width: isTablet ? 640.w : 1280.w,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Container(
                                        // margin: isTablet
                                        //     ? EdgeInsets.only(right: 350.w)
                                        //     : EdgeInsets.only(right: MediaQuery.of(context).size.width / 7, top: MediaQuery.of(context).size.height / 4),
                                        child: Hero(
                                          tag: 'Cover${gel.id}',
                                          child: Transform.rotate(
                                            angle: 5.5,
                                            child: Image.asset(
                                              "assets/gel_builder/Coverr4.png",
                                              width: isTablet ? 440.w : 880.w,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   height: 10.h,
                    // ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class BaseBuilderGelDetailWidgetPhone extends StatelessWidget {
  BaseBuilderGelDetailWidgetPhone({
    super.key,
    required this.gel,
  });

  final BuilderGel gel;
  final isTablet = TabletDetector.isTablet(MediaQueryData.fromWindow(WidgetsBinding.instance.window));

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: isTablet ? const EdgeInsets.all(20) : const EdgeInsets.only(top: 20, right: 20),
                  child: Row(
                    children: [
                      const PlayButtonLargePhone(
                        bottomMargin: 0,
                      ),
                      Text(
                        "Builder gel",
                        style: TextStyle(
                          fontSize: isTablet ? 32 : 22,
                          fontFamily: "Gotham",
                          fontWeight: FontWeight.w700,
                          color: const Color.fromRGBO(11, 43, 45, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
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
                          Align(
                            alignment: Alignment.topCenter,
                            child: Stack(
                              children: [
                                const SizedBox(
                                    //  width: 840.w,
                                    // height: 840.w,
                                    ),
                                Image.asset(
                                  gel.shape,
                                  width: isTablet ? 840.w : MediaQuery.of(context).size.width,
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              height: 500.h,
                              //460.w + 30.w,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      // margin: isTablet
                                      //     ? EdgeInsets.only(left: 650.w, top: 00.w)
                                      //     : EdgeInsets.only(left: MediaQuery.of(context).size.width / 4, top: MediaQuery.of(context).size.height / 9),
                                      child: Hero(
                                        tag: 'Gel${gel.id}',
                                        child: Image.asset(
                                          gel.imgPath,
                                          fit: BoxFit.contain,
                                          // width:  MediaQuery.of(context).size.width,
                                          // width: isTablet ? 460.w : 2200.w,
                                          //height: isTablet ? 460.w : 2200.w,
                                          width: isTablet ? 640.w : 1080.w,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Container(
                                      // margin: isTablet
                                      //     ? EdgeInsets.only(right: 350.w)
                                      //     : EdgeInsets.only(right: MediaQuery.of(context).size.width / 7, top: MediaQuery.of(context).size.height / 4),
                                      child: Hero(
                                        tag: 'Cover${gel.id}',
                                        child: Transform.rotate(
                                          angle: 5.5,
                                          child: Image.asset(
                                            "assets/gel_builder/Coverr4.png",
                                            width: isTablet ? 440.w : 980.w,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Hero(
                            tag: 'Icon${gel.id}',
                            child: Image.asset(
                              gel.icon,
                              width: isTablet ? 77.w : 154.w,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
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
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   height: 10.h,
                    // ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
