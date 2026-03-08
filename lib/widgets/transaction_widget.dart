import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/data/model/transaction_model.dart';

class TransactionWidget extends StatelessWidget{
  const TransactionWidget({super.key,required this.transacton});

  final TransactionModel transacton;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(transacton.iconName),
      title: Text(transacton.title),
      subtitle: Text(transacton.date.toString()),
      trailing: Text(
        '${transacton.isExpense ? '-' : '+'}\$${transacton.amount.toStringAsFixed(2)}',
        style: TextStyle(
          color: transacton.isExpense ? Colors.red : Colors.green,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}