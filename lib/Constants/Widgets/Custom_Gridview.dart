import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../presentation/Widgets/Navigation_Method.dart';
import '../My_Constants.dart';

class CustomListBuilder extends StatelessWidget {
  final AsyncSnapshot? snapshot;

  const CustomListBuilder({
    Key? key,
    this.snapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List datelist = [];
    List fractions = [];
    List ratenumber = [];
    for (var i = 0; i <= 10; i++) {
      DateTime dateTime = DateTime.parse(snapshot!.data[i].releaseDate);
      datelist.add(dateTime.year.toString());
      fractions.add(snapshot!.data[i].voteAverage
          .toString()
          .split('.')[1]
          .substring(0, 1));
      ratenumber.add(snapshot!.data[i].voteAverage.toString().substring(0, 1));
    }
    return Container(
      height: 300,
      width: double.infinity,
      child: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, i) {
            return Stack(
              children: [
                Consumer<PageNavigate>(
                  builder: (context, value, child) {
                    return GestureDetector(
                      onTap: () {
                        value.gettopage(context, snapshot!, i, "movies",
                            "movies", "MOVIES");
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        width: 150,
                        height: 250,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            "${imagepath}${snapshot!.data[i].posterPath}",
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Positioned(
                  child: Center(
                    child: RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                  style: TextStyle(fontSize: 15),
                                  text: "${datelist[i]}\n"),
                              TextSpan(
                                  style: TextStyle(fontSize: 10),
                                  text: "${snapshot!.data[i].title}"),
                            ])),
                  ),
                  bottom: 40,
                  left: 20,
                ),
                Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          gradient: mygradient4,
                          borderRadius: BorderRadius.circular(40)),
                      child: Center(
                          child: Text("${ratenumber[i]}.${fractions[i]}")),
                    ))
              ],
            );
          }),
    );
  }
}
