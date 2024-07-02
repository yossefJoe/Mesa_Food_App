import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Constants/My_Constants.dart';
import '../../Models/Movie.dart';
import '../../Models/TVShow.dart';
import '../../api/api.dart';
import '../Widgets/Navigation_Method.dart';
import 'About_Movie_or_TV_Page.dart';

class MoreListPage extends StatefulWidget {
  final String? listtype;
  final String? texttype;
  final String? label;
  const MoreListPage({
    Key? key,
    this.listtype,
    this.texttype,
    this.label,
  }) : super(key: key);

  @override
  State<MoreListPage> createState() => _MoreListPageState();
}

class _MoreListPageState extends State<MoreListPage> {
  late Future<List<dynamic>> morelist;

  @override
  void initState() {
    if (widget.listtype == "moviesnow") {
      morelist = Api().getnowmovies();
    } else if (widget.listtype == "popularmovies") {
      morelist = Api().getpopularmovies();
    } else if (widget.listtype == "tvnow") {
      morelist = Api().getnowtvshows();
    } else {
      morelist = Api().getpopulartvshows();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Sizecontroller().init(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Back"),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Now List",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 20,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (context, i) {
                            return FittedBox(
                              fit: BoxFit.fill,
                              child: Column(
                                children: [
                                  Consumer<PageNavigate>(
                                    builder: (context, value, child) {
                                      return GestureDetector(
                                        onTap: () {
                                          value.gettopage(
                                              context,
                                              snapshot,
                                              i,
                                              widget.texttype!,
                                              widget.texttype!,
                                              widget.texttype);
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Container(
                                            margin: EdgeInsets.all(5),
                                            height: Sizecontroller.pageheight! *
                                                0.4,
                                            width: Sizecontroller.pagewidth! *
                                                0.45,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: Image.network(
                                                "${imagepath}${snapshot!.data![i].posterPath}",
                                                fit: BoxFit.fill,
                                                filterQuality:
                                                    FilterQuality.high,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Center(
                                      child: SizedBox(
                                    width: Sizecontroller.pagewidth! * 0.5,
                                    child: Text(
                                      widget.texttype == "movies"
                                          ? "${snapshot!.data![i].title}"
                                          : "${snapshot!.data![i].name}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 20),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )),
                                  SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                            );
                          }),
                    )
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              } else {
                return CircularProgressIndicator(
                  color: Colors.orange,
                );
              }
            },
            future: morelist));
  }
}
