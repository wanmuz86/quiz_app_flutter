import 'package:flutter/material.dart';
import './quiz.dart';
class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quiz app!"),),
      body:Column(
        children:[
          Image.network("https://anak2u.com.my/wp-content/uploads/2020/11/cropped-anak2u-logo1.png"),
          FlatButton(
            color:Colors.red,
            child: Text("Start Game"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder:(context)=>QuizPage()));
            }
          ),
          FlatButton(
            color:Colors.blue,
            child: Text("Hi Score"),
            onPressed: (){

            },
          ),
          FlatButton(
            color:Colors.green,
            child: Text("About Us"),
            onPressed: (){

            },
          )
        ]
      )

    );
  }
}
