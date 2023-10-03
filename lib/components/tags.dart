import 'package:flutter/material.dart';

class TagBadge extends StatelessWidget {
  final String tag;
  const TagBadge({Key? key, required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(75, 1, 195, 141),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        child: Center(
          child: Text(
            tag,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 1, 195, 141)
            )
          )
        )
      ),
    );
  }
}