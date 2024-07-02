import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

import '../../Constants/My_Constants.dart';
import 'Info_page.dart';

class MovieHome extends StatefulWidget {
  MovieHome({Key? key}) : super(key: key);

  @override
  State<MovieHome> createState() => _MovieHomeState();
}

class _MovieHomeState extends State<MovieHome>
    with SingleTickerProviderStateMixin {
  AnimationController? animationcontroller;
  Animation<double>? fadeanimation;

  @override
  void initState() {
    animationcontroller =
        new AnimationController(vsync: this, duration: Duration(seconds: 5));
    fadeanimation =
        Tween<double>(begin: .2, end: 1).animate(animationcontroller!);
    animationcontroller?.forward();

    animationcontroller!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Navigate to the second screen after the animation completes
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AppInfo()),
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    animationcontroller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: mygradient1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
                opacity: fadeanimation!,
                child: Image.asset("assets/images/Movie_logo.png")),
          ],
        ),
      ),
    );
  }
}
