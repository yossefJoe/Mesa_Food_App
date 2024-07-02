import 'package:flutter/material.dart';
import 'package:movie_app/Constants/My_Constants.dart';

showloading(context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("PLease Wait"),
          content: Container(
              height: 50,
              child: Center(
                  child: CircularProgressIndicator(
                color: Colors.amber,
              ))),
        );
      });
}
