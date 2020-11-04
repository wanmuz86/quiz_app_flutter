class Question {
  final String question;
  final String correctAnswer;
  final List<String> incorrectAnswers;
  final String category;

  Question({this.question, this.correctAnswer, this.incorrectAnswers, this.category});

  factory Question.fromJson(Map<String, dynamic> json){

    return Question(
      question:json["question"],
      correctAnswer: json["correct_answer"],
    //  incorrectAnswers: json["incorrect_answers"],
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