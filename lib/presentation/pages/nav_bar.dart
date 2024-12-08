import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:myapp/presentation/pages/explore_page.dart';
import 'package:myapp/presentation/pages/favorite_page.dart';
import 'package:myapp/presentation/pages/home_page.dart';
import 'package:myapp/presentation/pages/profile_page.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int currIndex = 0;
  List<Widget> pages =const [
    HomePage(),
    ExplorePage(),
    FavoritePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          index: currIndex,
          backgroundColor: Colors.blueGrey[200]!,
          buttonBackgroundColor: Colors.blueGrey,
          height: 60,
          items: const [
            Icon(Icons.home_outlined, size: 30),
            Icon(Icons.search, size: 30),
            Icon(Icons.bookmark_outline, size: 30),
            Icon(Icons.person_outline, size: 30),
          ],
          onTap: (value) {
            setState(() {
              currIndex = value;
            });
          },
        ),
        body: pages[currIndex],
      ),
    );
  }
}
