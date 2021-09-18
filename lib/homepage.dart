import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviz/models/movie.dart';

import 'package:moviz/models/search_categories.dart';
import 'package:moviz/movie_tile.dart';

class MainPage extends ConsumerWidget {
  TextEditingController? _searchController;
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    Size size = MediaQuery.of(context).size;
    TextEditingController _searchController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false, // very needed when keyboard open
      body: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(
                        'https://i.pinimg.com/originals/8d/b9/9b/8db99bf08ecf3323cb219a78c5749b68.jpg',
                      ),
                      fit: BoxFit.fill)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  decoration:
                      BoxDecoration(color: Colors.black.withOpacity(0.2)),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, size.height * 0.02, 0, 0),
              width: size.width * 0.88,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // margin: EdgeInsets.fromLTRB(0, 10, 0, 30),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    width: size.width,
                    decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: size.width * 0.5,
                          child: TextField(
                            controller: _searchController,
                            style: TextStyle(color: Colors.grey, fontSize: 19),
                            cursorColor: Colors.grey,
                            decoration: InputDecoration(
                                hintText: 'Search...',
                                hintStyle:
                                    TextStyle(color: Colors.grey, fontSize: 19),
                                prefixIcon:
                                    Icon(Icons.search, color: Colors.grey),
                                focusedBorder: InputBorder.none,
                                border: InputBorder.none),
                          ),
                        ),
                        DropdownButton(
                          dropdownColor: Colors.black38,
                          value: SearchCategory.popular,
                          icon: Icon(
                            Icons.menu,
                            color: Colors.white24,
                          ),
                          underline: Container(height: 1, color: Colors.white),
                          onChanged: (_value) {},
                          items: [
                            DropdownMenuItem(
                              child: Text(
                                SearchCategory.popular,
                                style: TextStyle(color: Colors.white70),
                              ),
                              value: SearchCategory.popular,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                SearchCategory.upcoming,
                                style: TextStyle(color: Colors.white70),
                              ),
                              value: SearchCategory.upcoming,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                SearchCategory.none,
                                style: TextStyle(color: Colors.white24),
                              ),
                              value: SearchCategory.none,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                      height: size.height * 0.83,
                      padding:
                          EdgeInsets.symmetric(vertical: size.height * 0.01),
                      child: _moviesListViewWidget())
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _moviesListViewWidget extends StatelessWidget {
  // _moviesListViewWidget({this.size});
  final List<Movie> _movies = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    for (var i = 0; i < 20; i++) {
      _movies.add(Movie(
          name: "Mortal Kombat",
          language: "EN",
          isAdult: false,
          posterPath: "/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg",
          backcropPath: "/rr7E0NoGKxvbkb89eR1GwfoYjpA.jpg",
          description: "andjkfnkjnknknjnnknknknk",
          rating: 7.8,
          releaseDate: "2021-04-07"));
    }

    return _movies.length != 0
        ? ListView.builder(
            itemCount: _movies.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 0, vertical: size.height * 0.01),
                child: GestureDetector(
                  onTap: () {},
                  child: MovieTile(
                    movie: _movies[index],
                    height: size.height * 0.20,
                    width: size.width * 0.85,
                  ),
                ),
              );
            })
        : Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
          );
  }
}
