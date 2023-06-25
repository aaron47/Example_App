import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../shared/tablet_detector.dart';
import 'Nail.dart';

class CalqueMatteController extends GetxController {
  var isCalqueMatteActivated = true.obs;

  void toggleCalque() {
    isCalqueMatteActivated.value = !isCalqueMatteActivated.value;
  }
}

class NailCard extends StatefulWidget {
  const NailCard({super.key, required this.nail});
  final Nail nail;

  @override
  State<NailCard> createState() => _NailCardState();
}

class _NailCardState extends State<NailCard> {
  final isTablet = TabletDetector.isTablet(
      MediaQueryData.fromWindow(WidgetsBinding.instance.window));
  final CalqueMatteController calqueController =
      Get.put(CalqueMatteController());
  bool showMatte = true;
  List<String> nonMatteNails = [
    "055",
    "056",
    "057",
    "058",
    "059",
    "060",
    "076",
    "077",
    "078",
    "079",
    "080",
    "081",
    "082",
    "086",
    "087",
    "088",
    "089",
    "101",
    "102",
    "103",
    "104"
  ];
  void toggleShowMatte() {
    setState(() {
      showMatte = !showMatte;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleShowMatte,
      child: Stack(
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
              child: AnimatedCrossFade(
                firstChild: Hero(
                  tag: "NailsPolishMatt${widget.nail.id}",
                  child: widget.nail.imgPath != null &&
                          !nonMatteNails.contains(widget.nail.id)
                      ? Image.asset(
                          // widget.nail.imgPath!,
                          "assets/nails/matte/${widget.nail.id}.png",
                          fit: BoxFit.contain,
                          height: 231,
                          width: 104,
                          // height: 200,
                        )
                      : const SizedBox(
                          height: 231,
                          width: 104,
                        ),
                ),
                secondChild: widget.nail.imgPath != null
                    ? isTablet
                        ? Hero(
                            tag: "NailsPolish${widget.nail.id}",
                            child: Image.asset(
                              "assets/nails/large/${widget.nail.id}.png",
                              fit: BoxFit.contain,
                              height: 478.h,
                              width: 216.w,
                              // height: 200,
                            ),
                          )
                        : Image.asset(
                            "assets/nails/large/${widget.nail.id}.png",
                            fit: BoxFit.contain,
                            height: 700.h,
                            width: 500.w,
                            // height: 200,
                          )
                    : SizedBox(
                        height: 478.h,
                        width: 216.w,
                      ),
                crossFadeState: showMatte
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 300),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 105,
            child: InkWell(
              onTap: () {
                toggleShowMatte();
              },
              child: Stack(
                children: [
                  showMatte
                      ? Image.asset("assets/nails/matte/RectangleMatteVert.png",
                          width: 75, height: 45, fit: BoxFit.contain)
                      : Image.asset(
                          "assets/nails/matte/RectangleMatteBlanc.png",
                          width: 75,
                          height: 45,
                          fit: BoxFit.contain,
                        ),
                  Positioned.fill(
                      child: Align(
                    child: Text(
                      "MATTE",
                      style: TextStyle(
                        color: showMatte
                            ? Colors.white
                            : const Color.fromRGBO(47, 90, 92, 1),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
