import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../presentation/Widgets/Navigation_Method.dart';
import '../My_Constants.dart';

class CustomTVListView extends StatelessWidget {
  final AsyncSnapshot? snapshot;
  const CustomTVListView({Key? key, this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List datelist = [];
    List fractions = [];
    List ratenumber = [];
    for (var i = 0; i <= 10; i++) {
      DateTime dateTime = DateTime.parse(snapshot!.data[i].firstAirDate);
      datelist.add(dateTime.year.toString());
      fractions.add(snapshot!.data[i].voteAverage
          .toString()
          .split('.')[1]
          .substring(0, 1));
      ratenumber.add(snapshot!.data[i].voteAverage.toString().substring(0, 1));
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, i) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Consumer<PageNavigate>(
                builder: (context, value, child) {
                  return GestureDetector(
                    onTap: () {
                      value.gettopage(context, snapshot!, i, "", "", "");
                    },
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                "${imagepath}${snapshot!.data[i].posterPath}",
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text("${snapshot!.data[i].name} (${datelist[i]})")
                        ],
                      ),
                    )),
                  );
                },
              ),
              Positioned(
                  top: 30,
                  right: 30,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        gradient: mygradient4,
                        borderRadius: BorderRadius.circular(40)),
                    child:
                        Center(child: Text("${ratenumber[i]}.${fractions[i]}")),
                  ))
            ],
          ),
        );
      },
      itemCount: 4,
    );
  }
}
