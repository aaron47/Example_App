// ignore_for_file: non_constant_identifier_names

import 'package:essential_beauty/widgets/flasch_nail_widgets/FlaschNail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../shared/tablet_detector.dart';

class CalqueController extends GetxController {
  var isCalqueActivated = true.obs;

  void toggleCalque() {
    isCalqueActivated.value = !isCalqueActivated.value;
  }
}

class FlaschNailCard extends StatefulWidget {
  const FlaschNailCard({super.key, required this.flaschNail});
  final FlaschNail flaschNail;

  @override
  State<FlaschNailCard> createState() => _FlaschNailCardState();
}

class _FlaschNailCardState extends State<FlaschNailCard> {
  final CalqueController calqueController = Get.put(CalqueController());
  final isTablet = TabletDetector.isTablet(
      MediaQueryData.fromWindow(WidgetsBinding.instance.window));

  late final Widget LIGHT_FLASCH_NAIL_CARD;
  late final Widget DARK_FLASCH_NAIL_CARD;

  @override
  void initState() {
    LIGHT_FLASCH_NAIL_CARD = isTablet
        ? _LightFlaschNailCard(
            widget: widget,
            calqueController: calqueController,
          )
        : _LightFlaschNailCardPhone(
            widget: widget,
            calqueController: calqueController,
          );

    DARK_FLASCH_NAIL_CARD = isTablet
        ? _DarkFlachNailCard(
            flaschNail: widget.flaschNail,
          )
        : _DarkFlachNailCardPhone(
            flaschNail: widget.flaschNail,
          );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedCrossFade(
        duration: const Duration(milliseconds: 300),
        firstChild: LIGHT_FLASCH_NAIL_CARD,
        secondChild: DARK_FLASCH_NAIL_CARD,
        crossFadeState: calqueController.isCalqueActivated.value
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
      ),
    );
  }
}

class _LightFlaschNailCard extends StatelessWidget {
  const _LightFlaschNailCard({
    required this.widget,
    required this.calqueController,
  });

  final FlaschNailCard widget;
  final CalqueController calqueController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => calqueController.toggleCalque(),
      child: Stack(
        children: [
          Image.asset(
            "assets/flasch_nail/FlaschNailCard1.png",
            width: 379.13.w,
            height: 630.79.h,
            fit: BoxFit.contain,
          ),
          Positioned.fill(
            child: Align(
              child: Transform.rotate(
                angle: 166.8,
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/flasch_nail/${widget.flaschNail.imgId}.png",
                      fit: BoxFit.contain,
                      width: 189.w,
                      height: 704.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 40,
            bottom: 5,
            child: GestureDetector(
              onTap: () => calqueController.toggleCalque(),
              child: Image.asset(
                "assets/flasch_nail/DarkVectorLarge.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LightFlaschNailCardPhone extends StatelessWidget {
  const _LightFlaschNailCardPhone({
    required this.widget,
    required this.calqueController,
  });

  final FlaschNailCard widget;
  final CalqueController calqueController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => calqueController.toggleCalque(),
      child: Center(
        child: Stack(
          children: [
            Image.asset(
              "assets/flasch_nail/FlaschNailCard1.png",
              width: 900.w,
              height: 400.h,
              fit: BoxFit.contain,
            ),
            Positioned.fill(
              child: Align(
                child: Transform.rotate(
                  angle: 166.8,
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/flasch_nail/${widget.flaschNail.imgId}.png",
                        fit: BoxFit.contain,
                        width: 500.w,
                        height: 704.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: 10,
              bottom: 5,
              child: GestureDetector(
                onTap: () => calqueController.toggleCalque(),
                child: Image.asset(
                  "assets/flasch_nail/DarkVectorLarge.png",
                  height: 35.h,
                  width: 150.w,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DarkFlachNailCard extends StatelessWidget {
  _DarkFlachNailCard({required this.flaschNail});

  final FlaschNail flaschNail;

  final CalqueController calqueController = Get.put(CalqueController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => calqueController.toggleCalque(),
      child: Stack(
        children: [
          Image.asset(
            "assets/flasch_nail/FlaschNailCard2.png",
            width: 379.13.w,
            height: 630.79.h,
            fit: BoxFit.contain,
          ),
          Positioned.fill(
            child: Align(
              child: Transform.rotate(
                angle: 166.8,
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/flasch_nail/${flaschNail.imgId}.png",
                      fit: BoxFit.contain,
                      width: 189.w,
                      height: 704.h,
                    ),
                    Image.asset(
                      "assets/flasch_nail/Calque.png",
                      fit: BoxFit.contain,
                      width: 189.w,
                      height: 704.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 40,
            bottom: 5,
            child: GestureDetector(
              onTap: () => calqueController.toggleCalque(),
              child: Image.asset(
                "assets/flasch_nail/LightVectorLarge.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DarkFlachNailCardPhone extends StatelessWidget {
  _DarkFlachNailCardPhone({required this.flaschNail});

  final FlaschNail flaschNail;

  final CalqueController calqueController = Get.put(CalqueController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => calqueController.toggleCalque(),
      child: Stack(
        children: [
          Image.asset(
            "assets/flasch_nail/FlaschNailCard2.png",
            width: 900.w,
            height: 400.h,
            fit: BoxFit.contain,
          ),
          Positioned.fill(
            child: Align(
              child: Transform.rotate(
                angle: 166.8,
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/flasch_nail/${flaschNail.imgId}.png",
                      fit: BoxFit.contain,
                      width: 500.w,
                      height: 704.h,
                    ),
                    Image.asset(
                      "assets/flasch_nail/Calque.png",
                      fit: BoxFit.contain,
                      width: 500.w,
                      height: 704.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 10,
            bottom: 5,
            child: GestureDetector(
              onTap: () => calqueController.toggleCalque(),
              child: Image.asset(
                "assets/flasch_nail/LightVectorLarge.png",
                height: 35.h,
                width: 150.w,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
