// ignore_for_file: non_constant_identifier_names, avoid_print, unnecessary_new, prefer_const_constructors

import 'MainMenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var finalScore = 0;
var questionNumber = 0;
var forQuestion = 0;
var forAnswer = 1;
var quiz = Terjemahan();


class Terjemahan{
  var question = [
    "bau-smell", "panas-hot", "tall-tinggi", "young-muda", "sejuk-cool"
  ];
  
}



class MalingTerjemahan extends StatefulWidget {
  const MalingTerjemahan({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MalingTerjemahanState();
  }
}



class _MalingTerjemahanState extends State<MalingTerjemahan> {
  TextEditingController userAnswer = TextEditingController();

  
  String nAnswer = "";
  var goShuffle = quiz.question.shuffle();
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Terjemahan"),
          backgroundColor: Colors.red,
        ),
        
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Terjemahkan kata-kata di bawah ini!",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              // ignore: prefer_const_constructors
              Padding(padding: EdgeInsets.only(top: 20.0)),
              
              Text(question(questionNumber, 0),
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              // ignore: prefer_const_constructors
              Padding(padding: EdgeInsets.only(top: 60.0)),
              Container(
                width: 350,
                child:
                  TextFormField(
                    controller: userAnswer ,
                    decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    hintText: 'Translate here'
                  ),
                ),
              ),
              
              Padding(padding: EdgeInsets.only(top: 60.0)),
              MaterialButton(
                shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                minWidth: 200,
                height : 50,
                color: Colors.red,
                onPressed: (){
                  setState(() {
                  nAnswer = userAnswer.text;
                });
                  if(nAnswer == question(questionNumber, 1)){
                    print("Correct");
                    finalScore++;
                  }else{
                    print("Wrong");
                  }
                  userAnswer.clear();
                  updateQuestion();
                  print(questionNumber);
                },
                child: const Text('Submit',
                  style: TextStyle(
                      fontSize: 24, 
                      color: Colors.black,
                  ),),
                ),

                // ignore: prefer_const_constructors
                Padding(padding: EdgeInsets.only(top: 80.0)),

                Text(
                "Score : $finalScore",
                style: const TextStyle(
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


  String question(int num, int qa) { 
    List<String> wordList = quiz.question[num].split('-');
    return wordList[qa]; 
  }
  void updateQuestion(){
    setState(() {
      if(questionNumber == quiz.question.length - 1){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Summary(score: finalScore,)));

      }else{
        questionNumber++;
      }
    });
  }
}


class Summary extends StatelessWidget{
  final int score;
  const Summary({Key? key, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Terjemahan"),
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