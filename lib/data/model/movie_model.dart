class MovieModel {
  final num? id;
  final String? tittle;
  final String? year;
  final String? genre;
  final num? rating;
  final String? urlImage;
  final String? urlYutup;
  final String? overview;

  MovieModel({
    required this.id,
    required this.tittle,
    required this.year,
    required this.genre,
    required this.rating,
    required this.urlImage,
    required this.urlYutup,
    required this.overview,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    var vote = json['vote_average'];
    return MovieModel(
        id: json['_id'],
        tittle: json['title'],
        year: json['release_date'],
        genre: json['genres'][0],
        rating: vote.runtimeType == double ? vote : vote + 0.001,
        urlImage: json['poster_path'],
        urlYutup: json['youtube_trailer'],
        overview: json['overview']);
  }

   
}