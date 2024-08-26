import 'package:flutter/material.dart';
import 'package:repetition_time/widgets/expenses.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData().copyWith(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: Expenses()));
}
