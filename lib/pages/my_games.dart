import 'package:flutter/material.dart';
import 'package:game_store/static/game_list.dart';
import 'package:game_store/components/card.dart';

class MyGamesPage extends StatelessWidget {
  const MyGamesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyGameSection(),
      ],
    );
  }
}

class MyGameSection extends StatelessWidget {
  const MyGameSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Saved Games",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
              color: Colors.white,
            )
          ),
          // SizedBox(
          //   height: 200.0,
          //   // child: ListView.builder(
          //   //   itemBuilder: (context, index),
          //   //   itemCount: ,
          //   // ),
          // )
        ],
      )
    );
  }
}