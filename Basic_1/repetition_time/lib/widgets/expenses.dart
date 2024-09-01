import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:repetition_time/widgets/chart/chart.dart';
import 'package:repetition_time/widgets/expenses_list/expenses_list.dart';
import 'package:repetition_time/widgets/new_expense.dart';

import '../model/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Flutter course',
        count: 19.99,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'Cinema',
        count: 15.69,
        date: DateTime.now(),
        category: Category.leisure)
  ];

  void _openExpenseOverlay() {
    showModalBottomSheet(
        context: context,
        useSafeArea: true, // ? ==> cho cai bottomSheet nay tranh xa thanh phan cua thiet bi
        builder: (ctx) => NewExpense(
              onAddExpense: _addExpense,
            ),
        isScrollControlled: true);
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);

    setState(() {
      _registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      content: const Text('Expense deleted'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: (){
          setState(() {
            _registeredExpenses.insert(expenseIndex, expense);
          });
        },
      ),
      behavior: SnackBarBehavior.floating,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width; // ? ==> width of device

    Widget mainContent = const Center(
      child: Text('Don\'t have any thing in here'),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        removeExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                _openExpenseOverlay();
              },
              icon: const Icon(Icons.add))
        ],
        title: const Text('Flutter ExpenseTracker'),
      ),
      body: width < 600
          ? Column(
              children: [
          Chart(expenses: _registeredExpenses),
          Expanded(child: mainContent)
        ],
            )
          : Row(
              children: [
                Expanded(child: Chart(expenses: _registeredExpenses)),
                Expanded(child: mainContent)
              ],
            ),
    );
  }
}
