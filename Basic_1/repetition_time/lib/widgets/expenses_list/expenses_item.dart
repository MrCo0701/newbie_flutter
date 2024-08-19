import 'package:flutter/material.dart';
import 'package:repetition_time/model/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        children: [
          Text(expense.title),
          const SizedBox(height: 4),
          Row(
            children: [
              Text('\$${expense.count.toStringAsFixed(2)}'), // ==> lam tron den 2 chu so
              const Spacer(), //=> se chiem het tat ca phan trong o giua roi day 2 phan tu trong row or column ra xa nhau max
              Row(
                children: [
                  Icon( categoryIcons[expense.category]),
                  const SizedBox(width: 8,),
                  Text(expense.formattedDate)
                ],
              )
            ],
          )
        ],
      )
    ));
  }
}
