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
  int pl1Score = 0;
  int pl2Score = 0;
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
                Row(
                  children: [
                    const SizedBox(
                      height: 200,
                    ),
                    NameAndScoresFileds(
                      name: 'yehia',
                      score: pl1Score,
                    ),
                    NameAndScoresFileds(
                      name: 'mohamed',
                      score: pl2Score,
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
      boardState[index] = 'X';
      if (checkWinner('X')) {
        print('player 1 win');
        pl1Score = pl1Score + 10;
        clearBoardState();
      }
      counter++;
    } else {
      boardState[index] = 'O';
      if (checkWinner('O')) {
        print('player 2 win');
        pl2Score = pl2Score + 10;
        clearBoardState();
      } else if (checkDraw()) {
        print('the game is draw');
        clearBoardState();
      } else {
        counter++;
      }
    }
    setState(() {});
  }

  bool checkWinner(String symbol) {
    for (int i = 0; i < 9; i += 3) {
      if (boardState[i] == symbol &&
          boardState[i + 1] == symbol &&
          boardState[i + 2] == symbol) return true;
    }
    for (int i = 0; i < 3; i++) {
      if (boardState[i] == symbol &&
          boardState[i + 3] == symbol &&
          boardState[i + 6] == symbol) return true;
    }
    if (boardState[0] == symbol &&
        boardState[4] == symbol &&
        boardState[8] == symbol) return true;

    if (boardState[2] == symbol &&
        boardState[4] == symbol &&
        boardState[6] == symbol) return true;

    return false;
  }

  void clearBoardState() {
    boardState = List.filled(9, '');
  }

  bool checkDraw() {
    return boardState.every((element) => element.isNotEmpty) &&
        !checkWinner('X') &&
        !checkWinner('O');
  }
}
