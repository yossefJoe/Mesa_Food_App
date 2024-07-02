import 'dart:convert';

import '../Constants/My_Constants.dart';
import '../Models/Movie.dart';
import '../Models/TVShow.dart';
import '../Models/trailer.dart';
import 'package:http/http.dart' as http;

class Api {
  static String nowplayingurl =
      "https://api.themoviedb.org/3/trending/movie/day?api_key=${apikey}";
  static String popularurl =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=${apikey}";
  static String nowplayingtvurl =
      "https://api.themoviedb.org/3/trending/tv/day?api_key=${apikey}";
  static String populartvurl =
      "https://api.themoviedb.org/3/tv/top_rated?api_key=${apikey}";

  static String moviescharactersurl =
      "https://api.themoviedb.org/3/movie/1011985/credits?api_key=${apikey}";
  static String tvcharactersurl =
      "https://api.themoviedb.org/3/tv/${TVShow().id}/credits?api_key=${apikey}";

  Future<List<Movie>> getnowmovies() async {
    final response = await http.get(Uri.parse(nowplayingurl));

    if (response.statusCode == 200) {
      final decodedate = json.decode(response.body)['results'] as List;
      return decodedate.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Something Happened");
    }
  }

  Future<List<Movie>> getpopularmovies() async {
    final response = await http.get(Uri.parse(popularurl));

    if (response.statusCode == 200) {
      final decodedate = json.decode(response.body)['results'] as List;
      return decodedate.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Something Happened");
    }
  }

  Future<List<TVShow>> getnowtvshows() async {
    final response = await http.get(Uri.parse(nowplayingtvurl));

    if (response.statusCode == 200) {
      final decodedate = json.decode(response.body)['results'] as List;
      return decodedate.map((movie) => TVShow.fromJson(movie)).toList();
    } else {
      throw Exception("Something Happened");
    }
  }

  Future<List<TVShow>> getpopulartvshows() async {
    final response = await http.get(Uri.parse(populartvurl));

    if (response.statusCode == 200) {
      final decodedate = json.decode(response.body)['results'] as List;
      return decodedate.map((movie) => TVShow.fromJson(movie)).toList();
    } else {
      throw Exception("Something Happened");
    }
  }

  Future<List<Trailer>> getmovietrailer(int movieortvid) async {
    final String trailerurl =
        "https://api.themoviedb.org/3/movie/${movieortvid}/videos?api_key=${apikey}";
    final response = await http.get(Uri.parse(trailerurl));

    if (response.statusCode == 200) {
      final decodedate = json.decode(response.body)['results'] as List;
      return decodedate.map((movie) => Trailer.fromJson(movie)).toList();
    } else {
      throw Exception("Something Happened");
    }
  }

  Future<List<Trailer>> gettvtrailer(int movieortvid) async {
    final String trailerurl =
        "https://api.themoviedb.org/3/tv/${movieortvid}/videos?api_key=${apikey}";
    final response = await http.get(Uri.parse(trailerurl));

    if (response.statusCode == 200) {
      final decodedate = json.decode(response.body)['results'] as List;
      return decodedate.map((movie) => Trailer.fromJson(movie)).toList();
    } else {
      throw Exception("Something Happened");
    }
  }
}
