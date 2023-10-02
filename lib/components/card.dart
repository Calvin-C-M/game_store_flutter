import 'package:flutter/material.dart';
import 'package:game_store/detail_game_screen.dart';
import 'package:game_store/models/game.dart';

String priceTag(price) {
  return (price == "Free") ? "Free to Play" : "Rp$price";
}

void redirectToDetailScreen(context, Game game) {
  debugPrint("${game.name} card is clicked");
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return DetailGameScreen(game: game);
  }));
}

class FeaturedGameCard extends StatelessWidget {
  final Game game;

  const FeaturedGameCard({
    Key? key,
    required this.game
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Card(
        color: const Color.fromARGB(255, 25, 30, 41),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: const Color.fromARGB(255, 105, 110, 121),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Image.network(
                  game.thumbnail,
                  fit: BoxFit.fill,
                  height: 200,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      game.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0
                      )
                    ),
                    Text(
                      priceTag(game.price),
                      style: const TextStyle(
                        color: Color.fromARGB(255, 1, 195, 141),
                      )
                    )
                  ],
                )
              ),
            ],
          ),
          onTap: () {
            redirectToDetailScreen(context, game);
          },
        )
      ),
    );
  }
}

class GameCard extends StatelessWidget {
  final Game game;
  
  const GameCard({
    Key? key, 
    required this.game
  }) : super(key: key);

  final double _cardHeight = 60.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _cardHeight,
      child: Card(
        color: const Color.fromARGB(255, 25, 30, 41),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: const Color.fromARGB(255, 105, 110, 121),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Image.network(
                  game.thumbnail, 
                  fit: BoxFit.fill,
                  height: _cardHeight,
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    game.name,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  )
                )
              ),
              Expanded(
                flex: 1,
                child: Text(
                  priceTag(game.price),
                  style: const TextStyle(
                    // color: Colors.white
                    color: Color.fromARGB(255, 1, 195, 141),
                  )
                )
              )
            ],
          ),
          onTap: () {
            redirectToDetailScreen(context, game);
          }
        )
      ),
    );
  }
}