import 'package:flutter/material.dart';

import '../My_Constants.dart';

class CustomMaterialInfoButton extends StatelessWidget {
  final VoidCallback? tap;
  final String? text;
  final Color? color;
  final PageController? pageController;
  final LinearGradient? gradient;
  const CustomMaterialInfoButton(
      {Key? key,
      this.tap,
      required this.text,
      this.color,
      this.pageController,
      this.gradient})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Sizecontroller().init(context);
    return GestureDetector(
      onTap: tap,
      child: Container(
        height: Sizecontroller.pageheight! * 0.075,
        width: Sizecontroller.pagewidth! * 0.5,
        decoration: BoxDecoration(
            gradient: gradient,
            color: color,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white, width: 2)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text!,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 2,
            ),
            Icon(
              Icons.arrow_forward_outlined,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
