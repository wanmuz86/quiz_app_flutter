import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:quiz_app/models/question.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Question> questions = [];
  @override
  void initState() {
    // TODO: implement initState
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
          Text(questions.length > 0 ?  questions[0].question : "")
        ],
      ),
    );
  }

  Future<List<Question>> fetchquestions() async {
    final response =
        await http.get('https://opentdb.com/api.php?amount=10&category=12');
    if (response.statusCode == 200) {
      return Question.questionsFromJson(json.decode(response.body));
    } else {
      throw Exception('Failed ot load questions');
    }
  }
}
