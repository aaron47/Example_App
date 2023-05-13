import 'package:essential_beauty/screens/how_to_apply.dart';
import 'package:essential_beauty/screens/rubber_base_gel_details.dart';
import 'package:essential_beauty/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../shared/tablet_detector.dart';
import '../widgets/nails/Nail.dart';
import '../widgets/nails/custom_app_bar.dart';
import '../widgets/nails/nail_widget.dart';
import '../widgets/nails/nails_row.dart';

class RubberBaseGelScreen extends StatelessWidget {
  const RubberBaseGelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TabletDetector.isTablet(
            MediaQueryData.fromWindow(WidgetsBinding.instance.window))
        ? const RubberBaseGelTablet()
        : const RubberBaseGelPhone();
  }
}

class RubberBaseGelTablet extends StatelessWidget {
  const RubberBaseGelTablet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomBar(
        categoryName: 'RUBBER BASE GEL',
        heroTag: 'RubberBaseGel',
        imagePath: "assets/categories/RubberBaseGelLarge.png",
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
              width: 1400.w,
              decoration:
                  const BoxDecoration(color: Color.fromRGBO(240, 240, 240, 1)),
              padding: const EdgeInsets.all(50),
              child: Column(
                children: [
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 100, top: 50),
                      child: const Text(
                        "RUBBER BASE GEL",
                        style: TextStyle(
                          fontSize: 32,
                          fontFamily: "Gotham",
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(35, 40, 55, 1),
                        ),
                      ),
                    ),
                  ),
                  _RubberBaseGelRow()
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

class RubberBaseGelPhone extends StatelessWidget {
  const RubberBaseGelPhone({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 50, top: 50),
                    child: const Text(
                      "RUBBER BASE GEL",
                      style: TextStyle(
                        fontSize: 32,
                        fontFamily: "Gotham",
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(35, 40, 55, 1),
                      ),
                    ),
                  ),
                ),
                _RubberBaseGelRow()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RubberBaseGelRow extends StatefulWidget {
  @override
  State<_RubberBaseGelRow> createState() => _RubberBaseGelRowState();
}

class _RubberBaseGelRowState extends State<_RubberBaseGelRow> {
  List<Nail> nails = [];
  final isTablet = TabletDetector.isTablet(
      MediaQueryData.fromWindow(WidgetsBinding.instance.window));

  void generateNails() {
    for (int i = 1; i < 21; i++) {
      String id = i.toString().padLeft(2, '0');
      String imgPath = isTablet
          ? "assets/rubber_base_gel/$id.png"
          : "assets/rubber_base_gel/small/$id.png";
      Nail nail = Nail(
        imgPath: imgPath,
        id: id,
        description:
            'Time of polymerization in light of the UV lamp-2-3minutes LED-lamp-1 minute',
      );
      nails.add(nail);
    }
  }

  @override
  void initState() {
    super.initState();
    generateNails();
  }

  @override
  Widget build(BuildContext context) {
    List<List<Nail>> rowsOfNails = List.generate(
      (nails.length / 5).ceil(),
      (index) => nails.sublist(index * 5,
          (index + 1) * 5 > nails.length ? nails.length : (index + 1) * 5),
    );

    return Container(
      padding: isTablet ? const EdgeInsets.symmetric(horizontal: 200) : null,
      child: Column(
        children: [
          for (var row in rowsOfNails)
            Container(
              margin: const EdgeInsets.symmetric(vertical: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var nail in row)
                    _RubberBaseGelNailWidget(
                      nail: nail,
                      nails: nails,
                    ),
                  SizedBox(
                    width: 10.w,
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _RubberBaseGelNailWidget extends StatelessWidget {
  final Nail nail;
  final List<Nail> nails;
  final isTablet = TabletDetector.isTablet(
      MediaQueryData.fromWindow(WidgetsBinding.instance.window));

  _RubberBaseGelNailWidget({required this.nail, required this.nails});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.to(RubberBaseGelDetails(
              nail: nail,
              nails: nails,
            ));
          },
          child: isTablet
              ? Image.asset(nail.imgPath, width: 92.12.w, height: 203.79.h)
              : Image.asset(nail.imgPath),
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
