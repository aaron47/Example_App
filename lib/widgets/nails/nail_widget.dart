import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../shared/matte_controller.dart';
import '../../shared/tablet_detector.dart';
import 'Nail.dart';
import 'nail_details.dart';

class NailWidget extends StatelessWidget {
  const NailWidget(
      {super.key,
      required this.nail,
      required this.nails,
      this.isMatte = false});

  final Nail nail;
  final List<Nail> nails;
  final bool isMatte;

  @override
  Widget build(BuildContext context) {
    final MatteController matteController = Get.put(MatteController());
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.to(NailDetails(nail: nail, nails: nails),
                duration: Duration(milliseconds: 800));
          },
          child: Obx(
            () => TabletDetector.isTablet(
                    MediaQueryData.fromWindow(WidgetsBinding.instance.window))
                ? Hero(
                    tag: "NailsPolish${nail.id}",
                    child: Image.asset(
                      matteController.isMatte.value
                          ? nail.imgPathMatte!
                          : nail.imgPath!,
                      width: 92.12.w,
                      height: 203.79.h,
                    ),
                  )
                : Image.asset(
                    matteController.isMatte.value
                        ? nail.imgPathMatte!
                        : nail.imgPath!,
                    width: 47.884,
                    height: 105.926,
                  ),
          ),
        ),
        const SizedBox(height: 10),
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
