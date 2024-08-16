import 'package:flutter/material.dart';
import 'package:question_app/data/questions.dart';
import 'package:question_app/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chooseAnswer});

  final List<String> chooseAnswer;

  List<Map<String, Object>> get SummaryData {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chooseAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chooseAnswer[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestion = questions.length;
    final numCorrectQuestion = SummaryData.where(
            (data) => data['user_answer'] == data['correct_answer'])
        .length; // => neu nhu return lai true thi giu lai trong list con false thi bo qua

    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'You answered $numCorrectQuestion out of $numTotalQuestion questions correctly!'),
              const SizedBox(height: 30),
              QuestionSummary(summaryData: SummaryData),
              const SizedBox(height: 30),
              TextButton(onPressed: () {}, child: const Text('Restart Quiz'))
            ],
          ),
        ));
  }
}
