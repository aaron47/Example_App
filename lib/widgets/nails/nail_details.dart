import 'package:essential_beauty/widgets/nails/nail_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Nail.dart';

class NailDetails extends StatelessWidget {
  const NailDetails({super.key, required this.nail});

  final Nail nail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.large(
        backgroundColor: Colors.transparent,
        elevation: 0,
        onPressed: () {
          Get.back();
        },
        child: Image.asset(
          "assets/categories/RubberBaseGel.png",
        ),
      ),
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.06,
          ),
          child: Image.asset(
            "assets/EssentialAppBar.png",
            fit: BoxFit.cover,
            height: 120,
          ),
        ),
        flexibleSpace: Image.asset(
          "assets/AppBarBackground.png",
          fit: BoxFit.cover,
        ),
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 75,
              height: 69,
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
              child: Image.asset("assets/PlayButton.png"),
            ),
          ),
          Center(
            heightFactor: 1.1,
            child: NailCard(nail: nail),
          ),
          Container(
            width: 300,
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Color.fromRGBO(126, 126, 126, 0.5),
                  width: 2,
                ),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ref:017",
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: "Gotham",
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(80, 79, 79, 1),
                    ),
                  ),
                  Text(
                    "Soak oof gell polish",
                    style: TextStyle(
                      fontFamily: "Gotham",
                      fontWeight: FontWeight.w400,
                      fontSize: 25,
                      color: Color.fromRGBO(97, 95, 95, 1),
                    ),
                  ),
                  Text(
                    "Time of polymerization in light of the UV lamp-2-3minutes LED-lamp-1 minute",
                    style: TextStyle(
                      fontFamily: "Gotham",
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Color.fromRGBO(126, 126, 126, 1),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
