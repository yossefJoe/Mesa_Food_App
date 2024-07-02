import 'package:flutter/material.dart';

import '../../Constants/My_Constants.dart';
import '../pages/About_Movie_or_TV_Page.dart';

class PageNavigate with ChangeNotifier {
  bool checktitle(String? texttype) {
    if (texttype == "movies") {
      return true;
    } else if (texttype == "MOVIES") {
      return true;
    } else {
      return false;
    }
  }

  void gettopage(BuildContext context, AsyncSnapshot snapshot, int i,
      String? trailertype, String? texttype, String? type) {
    Navigator.of(context!).push(MaterialPageRoute(
        builder: (context) => AboutMovieorTVPage(
              type: texttype,
              trailertype: trailertype,
              id: snapshot.data[i].id,
              posterimage: "${imagepath}${snapshot.data![i].posterPath}",
              image: "${imagepath}${snapshot.data![i].backdropPath}",
              votecount: "${snapshot.data![i].voteCount}",
              title: checktitle(texttype)
                  ? "${snapshot.data![i].title}"
                  : "${snapshot.data![i].name}",
              overview: "${snapshot.data![i].overview}",
            )));
    notifyListeners();
  }
}
