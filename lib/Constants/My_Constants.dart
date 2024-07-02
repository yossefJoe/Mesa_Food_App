import 'package:flutter/material.dart';

LinearGradient mygradient1 =
    LinearGradient(colors: [Colors.blueAccent, Colors.greenAccent]);
LinearGradient mygradient2 =
    LinearGradient(colors: [Colors.yellow, Colors.orange]);
LinearGradient mygradient3 =
    LinearGradient(colors: [Colors.red, Colors.orange]);
LinearGradient mygradient4 = LinearGradient(
    transform: GradientRotation(3.14 / 4),
    colors: [Colors.orange, Colors.pink]);

class Sizecontroller {
  static double? pageheight;
  static double? pagewidth;
  static Orientation? oreientation;
  static double? defaultsize;

  void init(BuildContext context) {
    pageheight = MediaQuery.of(context).size.height;
    pagewidth = MediaQuery.of(context).size.width;
    oreientation = MediaQuery.of(context).orientation;
    defaultsize = oreientation == Orientation.landscape
        ? pageheight! * 0.024
        : pagewidth! * 0.024;
  }
}

String apikey = "320f60e2156fa32fd81baccd3c8d27f8";
String apikey_2 =
    "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzMjBmNjBlMjE1NmZhMzJmZDgxYmFjY2QzYzhkMjdmOCIsInN1YiI6IjY1ZWE4N2VjN2Y0ZjIxMDE2MmRiNTBlZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.-D7UzPCRmpaWDaajLU6f1jhX284q9oYqO7w6s6aQgN8";
String imagepath = "https://image.tmdb.org/t/p/w500";
