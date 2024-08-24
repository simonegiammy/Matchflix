import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:matchflix/data_provider/movie_provider.dart';
import 'package:matchflix/data_repository/movie_repository.dart';
import 'package:matchflix/model/Movie.dart';
import 'package:matchflix/presentation/widgets/movie_card.dart';
import 'package:matchflix/presentation/widgets/swipe_cards.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie> movies = [];
  bool isLoading = true;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((p0) async {
      movies = await MovieRepository.getTopMovies();
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                    child: SwipeCards(
                        cards:
                            movies.map((e) => MovieCard(movie: e)).toList())),
              ],
            ),
    );
  }
}
