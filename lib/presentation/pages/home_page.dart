import 'package:flutter/material.dart';
import 'package:myapp/data/service/api_service.dart';
import 'package:myapp/presentation/widget/list_poster_movie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currIndex = 0;
  final _service = ApiService();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: currIndex,
      length: 10,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            const SizedBox(height: 24),
            const Text('Hi, Fiki!', style: TextStyle(fontSize: 18)),
            const Text(
              'Watch your favorite movies here',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              labelColor: Colors.black,
              labelStyle: const TextStyle(fontSize: 18),
              labelPadding: const EdgeInsets.all(16),
              indicatorColor: Colors.black,
              onTap: (value) {
                setState(() {
                  currIndex = value;
                });
              },
              tabs: const [
                Text('Trending Movies'),
                Text('New Movies'),
                Text('Best Animation Movies'),
                Text('Movies you can watch for Free'),
                Text('Famility Time'),
                Text('Most Trending Shows'),
                Text('New Shows'),
                Text('Get a shot of adrenaline'),
                Text('Sci-Fi TV'),
                Text('Docuseries'),
              ],
            ),
            const SizedBox(height: 24),
            FutureBuilder(
              future: _service.homePost(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListPosterMovie(
                    listMovie: snapshot.data![currIndex],
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
