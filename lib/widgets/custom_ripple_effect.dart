
import 'package:flutter/material.dart';

class CustomImageRippleEffect extends StatelessWidget {
  const CustomImageRippleEffect({super.key,required this.child, required this.onTap});
  final Widget child;
    final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        child,
        Positioned.fill(
          child: Material(
            shadowColor : Colors.transparent ,
            surfaceTintColor : Colors.transparent ,
            type: MaterialType.circle ,
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.blue.withOpacity(0.5),
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: onTap,
            ),
          ),
        ),
      ],
    );
  }
}
