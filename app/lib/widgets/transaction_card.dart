import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionCard extends StatefulWidget {
  final Transaction transaction;
  final Function deleteTransaction;

  TransactionCard(
      {@required this.transaction, @required this.deleteTransaction});

  @override
  _TransactionCardState createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  Color _bgColor;

  @override
  void initState() {
    const availbleColors = [
      Colors.red,
      Colors.black,
      Colors.blue,
      Colors.purple,
    ];

    _bgColor = availbleColors[Random().nextInt(4)];
    // TODO: implement initState
    super.initState();
  }

  void _showDialog(ctx) {
    // flutter defined function
    showDialog(
      context: ctx,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: const Text("Delete confirmation"),
          content: const Text("Do you want to delete this transaction?"),
          actions: <Widget>[
            FlatButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text(
                'Delete',
                style: TextStyle(color: Theme.of(ctx).errorColor),
              ),
              onPressed: () {
                widget.deleteTransaction(widget.transaction.id);
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(5),
            child: FittedBox(
              child: Text(
                  '${widget.transaction.currency} ${widget.transaction.amount.toStringAsFixed(2)}'),
            ),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(widget.transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 500
            ? FlatButton.icon(
                icon: const Icon(Icons.delete),
                label: const Text('Delete'),
                textColor: Theme.of(context).errorColor,
                onPressed: () => _showDialog(context),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => _showDialog(context),
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
