import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTransactionModal extends StatefulWidget {
  final Function addTransaction;

  AddTransactionModal(this.addTransaction) {
    print("Constructor");
  }

  @override
  _AddTransactionModalState createState() {
    print("createState");
    return _AddTransactionModalState();
  }
}

class _AddTransactionModalState extends State<AddTransactionModal> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  DateTime _selectedDate;

  _AddTransactionModalState() {
    print("Constructor State");
  }

  @override
  void initState() {
    // TODO: implement initState
    print("initState");
    super.initState();
  }

  @override
  void didUpdateWidget(AddTransactionModal oldWidget) {
    // TODO: implement didUpdateWidget
    print("didUpdateWidget");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print("dispose");
    super.dispose();
  }

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            left: 10,
            top: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title:'),
                controller: titleController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount:'),
                keyboardType: TextInputType.number,
                controller: amountController,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(_selectedDate == null
                        ? 'No Date Chosen!'
                        : 'Picked Date: ${DateFormat.yMMMd().format(_selectedDate)}'),
                  ),
                  FlatButton(
                    child: Text(
                      'Choose a Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    textColor: Theme.of(context).primaryColor,
                    onPressed: _showDatePicker,
                  ),
                ],
              ),
              RaisedButton(
                color: Theme.of(context).accentColor,
                child: const Text('Add Transaction'),
                textColor: Theme.of(context).textTheme.button.color,
                onPressed: () {
                  final title = titleController.text;
                  final amount = double.parse(amountController.text);

                  if (title.isEmpty || amount <= 0 || _selectedDate == null) {
                    return;
                  }
                  widget.addTransaction(title, amount, _selectedDate);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
