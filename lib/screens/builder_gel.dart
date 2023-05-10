import 'package:essential_beauty/models/gel_builder.dart';
import 'package:essential_beauty/screens/builder_gel_details.dart';
import 'package:essential_beauty/widgets/custom_bottom_bar.dart';
import 'package:essential_beauty/widgets/nails/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BuilderGelScreen extends StatelessWidget {
  BuilderGelScreen({super.key});

  final List<BuilderGel> builderGelListRow1 = [
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
  ];
  final List<BuilderGel> builderGelListRow2 = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomBar(
        categoryName: 'BUILDER GEL',
        heroTag: 'BuilderGel',
        imagePath: "assets/categories/BuilderGelLarge.png",
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
                "Builder gel",
                style: TextStyle(
                  fontSize: 32.sp,
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
                  ListGel(builderGelListRow1: builderGelListRow1),
                  ListGel(builderGelListRow1: builderGelListRow2),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ListGel extends StatelessWidget {
  const ListGel({
    super.key,
    required this.builderGelListRow1,
  });

  final List<BuilderGel> builderGelListRow1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: builderGelListRow1
          .map((e) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(BuilderGelDetails(gel: e),
                          duration: const Duration(milliseconds: 800));
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Center(
                          child: Hero(
                            tag: 'Gel${e.id}',
                            child: Image.asset(
                              e.imgPath,
                              width: 220.w,
                            ),
                          ),
                        ),
                        Hero(
                          tag: 'Cover${e.id}',
                          child: Image.asset(
                            "assets/gel_builder/Coverr7.png",
                            width: 250.w,
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
                      width: 57.w,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    e.id,
                    style: TextStyle(
                      fontSize: 20.sp,
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
