class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> get shuffledAnswer {
    final newList = List.of(answers); // ==> clone 1 list moi tu list cu
    newList.shuffle(); // ==> sao tron tat ca phan tu trong list
    return newList;
  }
}
