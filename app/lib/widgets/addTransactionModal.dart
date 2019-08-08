import 'package:flutter/material.dart';

class AddTransactionModal extends StatelessWidget {
  final Function addTransaction;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  AddTransactionModal(this.addTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
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
                addTransaction(
                    titleController.text, double.parse(amountController.text));
              },
            ),
          ],
        ),
      ),
    );
  }
}
