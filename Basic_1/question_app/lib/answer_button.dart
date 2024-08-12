import 'package:flutter/material.dart';

class Answer_button extends StatelessWidget {
  const Answer_button({required this.title, required this.onTap, super.key});

  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          backgroundColor: const Color.fromARGB(255, 33, 1, 95),
          foregroundColor: Colors.white, // ==> color of text
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),

      child: Text(title),
    );
  }
}
