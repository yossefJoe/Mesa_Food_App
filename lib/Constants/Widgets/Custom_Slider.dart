import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../presentation/Widgets/Navigation_Method.dart';
import '../../presentation/pages/About_Movie_or_TV_Page.dart';
import '../My_Constants.dart';

class CustomSlider extends StatelessWidget {
  final AsyncSnapshot? snapshot;
  final String? type;
  const CustomSlider({Key? key, this.snapshot, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Sizecontroller().init(context);
    return Container(
        height: Sizecontroller.pageheight! * 0.5,
        width: double.infinity,
        child: CarouselSlider.builder(
            itemCount: 10,
            itemBuilder: (context, itemindex, pageviewindex) {
              return FittedBox(
                child: Column(
                  children: [
                    Consumer<PageNavigate>(
                      builder: (context, value, child) {
                        return GestureDetector(
                          onTap: () {
                            value.gettopage(context, snapshot!, itemindex,
                                type!, type, type);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              height: Sizecontroller.pageheight! * 0.4,
                              width: Sizecontroller.pagewidth! * 0.5,
                              child: Image.network(
                                "${imagepath}${snapshot!.data[itemindex].posterPath}",
                                fit: BoxFit.fitHeight,
                                filterQuality: FilterQuality.high,
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
                      width: 200,
                      child: Text(
                        type == "movies"
                            ? "${snapshot!.data[itemindex].title}"
                            : "${snapshot!.data[itemindex].name}",
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                  ],
                ),
              );
            },
            options: CarouselOptions(
                autoPlay: true,
                viewportFraction: 0.5,
                enlargeCenterPage: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlayAnimationDuration: Duration(seconds: 1),
                height: Sizecontroller.pageheight! * 0.4)));
  }
}
