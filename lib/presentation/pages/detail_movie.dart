import 'package:flutter/material.dart';
import 'package:myapp/data/model/movie_model.dart';
import 'package:myapp/data/service/sistem_db.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailMovie extends StatefulWidget {
  const DetailMovie({super.key, required this.model});
  final MovieModel model;

  @override
  State<DetailMovie> createState() => _DetailMovieState();
}

class _DetailMovieState extends State<DetailMovie> {
  void saveMovie(MovieModel model) async {
    if (SistemDb.checkMovie(model)) {
      SistemDb.removeMovie(model);
    } else {
      SistemDb.addMovie(model);
    }
    setState(() {});
  }

  late YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId:
          YoutubePlayer.convertUrlToId(widget.model.urlYutup ?? 'ini di isi url dummy') ?? 'ini id yt dummy',
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          forceMaterialTransparency: true,
          // backgroundColor: Colors.transparent,
          elevation: 0, leadingWidth: 80,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: const EdgeInsets.only(left: 16, top: 16),
              decoration: BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.circular(14)),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 32,
              ),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                saveMovie(widget.model);
                // Navigator.pop(context);
              },
              child: Container(
                margin: const EdgeInsets.only(right: 16, top: 16),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.circular(14)),
                child: SistemDb.checkMovie(widget.model)
                    ? const Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 32,
                      )
                    : const Icon(
                        Icons.favorite_border,
                        size: 32,
                      ),
              ),
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.only(top: 0),
          children: [
            YoutubePlayer(
              controller: _controller,
            ),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(12),
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: AspectRatio(
                        aspectRatio: 3 / 4,
                        child: Image.network(
                          widget.model.urlImage ??
                              'https://image.tmdb.org/t/p/original/edv5CZvWj09upOsy2Y6IwDhK8bt.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.model.tittle ?? 'UnTitle',
                            style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          const SizedBox(height: 8),
                          Text(widget.model.year ?? 'u2018'),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.grey[300],
                                ),
                                child: Text(
                                  widget.model.genre ?? 'Lucu',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Expanded(child: Container()),
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(16)),
                                child: Text(
                                  widget.model.rating?.toStringAsFixed(1) ??
                                      '0',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(height: 48, thickness: 2, color: Colors.black),
                const Text(
                  'Overview',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(height: 24),
                Text(
                  widget.model.overview ?? 'Null',
                  textAlign: TextAlign.justify,
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
