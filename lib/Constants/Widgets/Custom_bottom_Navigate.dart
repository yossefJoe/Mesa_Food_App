import 'package:flutter/material.dart';

import '../../presentation/pages/Movies_page.dart';
import '../../presentation/pages/Tv_Shows_page.dart';
import '../../presentation/pages/User_Profile.dart';

class MovieAppBottomNavigator extends StatefulWidget {
  const MovieAppBottomNavigator({Key? key}) : super(key: key);

  @override
  State<MovieAppBottomNavigator> createState() =>
      _MovieAppBottomNavigatorState();
}

class _MovieAppBottomNavigatorState extends State<MovieAppBottomNavigator> {
  List<Widget> apppages = [MoviesPage(), TvShowsPage(), UserProfile()];
  int index = 0;
  int? indexvalue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.red,
          onTap: (indexvalue) {
            setState(() {
              index = indexvalue;
            });
          },
          currentIndex: index,
          items: [
            BottomNavigationBarItem(
                label: "MOVIES",
                icon: new Image.asset(
                  "assets/images/Movie_logo.png",
                  color: index == 0 ? Colors.red : Colors.grey,
                  // indexvalue == 0 ? Colors.red : Colors.grey,
                  fit: BoxFit.cover,
                  height: 60,
                  filterQuality: FilterQuality.high,
                )),
            BottomNavigationBarItem(
                label: "TV",
                icon: Icon(
                  Icons.tv_outlined,
                  size: 40,
                )),
            BottomNavigationBarItem(
                label: "PROFILE",
                icon: Icon(Icons.person_2_outlined, size: 40)),
          ]),
      body: apppages.elementAt(index),
    );
  }
}
