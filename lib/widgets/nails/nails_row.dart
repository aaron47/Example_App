import 'package:essential_beauty/widgets/nails/nail_widget.dart';
import 'package:flutter/material.dart';

import '../../shared/tablet_detector.dart';
import 'Nail.dart';

class NailsRow extends StatefulWidget {
  const NailsRow({super.key});

  @override
  State<NailsRow> createState() => _NailsRowState();
}

class _NailsRowState extends State<NailsRow> {
  List<Nail> nails = [];

  void generateNails() {
    for (int i = 1; i < 113; i++) {
      String id = i.toString().padLeft(3, '0');
      String imgPath = TabletDetector.isTablet(
              MediaQueryData.fromWindow(WidgetsBinding.instance.window))
          ? "assets/nails/large/$id.png"
          : "assets/nails/$id.png";
      Nail nail = Nail(
        imgPath: imgPath,
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
      (nails.length / 10).ceil(),
      (index) => nails.sublist(index * 10,
          (index + 1) * 10 > nails.length ? nails.length : (index + 1) * 10),
    );

    rowsOfNailsPhone = List.generate(
      (nails.length / 5).ceil(),
      (index) => nails.sublist(index * 5,
          (index + 1) * 5 > nails.length ? nails.length : (index + 1) * 5),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TabletDetector.isTablet(MediaQueryData.fromWindow(WidgetsBinding.instance.window))
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
      padding: const EdgeInsets.symmetric(horizontal: 200),
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
                  for (var nail in row) NailWidget(nail: nail, nails: nails),
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
                for (var nail in row) NailWidget(nail: nail, nails: nails),
              ],
            ),
          ),
      ],
    );
  }
}
