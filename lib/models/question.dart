class Question {
  final String question;
  final String correctAnswer;
  final List<dynamic> incorrectAnswers;
  final List<dynamic> options;
  final String category;

  Question({this.question, this.correctAnswer, this.incorrectAnswers, this.category,
    this.options});

  factory Question.fromJson(Map<String, dynamic> json){
    List<dynamic> options = List<dynamic>();
    for (var i=0 ;i < json["incorrect_answers"].length; i++ ){
      options.add(json["incorrect_answers"][i]);
    }
    options.add(json["correct_answer"]);
    options.shuffle();
    return Question(
      question:json["question"],
      correctAnswer: json["correct_answer"],
      options:options,
      category: json["category"]
    );
  }

  static List<Question> questionsFromJson(dynamic json){

    var searchResults= json["results"];
    if (searchResults != null){
      var results = new List<Question>();
      searchResults.forEach((v){
        results.add(Question.fromJson(v));
      });
      return results;
    }
    return new List<Question>();
  }
}