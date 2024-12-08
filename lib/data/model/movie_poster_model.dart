class MoviePosterModel {
  final num? id;
  final String? urlPoster;

  MoviePosterModel({required this.id, required this.urlPoster});

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'poster_path': urlPoster,
    };
  }
}