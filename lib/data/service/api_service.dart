import 'package:dio/dio.dart';
import 'package:myapp/data/model/movie_model.dart';
import 'package:myapp/data/model/movie_poster_model.dart';

class ApiService {
  final _service = Dio();

  Future<List<List<MoviePosterModel>>> homePost() async {
    var response = await _service.get(
      'https://movies-api14.p.rapidapi.com/home',
      options: Options(
        headers: {
          'X-RapidAPI-Key':
              '567588ca07msha1174955d614f28p1f554ejsn166c3c2f8df5',
          'X-RapidAPI-Host': 'movies-api14.p.rapidapi.com',
        },
      ),
    );

    List<List<MoviePosterModel>> result = [];

    var bigList = response.data as List;
    bigList.forEach((element) {
      var temp = element['movies'] as List;
      List<MoviePosterModel> movies = [];
      temp.forEach((element) {
        movies.add(MoviePosterModel(
            id: element['_id'], urlPoster: element['poster_path']));
      });
      result.add(movies);
    });

    return result;
  }

  Future<List<MoviePosterModel>> search(String query) async {
    var response = await _service.get(
      'https://movies-api14.p.rapidapi.com/search',
      queryParameters: {'query': query},
      options: Options(
        headers: {
          'X-RapidAPI-Key':
              '567588ca07msha1174955d614f28p1f554ejsn166c3c2f8df5',
          'X-RapidAPI-Host': 'movies-api14.p.rapidapi.com',
        },
      ),
    );
    var data = response.data['contents'] as List;
    return data
        .map(
          (e) => MoviePosterModel(
            id: e['_id'],
            urlPoster: e['poster_path'],
          ),
        )
        .toList();
  }

  Future<MovieModel> getDetail(int id) async {
    var response = await _service.get(
      'https://movies-api14.p.rapidapi.com/movie/$id',
      options: Options(
        headers: {
          'X-RapidAPI-Key':
              '567588ca07msha1174955d614f28p1f554ejsn166c3c2f8df5',
          'X-RapidAPI-Host': 'movies-api14.p.rapidapi.com',
        },
      ),
    );
    var data = response.data['movie'];
    return MovieModel(
        id: data['_id'],
        tittle: data['title'],
        year: data['release_date'],
        genre: data['genres'][0],
        rating: data['vote_average'],
        urlImage: data['poster_path'],
        urlYutup: data['youtube_trailer'],
        overview: data['overview']);
  }
}