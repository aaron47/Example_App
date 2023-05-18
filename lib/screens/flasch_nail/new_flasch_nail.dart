import 'package:essential_beauty/screens/flasch_nail/flasch_nail_details.dart';
import 'package:essential_beauty/widgets/custom_bottom_bar.dart';
import 'package:essential_beauty/widgets/nails/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/flasch_nail_widgets/FlaschNail.dart';

class NewFlaschNailScreen extends StatelessWidget {
  NewFlaschNailScreen({super.key});

  final List<FlaschNail> flaschNailImages = [
    FlaschNail(
      path: "assets/flasch_nail/113.png",
      id: "01",
      imgId: "113",
    ),
    FlaschNail(
      path: "assets/flasch_nail/113.png",
      id: "01",
      imgId: "113",
      withCalque: true,
    ),
    FlaschNail(
      path: "assets/flasch_nail/114.png",
      id: "02",
      imgId: "114",
    ),
    FlaschNail(
      path: "assets/flasch_nail/114.png",
      id: "02",
      imgId: "114",
      withCalque: true,
    ),
    FlaschNail(
      path: "assets/flasch_nail/115.png",
      id: "03",
      imgId: "115",
    ),
    FlaschNail(
      path: "assets/flasch_nail/115.png",
      id: "03",
      imgId: "115",
      withCalque: true,
    ),
    FlaschNail(
      path: "assets/flasch_nail/116.png",
      id: "04",
      imgId: "116",
    ),
    FlaschNail(
      path: "assets/flasch_nail/116.png",
      id: "04",
      imgId: "116",
      withCalque: true,
    ),
    FlaschNail(
      path: "assets/flasch_nail/117.png",
      id: "05",
      imgId: "117",
    ),
    FlaschNail(
      path: "assets/flasch_nail/117.png",
      id: "05",
      imgId: "117",
      withCalque: true,
    ),
    FlaschNail(
      path: "assets/flasch_nail/118.png",
      id: "06",
      imgId: "118",
    ),
    FlaschNail(
      path: "assets/flasch_nail/118.png",
      id: "06",
      imgId: "118",
      withCalque: true,
    ),
    FlaschNail(
      path: "assets/flasch_nail/119.png",
      id: "07",
      imgId: "119",
    ),
    FlaschNail(
      path: "assets/flasch_nail/119.png",
      id: "07",
      imgId: "119",
      withCalque: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Container(
                width: 1511.w,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(240, 240, 240, 1)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: const Center(
                        child: Text(
                          "FLASCH NAIL",
                          style: TextStyle(
                            fontFamily: "Gotham",
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(35, 40, 55, 1),
                            fontSize: 32,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      alignment: Alignment.bottomCenter,
                      width: MediaQuery.of(context).size.width -
                          MediaQuery.of(context).size.width / 3.5,
                      child: Wrap(
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.center,
                        children: [
                          for (var nail in flaschNailImages)
                            GestureDetector(
                              onTap: () {
                                Get.to(FlaschNailDetails(
                                    flaschNail: nail, nails: flaschNailImages));
                              },
                              child: !nail.withCalque
                                  ? Image.asset(
                                      nail.path,
                                      width: 160.w,
                                      height: 625.h,
                                      // width: MediaQuery.of(context).size.width / 10,
                                    )
                                  : Stack(
                                      children: [
                                        Image.asset(
                                          nail.path,
                                          width: 160.w,
                                          height: 625.h,
                                          // width: MediaQuery.of(context).size.width / 10,
                                        ),
                                        Image.asset(
                                          "assets/flasch_nail/Calque.png",
                                          width: 160.w,
                                          height: 625.h,
                                          // width: MediaQuery.of(context).size.width / 10,
                                        ),
                                      ],
                                    ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const CustomBottomBar(
            categoryName: 'FLASCH NAIL',
            heroTag: 'FlaschNail',
            imagePath: "assets/categories/FlaschNailLarge.png",
          ),
        ],
      ),
    );
  }
}
