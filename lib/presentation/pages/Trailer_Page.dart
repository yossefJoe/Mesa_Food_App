import 'package:flutter/material.dart';
import 'package:movie_app/Constants/My_Constants.dart';
import 'package:movie_app/Constants/Show_Loading.dart';
import 'package:movie_app/presentation/Widgets/Get_trailer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../Models/trailer.dart';
import '../../api/api.dart';

class TrailerPage extends StatefulWidget {
  final int? id;
  final String? trailertype;
  final String? movieid;
  const TrailerPage({
    Key? key,
    this.id,
    this.trailertype,
    this.movieid,
  }) : super(key: key);

  @override
  State<TrailerPage> createState() => _TrailerPageState();
}

class _TrailerPageState extends State<TrailerPage> {
  late YoutubePlayerController youtubeplayercontroller;
  Future<List<Trailer>>? trailerslist;
  YoutubePlayer? yp;

  @override
  void initState() {
    if (widget.trailertype == "movies") {
      trailerslist = Api().getmovietrailer(widget.id!);
    } else if (widget.trailertype == "MOVIES") {
      trailerslist = Api().getmovietrailer(widget.id!);
    } else {
      trailerslist = Api().gettvtrailer(widget.id!);
    }
    final videoid = YoutubePlayer.convertUrlToId("${widget.movieid}");
    youtubeplayercontroller = YoutubePlayerController(
      initialVideoId: videoid.toString(),
      flags: YoutubePlayerFlags(
          useHybridComposition: false,
          autoPlay: false,
          mute: false,
          enableCaption: true,
          forceHD: true),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Sizecontroller().init(context);
    return Scaffold(
      body: ListView(
        children: [
          FutureBuilder(
            future: trailerslist,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return YoutubePlayerBuilder(
                  onEnterFullScreen: () {
                    youtubeplayercontroller.flags.enableCaption;
                  },
                  player: YoutubePlayer(controller: youtubeplayercontroller),
                  builder: (context, player) {
                    return Column(
                      children: [
                        Container(
                          height: 400,
                          width: double.infinity,
                          child: YoutubePlayer(
                            bufferIndicator: Center(
                              child: Center(
                                  child: Center(
                                child: Container(
                                  height: 200,
                                  width: 200,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.orange),
                                  ),
                                ),
                              )),
                            ),
                            progressIndicatorColor: youtubeplayercontroller
                                        .value.position ==
                                    youtubeplayercontroller.metadata.duration *
                                        0.1
                                ? Colors.amber
                                : Colors.orange,
                            bottomActions: [
                              CurrentPosition(),
                              ProgressBar(
                                isExpanded: true,
                                colors: ProgressBarColors(
                                    playedColor: youtubeplayercontroller
                                                .value.position ==
                                            youtubeplayercontroller
                                                    .metadata.duration *
                                                0.1
                                        ? Colors.amber
                                        : Colors.orange,
                                    handleColor: Colors.white),
                              ),
                              RemainingDuration(),
                              FullScreenButton(),
                            ],
                            aspectRatio: 16 / 9,
                            showVideoProgressIndicator: true,
                            controlsTimeOut: Duration(milliseconds: 1500),
                            controller: youtubeplayercontroller,
                            thumbnail: Image.network(
                              "https://img.youtube.com/vi/${gettrailerid.checktrailertype(snapshot)}/hqdefault.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.amber,
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
