import 'package:flutter/material.dart';

String priceTag(price) {
  return (price == "Free") ? "Free to Play" : "Rp$price";
}

class FeaturedGameCard extends StatelessWidget {
  final String name;
  final String thumbnail;
  final String price;

  const FeaturedGameCard({
    Key? key,
    required this.name,
    required this.thumbnail,
    required this.price,
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
                  thumbnail,
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
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0
                      )
                    ),
                    Text(
                      priceTag(price),
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
            debugPrint("$name has been clicked!");
          },
        )
      ),
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
                  priceTag(price),
                  style: const TextStyle(
                    // color: Colors.white
                    color: Color.fromARGB(255, 1, 195, 141),
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