import 'package:essential_beauty/screens/how_to_apply.dart';
import 'package:essential_beauty/widgets/custom_bottom_bar.dart';
import 'package:essential_beauty/widgets/nails/custom_app_bar.dart';
import 'package:essential_beauty/widgets/nails/nails_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NailsPolishScreen extends StatelessWidget {
  const NailsPolishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomBar(
        imagePath: "assets/categories/NailsPolishLarge.png",
        heroTag: "NailsPolish",
        categoryName: "NAILS POLISH",
      ),
      appBar: const CustomAppBar(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.12,
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: const EdgeInsets.only(top: 80),
                width: 158.w,
                height: 147.h,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(75),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(75),
                  ),
                  image: DecorationImage(
                    image: AssetImage("assets/AppBarBackground.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    Get.to(const HowToApplyScreen());
                  },
                  child: Image.asset(
                    "assets/PlayButtonLarge.png",
                    width: 65.w,
                    height: 65.h,
                  ),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              decoration:
                  const BoxDecoration(color: Color.fromRGBO(240, 240, 240, 1)),
              padding: const EdgeInsets.all(50),
              child: Column(
                children: [
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 100, top: 50),
                      child: const Text(
                        "Nails Polish",
                        style: TextStyle(
                          fontSize: 32,
                          fontFamily: "Gotham",
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(35, 40, 55, 1),
                        ),
                      ),
                    ),
                  ),
                  const NailsRow()
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.1,
          ),
        ],
      ),
    );
  }
}
