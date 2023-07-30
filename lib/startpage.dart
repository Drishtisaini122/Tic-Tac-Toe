import 'package:flutter/material.dart';

class tictactoe1 extends StatefulWidget {
  tictactoe1({Key? key}) : super(key: key);

  @override
  _tictactoe1State createState() => _tictactoe1State();
}

class _tictactoe1State extends State<tictactoe1> {
  bool ohTurn = true;

  List<String> display = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  int ohScore = 0;
  int exScore = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent[100],
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 45.0),
            child: Text(
              "TIC TAC TOE",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: "Merriweather",
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.pinkAccent[100],
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("PLAYER X", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("PLAYER O", style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Container(
              height: 400,
              width: 400,
              child: ClipRRect(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Colors.pink, Colors.blue]),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: GridView.builder(
                      shrinkWrap: true, // Add this line to prevent overflow
                      itemCount: 9,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            _tapped(index);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                            ),
                            child: Center(
                              child: Text(
                                display[index],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (ohTurn && display[index] == '') {
        display[index] = 'o';
      } else if (!ohTurn && display[index] == '') {
        display[index] = 'x';
      }
      ohTurn = !ohTurn;
      _chechwinner();
    });
  }

  void _chechwinner() {
    if (display[0] == display[1] &&
        display[0] == display[2] &&
        display[0] != '') {
      _showdialog(display[0]);
    }
    if (display[3] == display[4] &&
        display[3] == display[5] &&
        display[3] != '') {
      _showdialog(display[3]);
    }
    if (display[6] == display[7] &&
        display[6] == display[8] &&
        display[6] != '') {
      _showdialog(display[6]);
    }
    if (display[0] == display[3] &&
        display[0] == display[6] &&
        display[0] != '') {
      _showdialog(display[0]);
    }
    if (display[1] == display[4] &&
        display[1] == display[7] &&
        display[1] != '') {
      _showdialog(display[1]);
    }
    if (display[2] == display[5] &&
        display[2] == display[8] &&
        display[2] != '') {
      _showdialog(display[2]);
    }
    if (display[2] == display[4] &&
        display[2] == display[6] &&
        display[2] != '') {
      _showdialog(display[2]);
    }
    if (display[0] == display[4] &&
        display[0] == display[8] &&
        display[0] != '') {
      _showdialog(display[0]);
    }
    bool isDraw = true;
    for (int i = 0; i < display.length; i++) {
      if (display[i] == '') {
        isDraw = false;
        break;
      }
    }

    if (isDraw) {
      _showdialog('DRAW');
    }
  }

  void _showdialog(String winner) {
    if (winner == 'DRAW') {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.pinkAccent[100],
            title: Text(
              "It's a DRAW!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  "PLAY AGAIN",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
      );
    } else {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.pinkAccent[100],
            title: Text(
              "WINNER IS " + winner,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  "PLAY AGAIN",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
      );

      if (winner == 'O') {
        ohScore += 1;
      } else if (winner == 'X') {
        exScore += 1;
      }
    }
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        display[i] = '';
      }
    });
  }
}

