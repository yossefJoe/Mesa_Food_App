import 'package:flutter/material.dart';

class gettrailerid {
  static String? checktrailertype(AsyncSnapshot? snapshot) {
    for (var i = 0; i < 30; i++) {
      if (snapshot!.data![i].type == "Trailer") {
        return snapshot.data![i].key;
      }
    }
  }
}
