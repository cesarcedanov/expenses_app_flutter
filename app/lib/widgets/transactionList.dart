import 'package:app/models/transaction.dart' as prefix0;
import 'package:flutter/material.dart';

import './transactionCard.dart';

class TransactionList extends StatelessWidget {
  final List<prefix0.Transaction> transactionList;

  TransactionList(this.transactionList);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactionList
          .map((transaction) => TransactionCard(transaction))
          .toList(),
    );
  }
}
