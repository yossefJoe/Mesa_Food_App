import 'package:flutter/material.dart';
import 'package:movie_app/Constants/My_Constants.dart';

import '../../Constants/Widgets/Custom_Appbar.dart';
import '../../Constants/Widgets/Custom_Gridview.dart';
import '../../Constants/Widgets/Custom_Slider.dart';
import '../../Models/Movie.dart';
import '../../api/api.dart';
import 'More_List_Page.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  late Future<List<Movie>> getnowmovies;
  late Future<List<Movie>> getpopularmovies;

  @override
  void initState() {
    getnowmovies = Api().getnowmovies();
    getpopularmovies = Api().getpopularmovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Sizecontroller().init(context);
    return Scaffold(
        appBar: CustomAppbar("MOVIES", context, getnowmovies),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
              child: Column(
            children: [
              Container(
                child: Center(
                  child: Image.asset(
                    "assets/images/Movie_logo.png",
                    color: Colors.white,
                    height: Sizecontroller.pageheight! * 0.175,
                  ),
                ),
                width: double.infinity,
                height: Sizecontroller.pageheight! * 0.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: mygradient4),
              ),
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Now",
                        style: TextStyle(fontSize: 20),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MoreListPage(
                                    listtype: "moviesnow",
                                    texttype: "movies",
                                  ),
                                ));
                          },
                          child: Text(
                            "MORE",
                            style: TextStyle(color: Colors.black),
                          ))
                    ],
                  )),
              FutureBuilder(
                future: getnowmovies,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return CustomSlider(
                      type: "movies",
                      snapshot: snapshot,
                    );
                  } else {
                    return CircularProgressIndicator(
                      color: Colors.amber,
                    );
                  }
                },
              ),
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Popular",
                        style: TextStyle(fontSize: 20),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MoreListPage(
                                    listtype: "popularmovies",
                                    texttype: "movies",
                                  ),
                                ));
                          },
                          child: Text(
                            "MORE",
                            style: TextStyle(color: Colors.black),
                          ))
                    ],
                  )),
              FutureBuilder(
                future: getpopularmovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return CustomListBuilder(
                      snapshot: snapshot,
                    );
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else {
                    return CircularProgressIndicator(
                      color: Colors.amber,
                    );
                  }
                },
              )
            ],
          )),
        ));
  }
}
