import 'package:flutter/material.dart';
import 'package:movie_app/presentation/pages/Trailer_Page.dart';

import '../../Models/trailer.dart';
import '../../api/api.dart';
import '../My_Constants.dart';

class SilverApp extends StatefulWidget {
  final String? image;
  final String? title;
  final String? trailertype;
  final int? id;
  final String? movieid;
  const SilverApp({
    Key? key,
    this.image,
    this.title,
    this.id,
    this.trailertype,
    this.movieid,
  }) : super(key: key);

  @override
  State<SilverApp> createState() => _SilverAppState();
}

class _SilverAppState extends State<SilverApp> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar.large(
      foregroundColor: Colors.grey,
      actions: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.ios_share_outlined,
                color: Colors.white,
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return TrailerPage(
                    movieid: widget.movieid,
                    trailertype: widget.trailertype,
                    id: widget.id,
                  );
                },
              ));
            },
            child: CircleAvatar(
              radius: 20,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                ),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, gradient: mygradient4),
              ),
            ),
          ),
        ),
      ],
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          )),
      expandedHeight: 300,
      backgroundColor: Colors.transparent,
      pinned: true,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        title: Text(
          widget.title!,
          style: TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600),
        ),
        background: Image.network(
          widget.image!,
          filterQuality: FilterQuality.high,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
