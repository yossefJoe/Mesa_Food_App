import 'package:flutter/material.dart';

import 'Custom_Search.dart';

class CustomAppbar extends AppBar {
  final String? text;
  final Future<List<dynamic>> list;
  final BuildContext context;
  CustomAppbar(this.text, this.context, this.list)
      : super(
          title: Padding(
            padding: EdgeInsets.only(
                right: text == "MOVIES"
                    ? MediaQuery.of(context).size.width * 0.55
                    : MediaQuery.of(context).size.width * 0.7),
            child: Text(
              text!,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                  onPressed: () {
                    showSearch(
                        context: context,
                        delegate: DataSearch(
                            type: text,
                            list: list,
                            hintText: text == "MOVIES"
                                ? "Movie Search"
                                : "TV Search"));
                  },
                  icon: Icon(
                    Icons.search,
                    size: 30,
                  )),
            )
          ],
          centerTitle: true,

          // flexibleSpace: FlexibleSpaceBar(
          //   background: Container(
          //     decoration: BoxDecoration(gradient: mygradient1),
          //   ),
          // ),
        );
}

class CustomProfileAppBar extends AppBar {
  final String? text;

  CustomProfileAppBar(this.text)
      : super(
          title: Padding(
            padding: const EdgeInsets.only(right: 200),
            child: Text(
              text!,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.settings,
                    size: 20,
                  )),
            )
          ],
          centerTitle: true,
        );
}
