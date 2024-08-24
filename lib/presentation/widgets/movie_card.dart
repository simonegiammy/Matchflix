import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:matchflix/data_repository/movie_repository.dart';
import 'package:matchflix/model/Movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      /*
      Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(MovieRepository.getPhotoUrl(movie.posterPath)),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Positioned.fill(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
          child: Container(
            color: Colors.black
                .withOpacity(0), // This ensures the blur effect is visible
          ),
        ),
      ),
      */
      Center(
        child: AspectRatio(
          aspectRatio: 0.6,
          child: Container(
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: NetworkImage(
                  MovieRepository.getPhotoUrl(movie.posterPath),
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      )
    ]);
  }
}
