class Question {
  final String question;
  final String _correctAnswer;
  final List<String> answers;
  const Question(
     this._correctAnswer,
      {required this.question,
      required this.answers,
      
      });

  List<String> shuffleQuestion() {
    List<String> answerCopy = List.of(answers); // create a new copy of answers
    answerCopy.shuffle();
    return answerCopy;
  }

  String getCorrectAnswer() {
    return _correctAnswer;
  }
}
