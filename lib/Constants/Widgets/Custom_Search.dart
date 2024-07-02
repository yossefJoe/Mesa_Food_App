import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../presentation/Widgets/Navigation_Method.dart';
import '../My_Constants.dart';

class DataSearch extends SearchDelegate {
  @override
  final String? hintText;
  final String? type;
  final Future<List<dynamic>>? list;

  DataSearch({this.type, this.list, this.hintText});

  @override
  String? get searchFieldLabel => hintText;

  List<Widget>? buildActions(BuildContext context) {
    return [
      TextButton(
          onPressed: () {
            query = "";
          },
          child: Text(
            "Clear",
            style: TextStyle(color: Colors.blue),
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("data");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    Future<List<dynamic>> resultlist = type == "MOVIES"
        ? list!.then((value) => value
            .where((element) =>
                element.title!.toLowerCase().startsWith(query.toLowerCase()))
            .toList())
        : list!.then((value) => value
            .where((element) =>
                element.name!.toLowerCase().startsWith(query.toLowerCase()))
            .toList());

    return FutureBuilder(
      future: query == "" ? list : resultlist,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, i) {
                return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Consumer<PageNavigate>(
                      builder: (context, value, child) {
                        return GestureDetector(
                          onTap: () {
                            value.gettopage(
                                context, snapshot, i, type!, type, type);
                          },
                          child: Container(
                            height: 200,
                            width: double.infinity,
                            child: Card(
                              child: Row(children: [
                                Expanded(
                                  flex: 2,
                                  child: Image.network(
                                    "${imagepath}${snapshot!.data![i].posterPath}",
                                    fit: BoxFit.fill,
                                    height: 200,
                                    filterQuality: FilterQuality.high,
                                  ),
                                ),
                                Expanded(
                                    flex: 3,
                                    child: ListTile(
                                      title: SizedBox(
                                        width: 200,
                                        child: Text(
                                          type == "MOVIES"
                                              ? "${snapshot!.data![i].title}"
                                              : "${snapshot!.data![i].name}",
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                        ),
                                      ),
                                      subtitle: SizedBox(
                                        width: 200,
                                        child: Text(
                                          "${snapshot!.data![i].overview}"
                                                  .substring(0, 50) +
                                              "...",
                                          maxLines: 4,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    )),
                              ]),
                            ),
                          ),
                        );
                      },
                    ));
              });
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return CircularProgressIndicator(color: Colors.red);
        }
      },
    );
  }
}
