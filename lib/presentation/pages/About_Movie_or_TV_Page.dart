import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/Constants/My_Constants.dart';
import 'package:movie_app/presentation/Widgets/Get_trailer.dart';

import '../../Constants/Widgets/Custom_Sliver_Appbar.dart';
import '../../Models/trailer.dart';
import '../../api/api.dart';

class AboutMovieorTVPage extends StatefulWidget {
  final String? title;
  final String? overview;
  final String? type;
  final String? votecount;
  final String? image;
  final String? posterimage;
  final int? id;
  final String? trailertype;

  const AboutMovieorTVPage({
    Key? key,
    this.title,
    this.overview,
    this.type,
    this.votecount,
    this.image,
    this.posterimage,
    this.id,
    this.trailertype,
  }) : super(key: key);

  @override
  State<AboutMovieorTVPage> createState() => _AboutMovieorTVPageState();
}

class _AboutMovieorTVPageState extends State<AboutMovieorTVPage> {
  Future<List<Trailer>>? trailerslist;

  @override
  void initState() {
    if (widget.trailertype == "movies") {
      trailerslist = Api().getmovietrailer(widget.id!);
    } else if (widget.trailertype == "MOVIES") {
      trailerslist = Api().getmovietrailer(widget.id!);
    } else {
      trailerslist = Api().gettvtrailer(widget.id!);
    }
  }

  @override
  Widget build(BuildContext context) {
    Sizecontroller().init(context);
    return Scaffold(
        backgroundColor: Colors.grey,
        body: FutureBuilder(
          future: trailerslist,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: [
                  SilverApp(
                    movieid: gettrailerid.checktrailertype(snapshot),
                    image: widget.image,
                    title: widget.title,
                    id: widget.id,
                    trailertype: widget.trailertype,
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              textAlign: TextAlign.center,
                              widget.overview!,
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontFamily: "roboto",
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            height: 200,
                          ),
                          Text("Movie id :" + widget.id.toString())
                        ],
                      ),
                    ),
                  )
                ],
              );
            } else {
              return CircularProgressIndicator(
                color: Colors.amber,
              );
            }
          },
        ));
  }
}

// Positioned(
//     top: 150,
//     left: 180,
//     child: ),
// Positioned(
//     right: 10,
//     top: 230,
//     child: Text(
//       title!,
//       style: TextStyle(
//           fontSize: 25,
//           fontWeight: FontWeight.bold,
//           color: Colors.white),
//     )),
// Positioned(
//     left: 10,
//     top: 200,
//     child: Container(
//       height: 150,
//       width: 120,
//       child: ClipRRect(
//           borderRadius: BorderRadius.circular(10),
//           child: Image.network(
//             posterimage!,
//             filterQuality: FilterQuality.high,
//             fit: BoxFit.cover,
//           )),
//     ))
