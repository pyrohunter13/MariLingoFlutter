// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, camel_case_types, avoid_unnecessary_containers, unnecessary_new, unused_element, prefer_const_constructors_in_immutables, unnecessary_brace_in_string_interps, avoid_print

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wow/MainMenu.dart';

class Quiz {
  List images = [
    ["horse", "cat", "dog", "tiger"],
    ["horse", "tiger", "dog", "cat"],
    ["dog", "horse", "cat", "tiger"],
    ["cat", "dog", "horse", "tiger"],
  ];

  var questions = [
    "Which one of these is a horse",
    "Which one of these is a cat",
    "Which one of these is a dog",
    "Which one of these is a tiger",
  ];

  var correctAnswers = ["horse", "cat", "dog", "tiger"];
}

var finalScore = 0;
var questionNumber = 0;
var quiz = new Quiz();

class tebakgbr extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _tebakgbrState();
  }
}

class _tebakgbrState extends State<tebakgbr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Tebak Gambar"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 60.0)),
            Column(
              children: [
                new Text(
                  quiz.questions[questionNumber],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(60.0),
                child: GridView(
                  children: [
                    InkWell(
                      onTap: () {
                        if (quiz.images[questionNumber][0] ==
                            quiz.correctAnswers[questionNumber]) {
                          debugPrint("correct");
                          finalScore++;
                        } else {
                          debugPrint("wrong");
                        }
                        updateQuestion();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            new Image.asset(
                              'assets/${quiz.images[questionNumber][0]}.png',
                              height: 100,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (quiz.images[questionNumber][1] ==
                            quiz.correctAnswers[questionNumber]) {
                          debugPrint("correct");
                          finalScore++;
                        } else {
                          debugPrint("wrong");
                        }
                        updateQuestion();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            new Image.asset(
                              'assets/${quiz.images[questionNumber][1]}.png',
                              height: 100,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (quiz.images[questionNumber][2] ==
                            quiz.correctAnswers[questionNumber]) {
                          debugPrint("correct");
                          finalScore++;
                        } else {
                          debugPrint("wrong");
                        }
                        updateQuestion();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            new Image.asset(
                              'assets/${quiz.images[questionNumber][2]}.png',
                              height: 100,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (quiz.images[questionNumber][3] ==
                            quiz.correctAnswers[questionNumber]) {
                          debugPrint("correct");
                          finalScore++;
                        } else {
                          debugPrint("wrong");
                        }
                        updateQuestion();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            new Image.asset(
                              'assets/${quiz.images[questionNumber][3]}.png',
                              height: 100,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                ),
              ),
            ),
            Text(
              "Score : ${finalScore}",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }

  void resetQuiz() {
    setState(() {
      Navigator.pop(context);
      finalScore = 0;
      questionNumber = 0;
    });
  }

  void updateQuestion() {
    setState(() {
      if (questionNumber == quiz.questions.length - 1) {
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => new Summary(
                      score: finalScore,
                    )));
      } else {
        questionNumber++;
      }
    });
  }
}

class Summary extends StatelessWidget {
  final int score;

  var child;
  Summary({Key? key, required this.score}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tebak Gambar"),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                child: Container(
                    child: (score >= 3)
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              new Image.asset(
                                'assets/good.png',
                                height: 145,
                              ),
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              new Image.asset(
                                'assets/sad.png',
                                height: 250,
                              ),
                            ],
                          )),
              ),

              if (score >= 3)
                Text(
                  "Good Job",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50.0,
                      color: Colors.green),
                )
              else
                Text(
                  "Nice try",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50.0,
                      color: Colors.red),
                ),
              Padding(padding: EdgeInsets.all(30.0)),
              Text(
                "Final Score: $score",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 30.0),
              ),
              Padding(padding: EdgeInsets.all(30.0)),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                minWidth: 300,
                height: 50,
                color: Colors.red,
                onPressed: () {
                  questionNumber = 0;
                  finalScore = 0;
                  print("$finalScore");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MainMenu()),
                  );
                },
                child: const Text(
                  "Back to Main Menu",
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
      theme: new ThemeData(scaffoldBackgroundColor: Colors.grey[700]),
    );
  }
}
