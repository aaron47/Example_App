import 'package:carousel_slider/carousel_slider.dart';
import 'package:essential_beauty/models/cuticul_oil.dart';
import 'package:essential_beauty/shared/tablet_detector.dart';
import 'package:essential_beauty/widgets/custom_bottom_bar.dart';
import 'package:essential_beauty/widgets/nails/custom_app_bar.dart';
import 'package:essential_beauty/widgets/nails/nail_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CuticulOilDetails extends StatelessWidget {
  CuticulOilDetails({super.key, required this.oil, required this.oils});
  final isTablet = TabletDetector.isTablet(MediaQueryData.fromWindow(WidgetsBinding.instance.window));
  final CuticulOil oil;
  final List<CuticulOil> oils;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: BaseCuticulOilWidget(oil: oil),
      appBar: const CustomAppBar(),
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: CarouselSlider(
              options: CarouselOptions(
                initialPage: int.parse(oil.id) - 1,
                viewportFraction: 1.0,
                height: MediaQuery.of(context).size.height,
                // enableInfiniteScroll: true,
                //    enlargeCenterPage: true,
                //     enlargeFactor: 0.8,
              ),
              items: oils.map((n) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      decoration: const BoxDecoration(color: Colors.white),
                      child: isTablet ? BaseCuticulOilWidget(oil: n) : BaseCuticulOilPhoneWidget(oil: n),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          const CustomBottomBar(
            imagePath: "assets/categories/CuticuleOilLarge.png",
            heroTag: "CuticuleOil",
            categoryName: "CUTICULE OIL",
          ),
        ],
      ),
    );
  }
}

class BaseCuticulOilWidget extends StatelessWidget {
  const BaseCuticulOilWidget({
    super.key,
    required this.oil,
  });

  final CuticulOil oil;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            width: 1511.w,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(color: Color.fromRGBO(240, 240, 240, 1)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Image.asset("assets/CloseButton.png", width: 66.21.w, height: 66.h),
                  ),
                ),
                Center(
                  heightFactor: 1,
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.35),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 50.h),
                              child: Image.asset(
                                "assets/cuticul_oil/Card-oil.png",
                                // height: 550.h,
                                // width: 533.w,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "CUTICULE OIL",
                                  style: TextStyle(
                                    fontSize: 32.sp,
                                    fontFamily: "Gotham",
                                    fontWeight: FontWeight.w700,
                                    color: const Color.fromRGBO(35, 40, 55, 1),
                                  ),
                                ),
                                const PlayButtonLarge(
                                  bottomMargin: 0,
                                ),
                                SizedBox(
                                  width: 415.w,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Ref:${oil.id}",
                                          style: TextStyle(
                                            fontSize: 20.sp,
                                            fontFamily: "Gotham",
                                            fontWeight: FontWeight.w700,
                                            color: const Color.fromRGBO(80, 79, 79, 1),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 800.w,
                                          child: Text(
                                            "ce soin riche aux huiles naturelles régénere à la base de huil de ricin ,restructure et hydrate lescuticules fissuré et séchesil assoucit la peau et permet de détacher en douceur les cutils des angles et accélére leur repousse ",
                                            style: TextStyle(
                                              fontFamily: "Gotham",
                                              fontWeight: FontWeight.w400,
                                              fontSize: 24.sp,
                                              color: const Color.fromRGBO(126, 126, 126, 1),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
        Hero(
          tag: 'oil${oil.id}',
          child: Align(
            // alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: (() => Get.back()),
              child: RotatedBox(
                  quarterTurns: 1,
                  child: Image.asset(
                    oil.imgPath,
                    fit: BoxFit.contain,
                  )
                  // child: ScaleImage(imagePath: oil.imgPath),
                  ),
            ),
          ),
        ),
      ],
    );
  }
}

class BaseCuticulOilPhoneWidget extends StatefulWidget {
  const BaseCuticulOilPhoneWidget({
    super.key,
    required this.oil,
  });

  final CuticulOil oil;

  @override
  State<BaseCuticulOilPhoneWidget> createState() => _BaseCuticulOilPhoneWidgetState();
}

class _BaseCuticulOilPhoneWidgetState extends State<BaseCuticulOilPhoneWidget> {
  bool _alignmentChanged = false;

  @override
  Widget build(BuildContext context) {
    Alignment alignment = _alignmentChanged ? Alignment.centerLeft : Alignment.center;

    if (!_alignmentChanged) {
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          _alignmentChanged = true;
        });
      });
    }
    return Stack(
      children: [
        Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(color: Color.fromRGBO(240, 240, 240, 1)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // InkWell(
                //   onTap: () {
                //     Get.back();
                //   },
                //   child: Align(
                //     alignment: Alignment.topRight,
                //     child: Image.asset("assets/CloseButton.png", width: 66.21.w, height: 66.h),
                //   ),
                // ),
                Center(
                  heightFactor: 1,
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 80.h),
                              child: Image.asset(
                                "assets/cuticul_oil/Card-oil.png",
                                height: 550.h,
                                width: 733.w,
                              ),
                            ),
                            Container(
                                  margin: EdgeInsets.only(top: 160.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "CUTICULE OIL",
                                    style: TextStyle(
                                      fontSize: 32.sp,
                                      fontFamily: "Gotham",
                                      fontWeight: FontWeight.w700,
                                      color: const Color.fromRGBO(35, 40, 55, 1),
                                    ),
                                  ),
                                  const PlayButtonLargePhone(
                                    bottomMargin: 0,
                                  ),
                                  SizedBox(
                                    width: 915.w,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Ref:${widget.oil.id}",
                                            style: TextStyle(
                                              fontSize: 70.sp,
                                              fontFamily: "Gotham",
                                              fontWeight: FontWeight.w700,
                                              color: const Color.fromRGBO(80, 79, 79, 1),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 1900.w,
                                            child: Text(
                                              "ce soin riche aux huiles naturelles régénere à la base de huil de ricin ,restructure et hydrate lescuticules fissuré et séchesil assoucit la peau et permet de détacher en douceur les cutils des angles et accélére leur repousse ",
                                              style: TextStyle(
                                                fontFamily: "Gotham",
                                                fontWeight: FontWeight.w400,
                                                fontSize: 54.sp,
                                                color: const Color.fromRGBO(126, 126, 126, 1),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
        Hero(
          tag: 'oil${widget.oil.id}',
          child: AnimatedAlign(
            alignment: alignment,
            duration: const Duration(seconds: 1),
            curve: Curves.easeInBack,
            child: Container(
              margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.15),
              child: GestureDetector(
                onTap: (() => Get.back()),
                child: RotatedBox(quarterTurns: 1, child: Image.asset(widget.oil.imgPath, fit: BoxFit.contain, width: 2200.w)
                    // child: ScaleImage(imagePath: oil.imgPath),
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ScaleImage extends StatefulWidget {
  final String imagePath;

  const ScaleImage({required this.imagePath});

  @override
  _ScaleImageState createState() => _ScaleImageState();
}

class _ScaleImageState extends State<ScaleImage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500), // Set the desired animation duration
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.0).animate(_animationController); // Specify the target scale values

    _animationController.forward(); // Start the animation
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Image.asset(
            widget.imagePath,
            fit: BoxFit.contain,
            // height: 52.17.h,
            // width: 836.49.w,
          ),
        );
      },
    );
  }
}
