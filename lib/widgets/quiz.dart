import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/widgets/result.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Question> questions = [];
  String message = "";
  int score = 0;
  int questionNumber = 0;
  @override
  void initState() {
    super.initState();
    this.fetchquestions().then((response) {
      setState(() {
        questions = response;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print(questions);
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz game"),
      ),
      body: Column(
        children: <Widget>[
          Text(questions.length > 0 ?  questions[questionNumber].question : ""),
          questions[questionNumber].options.length > 0 ? Expanded(
            child: ListView.builder(
              itemCount: questions[questionNumber].options.length,
                itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.yellow,
                  child:
                  GestureDetector(child:
                  Text(questions[questionNumber].options[index], style: TextStyle(
                    fontSize: 32
                  ),),
                    onTap: (){
                    if (questions[questionNumber].options[index] == questions[questionNumber].correctAnswer){
                      setState(() {
                        message="Correct!";
                        score= score+1;

                      });
                    }
                    else {
                      setState(() {
                        message="Incorrect!";

                      });
                    }
                    if (questionNumber < 9) {
                      setState(() {
                        questionNumber = questionNumber + 1;
                      }
                      );
                    }
                    else {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage()));
                    }

                    },
                  )
                ),
              );
            }),
          ) : Container(),
          Text(message)
        ],
      ),
    );
  }

  Future<List<Question>> fetchquestions() async {
    final response =
        await http.get('https://opentdb.com/api.php?amount=10&category=18');
    if (response.statusCode == 200) {
      return Question.questionsFromJson(json.decode(response.body));
    } else {
      throw Exception('Failed ot load questions');
    }
  }
}
