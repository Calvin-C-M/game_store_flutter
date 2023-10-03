import 'package:flutter/material.dart';
import 'package:game_store/components/tags.dart';
import 'package:game_store/models/game.dart';

class DetailGameScreen extends StatefulWidget {
  final Game game;

  const DetailGameScreen({Key? key, required this.game}) : super(key: key);

  @override
  DetailGameScreenState createState() => DetailGameScreenState();
}

class DetailGameScreenState extends State<DetailGameScreen> {

  void _saveGame() {
    setState(() {
      debugPrint("${widget.game.name} is saved: ${widget.game.saved}");
      widget.game.saved = !widget.game.saved;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 19, 45, 70),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_left,
            color: Colors.white,
            size: 35.0,
          ),
          onPressed: () {
            debugPrint("Back button is pressed");
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color.fromARGB(255, 25, 30, 41),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200.0,
            child: Image.network(
              widget.game.thumbnail,
              fit: BoxFit.fill,
            )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  widget.game.name,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  )
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Creator",
                          style: TextStyle(
                            color: Color.fromARGB(255, 105, 110, 121),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 32.0,
                        ),
                        Text(
                          widget.game.creator,
                          style: const TextStyle(
                            color: Colors.white
                          )
                        )
                      ],
                    ),
                    
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Released",
                          style: TextStyle(
                            color: Color.fromARGB(255, 105, 110, 121),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          widget.game.releasedDate,
                          style: const TextStyle(
                            color: Colors.white
                          )
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20.0
                ),
                Text(
                  widget.game.description,
                  style: const TextStyle(
                    color: Colors.white
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  "Tags",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 105, 110, 121)
                  ),
                ),
                GridView.count(
                  childAspectRatio: (1 / .4),
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  children: widget.game.tags.map((tag) {
                    return TagBadge(tag: tag);
                  }).toList(),
                )
              ],
            )
          )
        ],
      ),
      // floatingActionButton: AddGameButton(gameIsSaved: game.saved),
      floatingActionButton: FloatingActionButton(
        tooltip: (widget.game.saved ? "Delete from library" : "Add game to library") ,
        backgroundColor: const Color.fromARGB(255, 1, 195, 141),
        shape: const CircleBorder(),
        onPressed: _saveGame,
        child: Icon(
          (widget.game.saved ? Icons.delete : Icons.add) ,
          color: Colors.white
        )
      ),
    );
  }
}