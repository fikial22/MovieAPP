import 'package:flutter/material.dart';
import 'package:myapp/data/model/movie_poster_model.dart';
import 'package:myapp/data/service/api_service.dart';
import 'package:myapp/presentation/pages/detail_movie.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ListPosterMovie extends StatelessWidget {
  ListPosterMovie({
    super.key,
    required this.listMovie,
  });

  final List<MoviePosterModel> listMovie;
  final _service = ApiService();

  void getDetail(context, id) async {
    var data = await _service.getDetail(id);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailMovie(model: data),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: listMovie.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 4,
          mainAxisSpacing: 24,
          crossAxisSpacing: 24),
      itemBuilder: (context, index) {
        return InkWell(
            onTap: () => getDetail(context, listMovie[index].id),
            child: CachedNetworkImage(
              imageUrl: listMovie[index].urlPoster!,
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, progress) {
                return Center(
                  child: CircularProgressIndicator(
                    value: progress.progress,
                  ),
                );
              },
            ));
      },
    );
  }
}
