import 'package:flutter/material.dart';
import 'package:game_store/static/game_list.dart';
import 'package:game_store/components/card.dart';
import 'package:carousel_slider/carousel_slider.dart';

class StorePage extends StatelessWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FeaturedGamesSection(),
        AllGamesSection(),
      ],
    );
  }
}

class FeaturedGamesSection extends StatelessWidget {
  const FeaturedGamesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(text: "Featured Games"),
          CarouselSlider(
            options: CarouselOptions(
              height: 250,
              autoPlay: true,
            ),
            items: featuredGames.map((game) {
              return FeaturedGameCard(
                name: game.name,
                thumbnail: game.thumbnail,
                price: game.price
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class AllGamesSection extends StatelessWidget {
  const AllGamesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(text: "All Games"),
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

class SectionHeader extends StatelessWidget {
  final String text;
  const SectionHeader({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24.0,
        color: Colors.white
      )
    );
  }
}