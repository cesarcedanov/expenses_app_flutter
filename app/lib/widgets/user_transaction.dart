import 'package:flutter/material.dart';
import './transactionList.dart';
import './addTransactionModal.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: '1',
        title: 'Lunch Chicken and Rice',
        amount: 200,
        currency: 'RD\$',
        date: DateTime.now()),
    Transaction(
      id: '1',
      title: 'Dinner Bacon Burger',
      amount: 250,
      currency: 'US\$',
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        currency: 'RD\$',
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AddTransactionModal(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
