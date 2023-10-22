import 'package:flutter/material.dart';
import 'package:jogo_do_15/widget/grid.dart';

class board extends StatefulWidget {
  @override
  State<board> createState() => _boardState();
}

class _boardState extends State<board> {
  var number = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];

  int nMoves = 0;

  @override
  void initState() {
    super.initState();
    number.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Puzzle Game',
            style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontWeight: FontWeight.bold,
                fontSize: 50),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              nMoves.toString() + 'Moves | 15 Tiles',
              style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 5),
          Center(child: grid(number, onClick))
        ],
      ),
    );
  }

  void onClick(index) {
    if (index - 0 > 0 && number[index - 1] == 0 && index % 4 != 0 ||
        index + 1 < 16 && number[index + 1] == 0 && (index + 1) % 4 != 0 ||
        (index - 4 >= 0 && number[index - 4] == 0) ||
        (index + 4 < 16 && number[index + 4] == 0)) {
      setState(() {
        number[number.indexOf(0)] = number[index];
        number[index] = 0;
        nMoves++;
      });
    }
    checkWinner();
  }

  bool isShorted(List numberList){
    int first=numberList.first;
    for(int i=1; i<numberList.length; i++){
      int nextNumber = numberList[i];
      if(first > nextNumber) return false;
      first = numberList[i];
    }
    return true;
  }

  void checkWinner(){
    bool isWinner = isShorted(number);
    if(isWinner) {
      print('Venceu!');
    }
  }
}
