import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:game_store/static/game_list.dart';

class StorePage extends StatelessWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AllGamesSection(),
      ],
    );
  }
}

class AllGamesSection extends StatelessWidget {
  const AllGamesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "All Games",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
              color: Color.fromARGB(255, 1, 195, 141)
            )
          ),
          SizedBox(
            height: 300.0,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return GameCard(
                  name: gameList[index].name,
                  thumbnail: gameList[index].thumbnail,
                  price: gameList[index].price,
                  tags: gameList[index].tags
                );
              },
              itemCount: gameList.length,
            )
          )
        ],
      )
    );
  }
}

class GameCard extends StatelessWidget {
  final String name;
  final String thumbnail;
  final String price;
  final List<String> tags;
  
  const GameCard({
    Key? key, 
    required this.name, 
    required this.thumbnail, 
    required this.price, 
    required this.tags
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
                  thumbnail, 
                  fit: BoxFit.fill,
                  height: _cardHeight,
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  )
                )
              ),
              Expanded(
                flex: 1,
                child: Text(
                  ((price == "Free") ? "Free to Play" : "Rp$price"),
                  style: const TextStyle(
                    color: Colors.white
                  )
                )
              )
            ],
          ),
          onTap: () {
            debugPrint("$name Card Clicked");
          }
        )
      ),
    );
  }
}