import 'package:essential_beauty/screens/flasch_nail_details.dart';
import 'package:essential_beauty/widgets/custom_bottom_bar.dart';
import 'package:essential_beauty/widgets/nails/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../widgets/flasch_nail_widgets/FlaschNail.dart';

class FlaschNailScreen extends StatelessWidget {
  FlaschNailScreen({super.key});

  final List<FlaschNail> flaschNailImages = [
    FlaschNail(path: "assets/flasch_nail/113.png", id: "01", imgId: "113"),
    FlaschNail(path: "assets/flasch_nail/114.png", id: "02", imgId: "114"),
    FlaschNail(path: "assets/flasch_nail/115.png", id: "03", imgId: "115"),
    FlaschNail(path: "assets/flasch_nail/116.png", id: "04", imgId: "116"),
    FlaschNail(path: "assets/flasch_nail/117.png", id: "05", imgId: "117"),
    FlaschNail(path: "assets/flasch_nail/118.png", id: "06", imgId: "118"),
    FlaschNail(path: "assets/flasch_nail/119.png", id: "07", imgId: "119"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomBar(
        categoryName: 'FLASCH NAIL',
        heroTag: 'FlaschNail',
        imagePath: "assets/categories/FlaschNailLarge.png",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: const CustomAppBar(),
      body: Center(
        child: Column(
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
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                alignment: Alignment.bottomCenter,
                width: MediaQuery.of(context).size.width -
                    MediaQuery.of(context).size.width / 3.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var nail in flaschNailImages)
                      GestureDetector(
                        onTap: () {
                          Get.to(FlaschNailDetails(
                              flaschNail: nail, nails: flaschNailImages));
                        },
                        child: Image.asset(
                          nail.path,
                          // width: MediaQuery.of(context).size.width / 10,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/flasch_nail/FlaschNailBg.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width -
                        MediaQuery.of(context).size.width / 3.5,
                    child: SingleChildScrollView(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (var nail in flaschNailImages)
                            Column(
                              children: [
                                const SizedBox(height: 10),
                                Text(
                                  nail.id,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Color.fromRGBO(137, 137, 137, 1),
                                    fontFamily: "Gotham",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Stack(
                                  children: [
                                    Image.asset(
                                      nail.path,
                                    ),
                                    Image.asset(
                                        "assets/flasch_nail/Calque.png"),
                                  ],
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
