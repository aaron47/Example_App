import 'package:essential_beauty/widgets/nails/nail_widget.dart';
import 'package:flutter/material.dart';

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
      String imgPath = "assets/nails/large/$id.png";
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
      (nails.length / 10).ceil(),
      (index) => nails.sublist(index * 10,
          (index + 1) * 10 > nails.length ? nails.length : (index + 1) * 10),
    );

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
