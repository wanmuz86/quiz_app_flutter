import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Result"),),
      body: Center(
        child: Text("Your score is "),
      ),
    );
  }
}
