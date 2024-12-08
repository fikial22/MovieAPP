import 'package:flutter/material.dart';
import 'package:myapp/data/model/movie_model.dart';
import 'package:myapp/data/model/movie_poster_model.dart';
import 'package:myapp/data/service/sistem_db.dart';
import 'package:myapp/presentation/widget/list_poster_movie.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<MovieModel> favMovies = SistemDb.getMovie();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorite Movie',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          if (favMovies.isEmpty) ...const [
            SizedBox(
              height: 50,
            ),
            Center(child: Text('No Favorite Movie'))
          ],
          ListPosterMovie(
            listMovie: favMovies
                .map(
                  (e) => MoviePosterModel(
                    id: e.id,
                    urlPoster: e.urlImage,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
