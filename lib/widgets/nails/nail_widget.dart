import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../shared/matte_controller.dart';
import '../../shared/tablet_detector.dart';
import 'Nail.dart';
import 'nail_details.dart';

class NailWidget extends StatelessWidget {
  const NailWidget({super.key, required this.nail, required this.nails, this.isMatte = false});

  final Nail nail;
  final List<Nail> nails;
  final bool isMatte;

  @override
  Widget build(BuildContext context) {
    final matteController = Get.put(MatteController());

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.to(NailDetails(nail: nail, nails: nails), duration: const Duration(milliseconds: 800));
          },
          child: Obx(() {
            // var imagePath = ;
            final width = TabletDetector.isTablet(
              MediaQueryData.fromWindow(WidgetsBinding.instance.window),
            )
                ? 92.12.w.toDouble()
                : 46.0;
            final height = TabletDetector.isTablet(
              MediaQueryData.fromWindow(WidgetsBinding.instance.window),
            )
                ? 203.79.h.toDouble()
                : 107.0;
//return matteController.isMatte.value == true ?Text(nail.imgPath!) : Text(nail.imgPathMatte!);
            return matteController.isMatte.value == true
                ? Hero(
                    tag: "NailsPolish${nail.id}",
                    child: Image.asset(
                      nail.imgPath!,
                      width: width,
                      height: height,
                    ),
                  )
                : Hero(
                    tag: "NailsPolish${nail.id}",
                    child: Image.asset(
                      nail.imgPath!,
                      width: width,
                      height: height,
                    ),
                  );
          }),
        ),

        const SizedBox(height: 10),
        // Text("${matteController.isMatte.value}"),
        Text(
          nail.id,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontFamily: "Gotham",
            color: Color.fromRGBO(106, 104, 104, 1),
          ),
        ),
      ],
    );
  }
}
