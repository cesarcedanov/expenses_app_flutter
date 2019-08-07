import 'package:flutter/material.dart';
import './transaction.dart';
import './transactionCard.dart';

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
        title: 'Lunch 08/06/19 Chicken and Rice',
        amount: 200,
        date: DateTime.now()),
    Transaction(
        id: '1',
        title: 'Dinner 08/06/19 Bacon Burger',
        amount: 250,
        date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Expenses App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            Column(
              children: transactions
                  .map((transaction) => TransactionCard(transaction))
                  .toList(),
            )
          ],
        ));
  }
}
