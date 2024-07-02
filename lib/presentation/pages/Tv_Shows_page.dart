import 'package:flutter/material.dart';
import 'package:movie_app/Constants/My_Constants.dart';

import '../../Constants/Widgets/Custom_Appbar.dart';
import '../../Constants/Widgets/Custom_Slider.dart';
import '../../Constants/Widgets/Custom_TvList_View.dart';
import '../../Models/Movie.dart';
import '../../Models/TVShow.dart';
import '../../api/api.dart';
import 'More_List_Page.dart';

class TvShowsPage extends StatefulWidget {
  const TvShowsPage({Key? key}) : super(key: key);

  @override
  State<TvShowsPage> createState() => _TvShowsPageState();
}

class _TvShowsPageState extends State<TvShowsPage> {
  late Future<List<TVShow>> getnowtvshows;
  late Future<List<TVShow>> getpopulartvshows;

  @override
  void initState() {
    getnowtvshows = Api().getnowtvshows();
    getpopulartvshows = Api().getpopulartvshows();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Sizecontroller().init(context);
    return Scaffold(
        appBar: CustomAppbar("TV", context, getnowtvshows),
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
                                    listtype: "tvnow",
                                    texttype: "TV",
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
                future: getnowtvshows,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return CustomSlider(
                      type: "TV",
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
                                    listtype: "populartvshows",
                                    texttype: "TV",
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
                future: getpopulartvshows,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return CustomTVListView(
                      snapshot: snapshot,
                    );
                  } else {
                    return CircularProgressIndicator(
                      color: Colors.amber,
                    );
                  }
                },
              ),
            ],
          )),
        ));
  }
}
