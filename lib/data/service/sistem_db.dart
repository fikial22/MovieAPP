import 'package:myapp/data/model/movie_model.dart';

class SistemDb {
  static List<MovieModel> listMov = [];

  static void addMovie(MovieModel movie) {
    listMov.add(movie);
  }

  static void removeMovie(MovieModel movie) {
    MovieModel target = listMov.firstWhere(
      (element) => element.tittle!.compareTo(movie.tittle ?? '') == 0,
    );
    listMov.remove(target);
  }

  static List<MovieModel> getMovie() {
    return listMov;
  }

  static bool checkMovie(MovieModel movie) {
    for (var element in listMov) {
      if (element.tittle!.compareTo(movie.tittle ?? '') == 0) {
        return true;
      }
    }
    return false;
  }
}
