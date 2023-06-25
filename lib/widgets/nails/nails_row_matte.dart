import 'package:essential_beauty/shared/matte_controller.dart';
import 'package:essential_beauty/widgets/nails/nail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../shared/tablet_detector.dart';
import 'Nail.dart';

class NailsRowMatte extends StatefulWidget {
  const NailsRowMatte({super.key});

  @override
  State<NailsRowMatte> createState() => _NailsRowMatteState();
}

class _NailsRowMatteState extends State<NailsRowMatte> {
  List<Nail> nails = [];
  List<String> nonMatteNails = [
    "55",
    "56",
    "57",
    "58",
    "59",
    "60",
    "76",
    "77",
    "78",
    "79",
    "80",
    "81",
    "82",
    "86",
    "87",
    "88",
    "89",
    "101",
    "102",
    "103",
    "104"
  ];

// fihomech matte
// 55.56.57.58.59.60
// 76.77.78.79.80.81.82
// 86.87.88.89.101.102
// 103.104

  final matteController = Get.put(MatteController());

  void generateNails() {
    for (int i = 1; i < 113; i++) {
      String id = i.toString().padLeft(3, '0');
      String imgPath = "assets/nails/matte/$id.png";
      Nail nail = Nail(
        imgPath: nonMatteNails.contains(i.toString()) ? null : imgPath,
        id: id,
        description:
            'Time of polymerization in light of the UV lamp-2-3minutes LED-lamp-1 minute',
      );
      nails.add(nail);
    }
  }

  late List<List<Nail>> rowsOfNails;
  late List<List<Nail>> rowsOfNailsPhone;
  @override
  void initState() {
    super.initState();
    generateNails();

    rowsOfNails = List.generate(
      (nails.length / 15).ceil(),
      (index) => nails.sublist(index * 15,
          (index + 1) * 15 > nails.length ? nails.length : (index + 1) * 15),
    );

    rowsOfNailsPhone = List.generate(
      (nails.length / 5).ceil(),
      (index) => nails.sublist(index * 5,
          (index + 1) * 5 > nails.length ? nails.length : (index + 1) * 5),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TabletDetector.isTablet(
            MediaQueryData.fromWindow(WidgetsBinding.instance.window))
        ? NailRowTablet(rowsOfNails: rowsOfNails, nails: nails)
        : NailRowPhone(rowsOfNails: rowsOfNailsPhone, nails: nails);
  }
}

class NailRowTablet extends StatelessWidget {
  const NailRowTablet({
    super.key,
    required this.rowsOfNails,
    required this.nails,
  });

  final List<List<Nail>> rowsOfNails;
  final List<Nail> nails;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          for (var row in rowsOfNails)
            Container(
              margin: const EdgeInsets.symmetric(vertical: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var nail in row) ...[
                    if (nail.imgPath == null)
                      Column(
                        children: [
                          SizedBox(
                            width: 92.12.w,
                            height: 203.79.h,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey,
                              ),
                            ),
                          ),
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
                      )
                    else
                      NailWidget(nail: nail, nails: nails)
                  ],
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class NailRowPhone extends StatelessWidget {
  const NailRowPhone({
    super.key,
    required this.rowsOfNails,
    required this.nails,
  });

  final List<List<Nail>> rowsOfNails;
  final List<Nail> nails;

  @override
  Widget build(BuildContext context) {
    final matteController = Get.put(MatteController());
    return Column(
      children: [
        for (var row in rowsOfNails)
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Text("${matteController.isMatte.value}"),
                for (var nail in row) ...[
                  if (nail.imgPath == null)
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 102.h - 30,
                            bottom: 102.h - 30,
                          ),
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey,
                          ),
                        ),
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
                    )
                  else
                    NailWidget(
                      nail: nail,
                      nails: nails,
                      isMatte: matteController.isMatte.value,
                    ),
                ],
              ],
            ),
          ),
      ],
    );
  }
}
