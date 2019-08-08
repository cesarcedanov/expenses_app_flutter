import 'package:flutter/material.dart';
import './transaction.dart';
import './transactionCard.dart';
import './addTransactionModal.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
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
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Expenses App'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.cyan,
                elevation: 5,
                child: Text('This will be a Chart'),
              ),
            ),
            AddTransactionModal(),
            Column(
              children: transactions
                  .map((transaction) => TransactionCard(transaction))
                  .toList(),
            )
          ],
        ));
  }
}
