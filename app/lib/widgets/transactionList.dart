import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transactionCard.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionList;

  TransactionList(this.transactionList);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return TransactionCard(transactionList[index]);
        },
        itemCount: transactionList.length,
        // children: transactionList
        //     .map((transaction) => TransactionCard(transaction))
        //     .toList(),
      ),
    );
  }
}
