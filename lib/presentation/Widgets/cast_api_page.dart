// FutureBuilder(
//   future: creditslist,
//   builder: (context, snapshot) {
//     if (snapshot.hasData) {
//       return ListView.builder(
//           shrinkWrap: true,
//           itemCount: 6,
//           physics: BouncingScrollPhysics(),
//           scrollDirection: Axis.horizontal,
//           itemBuilder: (context, i) {
//             return Column(
//               children: [
//                 Container(
//                   width: 200,
//                   height: 200,
//                   child: Image.network(
//                     "${imagepath}${snapshot!.data![i].profilePath}",
//                     filterQuality: FilterQuality.high,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 Text(
//                   "${snapshot!.data![i].name}",
//                 )
//               ],
//             );
//           });
//     } else if (snapshot.hasError) {
//       return Text(snapshot.error.toString());
//     } else {
//       return CircularProgressIndicator(
//         color: Colors.red,
//       );
//     }
//   },
// )

// Future<List<Credits>>? creditslist;
//
// if (widget.type == "movies") {
//   creditslist = Api().getmoviecast();
// } else if (widget.type == "MOVIES") {
//   creditslist = Api().getmoviecast();
// } else {
//   creditslist = Api().gettvcast();
// }
