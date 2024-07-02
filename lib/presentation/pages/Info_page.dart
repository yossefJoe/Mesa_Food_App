import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../Constants/My_Constants.dart';
import '../../Constants/Widgets/Custom_Material_Buttons.dart';
import '../../Constants/Widgets/Custom_bottom_Navigate.dart';
import '../Widgets/custom_pageview.dart';

class AppInfo extends StatefulWidget {
  const AppInfo({Key? key}) : super(key: key);

  @override
  State<AppInfo> createState() => _AppInfoState();
}

class _AppInfoState extends State<AppInfo> {
  PageController? pageController;
  int? dotindex;

  bool checkpage() {
    if (pageController!.hasClients) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    pageController = new PageController(initialPage: 0)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Sizecontroller().init(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: checkpage()
                ? pageController!.page != 1
                    ? mygradient2
                    : mygradient1
                : mygradient2),
        child: Stack(children: [
          CustomInfoPageView(
            pageController: pageController,
          ),
          Positioned(
              bottom: Sizecontroller.defaultsize! * 15,
              left: Sizecontroller.defaultsize! * 15,
              right: Sizecontroller.defaultsize! * 15,
              child: DotsIndicator(
                onTap: (position) {
                  pageController!.jumpToPage(position);
                },
                position: checkpage() ? pageController!.page!.toInt() : 0,
                dotsCount: 3,
                decorator: DotsDecorator(
                    color: Colors.grey, activeColor: Colors.white),
              )),
          Positioned(
            left: Sizecontroller.defaultsize! * 10,
            right: Sizecontroller.defaultsize! * 10,
            child: CustomMaterialInfoButton(
                text: checkpage()
                    ? pageController?.page == 2
                        ? "Get Started"
                        : "Next"
                    : "Next",
                color: Colors.transparent,
                tap: () {
                  if (pageController!.page! < 2) {
                    pageController!.nextPage(
                        duration: Duration(seconds: 1), curve: Curves.easeIn);
                  } else {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => MovieAppBottomNavigator(),
                    ));
                  }
                }),
            bottom: Sizecontroller.defaultsize! * 8,
          )
        ]),
      ),
    );
  }
}
