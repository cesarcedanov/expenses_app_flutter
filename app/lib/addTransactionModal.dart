import 'package:flutter/material.dart';

class AddTransactionModal extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all((10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Title:'),
            controller: titleController,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount:'),
            controller: amountController,
          ),
          FlatButton(
            color: Colors.blue,
            child: Text('Add Transaction'),
            onPressed: () {
              print(titleController.text);
              print(amountController.text);
            },
          ),
        ],
      ),
    );
  }
}
