import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transactionCard.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionList;
  final Function deleteTransaction;

  TransactionList(this.transactionList, this.deleteTransaction);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: transactionList.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transactions',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 300,
                  child: Image.asset(
                    'assets/images/empty_wallet.jpg',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return TransactionCard(
                    transactionList[index], deleteTransaction);
              },
              itemCount: transactionList.length,
              // children: transactionList
              //     .map((transaction) => TransactionCard(transaction))
              //     .toList(),
            ),
    );
  }
}
