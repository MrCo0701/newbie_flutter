import 'package:flutter/material.dart';
import 'package:repetition_time/widgets/expenses_list/expenses_item.dart';

import '../../model/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.removeExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) removeExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // ?  ==> dung .builder de toi uu du lieu khi dung voi 1 list nhieu phan tu (vi luc nao luot den thi no moi hien ra phan tu do )
        itemCount: expenses.length,
        itemBuilder: (ctx, index) => Dismissible(
            onDismissed: (direction) {
              removeExpense(expenses[index]);
            },
            background: Container(
              alignment: Alignment.centerRight,
              color: Theme.of(context).colorScheme.error.withOpacity(0.8),
              // ? ==> opacity la lam trong suot cai container
              margin: EdgeInsets.symmetric(
                  horizontal: Theme.of(context).cardTheme.margin!.horizontal,
                  vertical: 8),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Delete',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            key: ValueKey(expenses[index]),
            child: ExpenseItem(expenses[index])));
  }
}
