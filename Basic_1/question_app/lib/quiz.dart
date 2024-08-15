import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:question_app/data/questions.dart';
import 'package:question_app/question_screen.dart';
import 'package:question_app/result_screen.dart';
import 'package:question_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];

  var activeScreen = 'start_screen';

  void switchScreen() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswers(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result_screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if(activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(onSelectedAnswer: chooseAnswers);
    }else if (activeScreen == 'start_screen') {
      screenWidget = StartScreen(switchScreen);
    }else if(activeScreen == 'result_screen') {
      screenWidget = ResultScreen(chooseAnswer: selectedAnswers);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 78, 13, 151),
          Color.fromARGB(255, 78, 19, 155)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: screenWidget
      )),
    );
  }
}
