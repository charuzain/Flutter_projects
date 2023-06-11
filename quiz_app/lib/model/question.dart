class Question {
  final String question;
  final List<String> answers;
  const Question({required this.question, required this.answers});

  List<String> shuffleQuestion() {
    List<String> answerCopy = List.of(answers); // create a new copy of answers
    answerCopy.shuffle();
    return answerCopy;
  }
}
