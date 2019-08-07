import 'package:flutter/material.dart';
import './transaction.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;

  TransactionCard(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.indigo,
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2)),
            padding: EdgeInsets.all(10),
            child: Text(transaction.amount.toString()),
          ),
          Column(
            children: <Widget>[
              Text(transaction.title),
              Text(transaction.date.toString()),
            ],
          )
        ],
      ),
    );
  }
}
