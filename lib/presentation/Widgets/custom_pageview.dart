import 'package:flutter/material.dart';

import '../../Constants/My_Constants.dart';

class CustomInfoPageView extends StatelessWidget {
  const CustomInfoPageView({Key? key, this.pageController}) : super(key: key);
  final PageController? pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        CustomInfoPageViewItem(
            image: "assets/images/trumanshow.jpg",
            title: "Get Latest Movies Information"),
        CustomInfoPageViewItem(
            image: "assets/images/breakingbad.jpg",
            title: "Get Latest Tv Shows Information"),
        CustomInfoPageViewItem(
            image: "assets/images/networks.jpg",
            title: "Real Time updates for Trailers")
      ],
    );
  }
}

class CustomInfoPageViewItem extends StatelessWidget {
  final String? image;
  final String? title;
  const CustomInfoPageViewItem({Key? key, this.image, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Sizecontroller().init(context);
    return Column(
      children: [
        Container(
          height: Sizecontroller.pageheight! * 0.6,
          width: double.infinity,
          child: Image.asset(
            image!,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          height: Sizecontroller.pageheight! * 0.025,
        ),
        Text(title!,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
            )),
      ],
    );
  }
}
