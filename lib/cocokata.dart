// ignore_for_file: prefer_const_constructors, unnecessary_new, avoid_unnecessary_containers

import 'package:flutter/material.dart';

import 'MainMenu.dart';

var finalScore = 0;
var questionNumber = 0;
var quiz = CocokKata();
String userAnswer = " ";

class CocokKata {
  var question = [
    "The dog barks",
    "I ate a sandwich",
    "The baby cried",
    "Tomy rides his bike",
    "I hear the rain"
  ];

  var corrAnswer = [
    "The dog barks ",
    "I ate a sandwich ",
    "The baby cried ",
    "Tomy rides his bike ",
    "I hear the rain "
  ];
}

class MalingCocok extends StatefulWidget {
  const MalingCocok({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MalingCocokState();
  }
}

class _MalingCocokState extends State<MalingCocok> {
  String nAnswer = "";
  @override
  Widget build(BuildContext context) {
    var txt = TextEditingController();
    String question = quiz.question[questionNumber];
    List l = question.split(' ');
    l.shuffle();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Cocok Kata"),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Susunlah kata-kata di bawah sesuai dengan tata bahasa yang benar!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 40.0)),
              Container(
                width: 350,
                child: TextFormField(
                  controller: txt,
                  enabled: false,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                      hintText: 'Your answer will be displayed here'),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 30.0)),
              for (int i = 0; i < l.length; i++)
                Container(
                    child: Column(
                  children: [
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                      minWidth: 200,
                      height: 50,
                      color: Colors.red,
                      onPressed: () {
                        {
                          txt.text += l[i];
                          txt.text += " ";
                        }
                      },
                      child: Text(
                        l[i],
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10.0)),
                  ],
                )),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              ElevatedButton(
                  onPressed: () {
                    txt.text = '';
                  },
                  child: Text('Reset')),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(12.0),
                    ),
                    fixedSize: const Size(200, 50),
                    primary: Colors.green),
                onPressed: () {
                  setState(() {
                    nAnswer = txt.text;
                  });
                  if (txt.text == quiz.corrAnswer[questionNumber]) {
                    print("Correct");
                    finalScore++;
                    debugPrint(quiz.corrAnswer[questionNumber]);
                    debugPrint(nAnswer);
                  } else {
                    print("Wrong");
                    debugPrint(quiz.corrAnswer[questionNumber]);
                    debugPrint(nAnswer);
                  }
                  txt.clear();
                  updateQuestion();
                },
                child: Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 40.0)),
              Text(
                "Score : $finalScore",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      theme: new ThemeData(scaffoldBackgroundColor: Colors.grey[700]),
    );
  }

  void updateQuestion() {
    setState(() {
      if (questionNumber == quiz.question.length - 1) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Summary(
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
          title: Text("Cocok Kata"),
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
