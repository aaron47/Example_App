import 'package:essential_beauty/shared/tablet_detector.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
      final isTablet = TabletDetector.isTablet(
      MediaQueryData.fromWindow(WidgetsBinding.instance.window));
      final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/SplashScreenBackground.png"),
            fit: BoxFit.cover,
          ),
        ),
        child:  Align(
          alignment: FractionalOffset.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10,),
                         Container(
              // margin: const EdgeInsets.only(left: 40),
              child: Image.asset(
                "assets/SplashScreenTitleLarge.png",
                fit: BoxFit.cover,
                width: !isTablet ? screenWidth * 0.7 : null,
              ),
            ),
              Padding(
                padding: EdgeInsets.all(30),
                child: Text(
                  "MADE WITH LOVE BY SLOTH-LAB",
                  style: TextStyle(
                    fontSize: isTablet ? 20:10,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(249, 249, 249, 1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
