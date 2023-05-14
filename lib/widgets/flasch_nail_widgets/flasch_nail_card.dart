import 'package:essential_beauty/widgets/flasch_nail_widgets/FlaschNail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedCrossFade(
        duration: const Duration(milliseconds: 300),
        firstChild: _LightFlaschNailCard(
          widget: widget,
          calqueController: calqueController,
        ),
        secondChild: _DarkFlachNailCard(
          flaschNail: widget.flaschNail,
        ),
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
    return Stack(
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
    );
  }
}

class _DarkFlachNailCard extends StatelessWidget {
  _DarkFlachNailCard({required this.flaschNail});

  final FlaschNail flaschNail;

  final CalqueController calqueController = Get.put(CalqueController());

  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}
