import 'package:flutter/material.dart';
import 'package:myapp/data/model/movie_poster_model.dart';
import 'package:myapp/data/service/api_service.dart';
import 'package:myapp/presentation/widget/list_poster_movie.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final searchController = TextEditingController();
  final service = ApiService();
  List<MoviePosterModel> list = [];

  void getList(query) async {
    list = await service.search(query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(height: 24),
          TextField(
            controller: searchController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: 'Search Title',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onSubmitted: (value) {
              getList(value);
              setState(() {});
            },
          ),
          const SizedBox(height: 24),
          if (list.isEmpty)
            const Center(
              child: Text('Enter title in the search field'),
            ),
          ListPosterMovie(listMovie: list),
        ],
      ),
    );
  }
}
