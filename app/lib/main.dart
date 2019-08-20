import 'package:flutter/material.dart';

import './widgets/transaction_list.dart';
import './widgets/add_transaction_modal.dart';
import './widgets/chart.dart';
import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Expenses App',
      theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          accentColor: Colors.teal,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
                button:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          )),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //     id: '1',
    //     title: 'Lunch Chicken and Rice',
    //     amount: 200,
    //     currency: 'RD\$',
    //     date: DateTime.now()),
    // Transaction(
    //   id: '1',
    //   title: 'Dinner Bacon Burger',
    //   amount: 250,
    //   currency: 'US\$',
    //   date: DateTime.now(),
    // ),
  ];

  bool _showChart = false;

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((transaction) {
      return transaction.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime txDateTime) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        currency: 'RD\$',
        date: txDateTime,
        id: DateTime.now().toString());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((transaction) => transaction.id == id);
    });
  }

  void _showAddTransactionModal(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: AddTransactionModal(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  List<Widget> _buildLandscapeContent(
    double _bodySize,
  ) {
    return <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Show chart:'),
          Switch.adaptive(
            value: _showChart,
            onChanged: (val) {
              setState(() {
                _showChart = val;
              });
            },
          ),
        ],
      ),
      _showChart
          ? Container(
              height: _bodySize * 0.5,
              child: Chart(_recentTransactions),
            )
          : Container(
              height: _bodySize * 0.5,
              child: TransactionList(_userTransactions, _deleteTransaction)),
    ];
  }

  List<Widget> _buildPortraitContent(
    double _bodySize,
  ) {
    return [
      Container(
        height: _bodySize * 0.3,
        child: Chart(_recentTransactions),
      ),
      Container(
          height: _bodySize * 0.6,
          child: TransactionList(_userTransactions, _deleteTransaction)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text('My Expenses App'),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () => _showAddTransactionModal(context),
        )
      ],
    );

    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final _BodySize = (MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top);

    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              if (!isLandscape) ..._buildPortraitContent(_BodySize),
              if (isLandscape) ..._buildLandscapeContent(_BodySize),
              Container(
                height: _BodySize * 0.1,
                alignment: Alignment.bottomCenter,
                child: const Text(
                  'created by \@CesarCedanoV',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _showAddTransactionModal(context),
      ),
    );
  }
}
