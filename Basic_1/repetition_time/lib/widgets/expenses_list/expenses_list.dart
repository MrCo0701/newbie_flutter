import 'package:flutter/cupertino.dart';
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
        // ==> dung .builder de toi uu du lieu khi dung voi 1 list nhieu phan tu (vi luc nao luot den thi no moi hien ra phan tu do )
        itemCount: expenses.length,
        itemBuilder: (ctx, index) => Dismissible(
            onDismissed: (direction) {
              removeExpense(expenses[index]);
            },
            key: ValueKey(expenses[index]),
            child: ExpenseItem(expenses[index])));
  }
}
