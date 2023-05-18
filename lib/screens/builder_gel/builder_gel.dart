import 'package:essential_beauty/models/gel_builder.dart';
import 'package:essential_beauty/screens/rubber_base_gel/rubber_base_gel.dart';
import 'package:essential_beauty/shared/tablet_detector.dart';
import 'package:essential_beauty/widgets/custom_bottom_bar.dart';
import 'package:essential_beauty/widgets/nails/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'builder_gel_details.dart';

class BuilderGelScreen extends StatelessWidget {
  BuilderGelScreen({super.key});

  final List<BuilderGel> builderGelListRow = [
    BuilderGel(
        imgPath: "assets/gel_builder/01.png",
        icon: "assets/gel_builder/small/01.png",
        id: "01",
        shape: "assets/gel_builder/shape/01.png"),
    BuilderGel(
        imgPath: "assets/gel_builder/03.png",
        icon: "assets/gel_builder/small/03.png",
        id: "03",
        shape: "assets/gel_builder/shape/03.png"),
    BuilderGel(
        imgPath: "assets/gel_builder/04.png",
        icon: "assets/gel_builder/small/04.png",
        id: "04",
        shape: "assets/gel_builder/shape/04.png"),
    BuilderGel(
        imgPath: "assets/gel_builder/06.png",
        icon: "assets/gel_builder/small/06.png",
        id: "06",
        shape: "assets/gel_builder/shape/06.png"),
    BuilderGel(
        imgPath: "assets/gel_builder/07.png",
        icon: "assets/gel_builder/small/07.png",
        id: "07",
        shape: "assets/gel_builder/shape/07.png"),
    BuilderGel(
        imgPath: "assets/gel_builder/12.png",
        icon: "assets/gel_builder/small/12.png",
        id: "12",
        shape: "assets/gel_builder/shape/12.png"),
    BuilderGel(
        imgPath: "assets/gel_builder/17.png",
        icon: "assets/gel_builder/small/17.png",
        id: "17",
        shape: "assets/gel_builder/shape/17.png"),
  ];
  final isTablet = TabletDetector.isTablet(
      MediaQueryData.fromWindow(WidgetsBinding.instance.window));

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
                        padding: isTablet
                            ? const EdgeInsets.all(20)
                            : const EdgeInsets.all(40),
                        child: Text(
                          "Builder gel",
                          style: TextStyle(
                            fontSize: isTablet ? 32 : 22,
                            fontFamily: "Gotham",
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(11, 43, 45, 1),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            isTablet
                                ? ListGel(
                                    builderGelListRow:
                                        builderGelListRow.take(4).toList())
                                : ListGel(
                                    builderGelListRow:
                                        builderGelListRow.take(3).toList()),
                            isTablet
                                ? ListGel(
                                    builderGelListRow: builderGelListRow.sublist(4))
                                : ListGel(
                                    builderGelListRow:
                                        builderGelListRow.sublist(3, 6)),
                            isTablet
                                ? Container()
                                : ListGel(
                                    builderGelListRow: builderGelListRow.sublist(6)),
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
            categoryName: 'BUILDER GEL',
            heroTag: 'BuilderGel',
            imagePath: "assets/categories/BuilderGelLarge.png",
          ),
        ],
      ),
    );
  }
}

class ListGel extends StatelessWidget {
  ListGel({
    super.key,
    required this.builderGelListRow,
  });

  final List<BuilderGel> builderGelListRow;
  final isTablet = TabletDetector.isTablet(
      MediaQueryData.fromWindow(WidgetsBinding.instance.window));

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: builderGelListRow
          .map((e) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(
                          BuilderGelDetails(
                            gel: e,
                            gels: builderGelListRow,
                          ),
                           duration: const Duration(milliseconds: 800)
                          );
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Center(
                          child: Hero(
                            tag: 'Gel${e.id}',
                            
                            child: Image.asset(
                              e.imgPath,
                              width: isTablet ? 220.w : 440.w,
                            ),
                          ),
                        ),
                        Hero(
                          tag: 'Cover${e.id}',
                          child: Image.asset(
                            "assets/gel_builder/Coverr4.png",
                             width: isTablet ? 220.w : 500.w,
                            // fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Hero(
                    tag: 'Icon${e.id}',
                    child: Image.asset(
                      e.icon,
                      width: isTablet ? 57.w : 115.w,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    e.id,
                    style: TextStyle(
                      fontSize: isTablet ? 20.sp : 60.sp,
                      fontFamily: "Gotham",
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(20, 76, 80, 1),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ))
          .toList(),
    );
  }
}
