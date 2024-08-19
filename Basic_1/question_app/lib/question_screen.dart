import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:question_app/answer_button.dart';
import 'package:question_app/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectedAnswer});

  final void Function(String answer) onSelectedAnswer;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectedAnswer('');

    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.eduVicWaNtBeginner(),
              textAlign: TextAlign.center,  
            ),
            const SizedBox(height: 30),
            ...currentQuestion.shuffledAnswer.map((answer) => Answer_button(
                    title: answer,
                    onTap: () {
                      answerQuestion(answer);
                    })),
          ],
        ),
      ),
    );
  }
}
