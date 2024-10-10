import 'package:flutter/material.dart';
import 'btn_view.dart';
import 'name_and_scores_fileds.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> boardState = ['', '', '', '', '', '', '', '', ''];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: const Text(
                'XO',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                const Row(
                  children: [
                    SizedBox(
                      height: 200,
                    ),
                    NameAndScoresFileds(
                      name: 'yehia',
                      score: 0,
                    ),
                    NameAndScoresFileds(
                      name: 'mohamed',
                      score: 0,
                    ),
                  ],
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      BtnView(
                        currentSymbol: boardState[0],
                        onclick: onBoardClick,
                        index: 0,
                      ),
                      BtnView(
                        currentSymbol: boardState[1],
                        onclick: onBoardClick,
                        index: 1,
                      ),
                      BtnView(
                        currentSymbol: boardState[2],
                        onclick: onBoardClick,
                        index: 2,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      BtnView(
                        currentSymbol: boardState[3],
                        onclick: onBoardClick,
                        index: 3,
                      ),
                      BtnView(
                        currentSymbol: boardState[4],
                        onclick: onBoardClick,
                        index: 4,
                      ),
                      BtnView(
                        currentSymbol: boardState[5],
                        onclick: onBoardClick,
                        index: 5,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      BtnView(
                        currentSymbol: boardState[6],
                        onclick: onBoardClick,
                        index: 6,
                      ),
                      BtnView(
                        currentSymbol: boardState[7],
                        onclick: onBoardClick,
                        index: 7,
                      ),
                      BtnView(
                        currentSymbol: boardState[8],
                        onclick: onBoardClick,
                        index: 8,
                      )
                    ],
                  ),
                )
              ],
            )));
  }

  int counter = 0;

  void onBoardClick(int index) {
    if (counter.isEven) {
      boardState[index] = 'x';
      counter++;
    } else {
      boardState[index] = 'O';
      counter++;
    }
    setState(() {});
  }
}
