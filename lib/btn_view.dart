import 'package:flutter/material.dart';

class BtnView extends StatelessWidget {
  BtnView(
      {super.key,
      required this.currentSymbol,
      required this.onclick,
      required this.index});

  String currentSymbol;
  Function onclick;
  int index;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2), // External padding
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: const RoundedRectangleBorder(),
          ),
          onPressed: () {
            onclick(index);
          },
          child: Text(
            currentSymbol,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
