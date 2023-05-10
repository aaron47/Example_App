import 'package:essential_beauty/widgets/custom_ripple_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Category extends StatelessWidget {
  const Category({super.key, required this.imgPath, required this.categoryName, required this.onChangeScreen});

  final String imgPath;
  final String categoryName;
  final void Function() onChangeScreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
      child: Column(
        children: [
          CustomImageRippleEffect(
            onTap: onChangeScreen,
            child: Image.asset(
              imgPath,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            categoryName,
            style: TextStyle(
              fontSize: 32.sp,
              fontFamily: "IBMPlexMono",
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
