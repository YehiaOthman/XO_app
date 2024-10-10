import 'package:flutter/material.dart';

class NameAndScoresFileds extends StatefulWidget {
  final String name;
  final int score;

  const NameAndScoresFileds(
      {super.key, required this.name, required this.score});

  @override
  State<NameAndScoresFileds> createState() => _NameAndScoresFiledsState();
}

class _NameAndScoresFiledsState extends State<NameAndScoresFileds> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text('Name : ${widget.name}', style: const TextStyle(fontSize: 20)),
          Text('Score : ${widget.score}', style: const TextStyle(fontSize: 20))
        ],
      ),
    );
  }
}
