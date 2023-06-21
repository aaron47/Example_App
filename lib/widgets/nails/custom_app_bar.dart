import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: false,
      actions: [
        Container(
          margin: EdgeInsets.only(
            right: MediaQuery.of(context).size.height * 0.02,
          ),
          child: Icon(
            Icons.menu,
            color: Colors.white,
            size: MediaQuery.of(context).size.height * 0.03,
          ),
        ),
      ],
      title: Container(
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.03,
        ),
        child: Image.asset(
          "assets/EssentialAppBar.png",
          fit: BoxFit.cover,
          height: 100,
        ),
      ),
      flexibleSpace: Image.asset(
        "assets/AppBarBackground.png",
        fit: BoxFit.cover,
        height: double.infinity,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
