import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/tablet_detector.dart';
import 'Nail.dart';

class NailCard extends StatelessWidget {
  NailCard({super.key, required this.nail});
  final isTablet = TabletDetector.isTablet(
      MediaQueryData.fromWindow(WidgetsBinding.instance.window));

  final Nail nail;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        isTablet
            ? Image.asset(
                "assets/nails/Card.png",
                width: 379.13.w,
                height: 630.79.h,
                fit: BoxFit.contain,
              )
            : Image.asset(
                "assets/nails/Card.png",
                // width: 183.13.w,
                // height: 304.79.h,
                fit: BoxFit.contain,
              ),
        Positioned.fill(
          child: Align(
            child: isTablet
                ? Hero(
                  tag: "NailsPolish${nail.id}",
                  child: Image.asset(
                      "assets/nails/large/${nail.id}.png",
                      fit: BoxFit.contain,
                      height: 478.h,
                      width: 216.w,
                      // height: 200,
                    ),
                )
                : Image.asset(
                    "assets/nails/large/${nail.id}.png",
                    fit: BoxFit.contain,
                    height: 478.h,
                    width: 104.w,
                    // height: 200,
                  ),
          ),
        )
      ],
    );
  }
}
