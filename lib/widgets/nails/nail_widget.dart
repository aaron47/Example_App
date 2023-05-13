import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../shared/tablet_detector.dart';
import 'Nail.dart';
import 'nail_details.dart';

class NailWidget extends StatelessWidget {
  const NailWidget({super.key, required this.nail, required this.nails});

  final Nail nail;
  final List<Nail> nails;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.to(NailDetails(nail: nail, nails: nails));
          },
          child: TabletDetector.isTablet(
                  MediaQueryData.fromWindow(WidgetsBinding.instance.window))
              ? Image.asset(
                  nail.imgPath,
                  width: 92.12.w,
                  height: 203.79.h,
                )
              : Image.asset(
                  nail.imgPath,
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
