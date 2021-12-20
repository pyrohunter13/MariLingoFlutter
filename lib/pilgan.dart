// ignore_for_file: prefer_const_constructors, unnecessary_new, unused_element, dead_code, unused_label, prefer_const_declarations, unused_local_variable, camel_case_types, avoid_print, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:flutter_wow/MainMenu.dart';

class listOfQuestion {
  List answersList = [
    ["cooks", "cook", "cooking", "cooked"],
    ["pasta", "sand", "mud", "toothpaste"],
    ["are", "do", "is", "does"],
    ["kitchen", "livingroom", "bathroom", "bedroom"],
  ];
  var questions = [
    "My mom______in the kitchen",
    "We brush the teeth with",
    "_____you have a new house?",
    "Mother cooks in the___",
  ];
  var correctAnswers = ["cooks", "toothpaste", "do", "kitchen"];
}

var finalScore = 0;
var questionNumber = 0;
var quiz = new listOfQuestion();

class pilgan extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _pilganState();
  }
}

class _pilganState extends State<pilgan> {
  @override
  Widget build(BuildContext context) {
    int score = 0;
    String scoreTotal = score.toString();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Pilihan Ganda"),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                quiz.questions[questionNumber],
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 60.0)),
              ElevatedButton(
                onPressed: () {
                  if (quiz.answersList[questionNumber][0] ==
                      quiz.correctAnswers[questionNumber]) {
                    debugPrint("correct");
                    finalScore++;
                  } else {
                    debugPrint("wrong");
                  }
                  updateQuestion();
                },
                child: Text(
                  "A." + quiz.answersList[questionNumber][0],
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                  maxLines: 1,
                ),
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(350, 50), primary: Colors.red),
              ),
              Padding(padding: EdgeInsets.only(top: 40.0)),
              ElevatedButton(
                onPressed: () {
                  if (quiz.answersList[questionNumber][1] ==
                      quiz.correctAnswers[questionNumber]) {
                    debugPrint("correct");
                    finalScore++;
                  } else {
                    debugPrint("wrong");
                  }
                  updateQuestion();
                },
                child: Text(
                  "B." + quiz.answersList[questionNumber][1],
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                  maxLines: 1,
                ),
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(350, 50), primary: Colors.red),
              ),
              Padding(padding: EdgeInsets.only(top: 40.0)),
              ElevatedButton(
                onPressed: () {
                  if (quiz.answersList[questionNumber][2] ==
                      quiz.correctAnswers[questionNumber]) {
                    debugPrint("correct");
                    finalScore++;
                  } else {
                    debugPrint("wrong");
                  }
                  updateQuestion();
                },
                child: Text(
                  "C." + quiz.answersList[questionNumber][2],
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                  maxLines: 1,
                ),
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(350, 50), primary: Colors.red),
              ),
              Padding(padding: EdgeInsets.only(top: 40.0)),
              ElevatedButton(
                onPressed: () {
                  if (quiz.answersList[questionNumber][3] ==
                      quiz.correctAnswers[questionNumber]) {
                    String a = "$quiz.correctAnswers[0]";
                    debugPrint("correct");
                    finalScore++;
                  } else {
                    debugPrint("wrong");
                  }
                  updateQuestion();
                },
                child: Text(
                  "D." + quiz.answersList[questionNumber][3],
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                  maxLines: 1,
                ),
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(350, 50), primary: Colors.red),
              ),
              Padding(padding: EdgeInsets.only(top: 100.0)),
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
      ),
      theme: new ThemeData(scaffoldBackgroundColor: Colors.grey[700]),
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
          title: Text("Pilihan Ganda"),
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
