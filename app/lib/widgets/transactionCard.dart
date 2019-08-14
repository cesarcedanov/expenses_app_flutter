import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;

  TransactionCard(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(5),
            child: FittedBox(
              child: Text(
                  '${transaction.currency} ${transaction.amount.toStringAsFixed(2)}'),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.date),
        ),
      ),
    );

    // return Card(
    //   color: Colors.white,
    //   child: Row(
    //     children: <Widget>[
    //       Container(
    //         margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    //         decoration: BoxDecoration(
    //             border: Border.all(color: Colors.black, width: 2)),
    //         padding: EdgeInsets.all(10),
    //         child: Text(
    //           '${transaction.currency} ${transaction.amount.toStringAsFixed(2)}',
    //           style: TextStyle(
    //               fontWeight: FontWeight.bold,
    //               fontSize: 18,
    //               color: Colors.redAccent),
    //         ),
    //       ),
    //       Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //         children: <Widget>[
    //           Padding(
    //             padding: EdgeInsets.only(bottom: 5),
    //             child: Text(
    //               transaction.title,
    //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    //             ),
    //           ),
    //           Text(
    //             DateFormat.yMMMMEEEEd().add_jm().format(transaction.date),
    //             style: TextStyle(fontSize: 12, color: Colors.grey),
    //           ),
    //         ],
    //       )
    //     ],
    //   ),
    // );
  }
}
