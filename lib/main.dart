import 'dart:ui';

import 'package:flutter/material.dart';
import '/startpage.dart';

void main() => runApp(homepage());

class homepage extends StatefulWidget {
  homepage({Key? key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Showit());
  }
}

class Showit extends StatefulWidget {
  Showit({Key? key}) : super(key: key);

  @override
  _ShowitState createState() => _ShowitState();
}

class _ShowitState extends State<Showit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple[300],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Container(
                    child: Text(
                      "TIC TAC TOE",
                      style: TextStyle(fontSize: 50),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: Container(
                    child: Image.asset(
                      "assets/images/tictactoelogo.png",
                    ),
                    decoration: BoxDecoration(
                        gradient:
                            LinearGradient(colors: [Colors.pink, Colors.blue]),
                        border: Border.all(
                          style: BorderStyle.none,
                        ),
                        shape: BoxShape.circle),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 80.0),
                  child: Container(
                    child: Text(
                      "@CREATED BY DRISHTI",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => tictactoe1()),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.all(50),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Container(
                      padding: EdgeInsets.all(30),
                      color: Colors.purple[200],
                      child: Center(
                        child: Text(
                          'PLAY GAME',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
