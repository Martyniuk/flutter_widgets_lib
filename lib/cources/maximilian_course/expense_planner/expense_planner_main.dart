// Core
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Models
import 'models/transaction.dart';

// Widgets
import 'widgets/new_transaction.dart';
import 'widgets/chart.dart';
import 'widgets/transaction_list.dart';

class ExpensePlanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              button: TextStyle(
                color: Colors.white,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  final List<Transaction> _userTransactions = [];
  bool _showChart = false;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('<--- app State $state');
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);

    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      final sevenDaysBefore = DateTime.now().subtract(Duration(days: 7));

      return tx.date.isAfter(sevenDaysBefore);
    }).toList();
  }

  void _addNewTransaction(String title, double amount, DateTime chosenDate) {
    final Transaction transaction = Transaction(
      id: _userTransactions.length.toString(),
      title: title,
      amount: amount,
      date: chosenDate,
    );

    print(transaction);
    setState(() {
      _userTransactions.add(transaction);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => id == tx.id);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (bCtx) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: NewTransaction(
            addTransaction: _addNewTransaction,
          ),
        );
      },
    );
  }

  List<Widget> _buildLandscapeContent(MediaQueryData mediaQuery,
      PreferredSizeWidget appBar, Widget txListWidget) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Show Chart', style: Theme.of(context).textTheme.title),
          Switch.adaptive(
            activeColor: Theme.of(context).accentColor,
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
              height: (mediaQuery.size.height -
                      appBar.preferredSize.height -
                      mediaQuery.padding.top) *
                  0.7,
              child: Card(
                elevation: 5.0,
                child: Chart(recentTransactions: _recentTransactions),
              ),
            )
          : txListWidget
    ];
  }

  List<Widget> _buildPortraitContent(MediaQueryData mediaQuery,
      PreferredSizeWidget appBar, Widget txListWidget) {
    return [
      Container(
        height: (mediaQuery.size.height -
                appBar.preferredSize.height -
                mediaQuery.padding.top) *
            0.3,
        child: Card(
          elevation: 5.0,
          child: Chart(recentTransactions: _recentTransactions),
        ),
      ),
      txListWidget,
    ];
  }

  Widget _platformCheck(Widget cupertinoWidget, Widget materialWidget) {
    return Platform.isIOS ? cupertinoWidget : materialWidget;
  }

  Widget _buildCupertinoAppBar() {
    return CupertinoNavigationBar(
      middle: Text(
        'Expense Planner',
        style: TextStyle(fontFamily: 'OpenSans'),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          GestureDetector(
            onTap: () => _startAddNewTransaction(context),
            child: Icon(CupertinoIcons.add),
          ),
        ],
      ),
    );
  }

  Widget _buildMaterialAppBar() {
    return AppBar(
      title: Text(
        'Expense Planner',
        style: TextStyle(fontFamily: 'OpenSans'),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context),
        ),
      ],
    );
  }

  Widget _buildCupertinoScaffold(PreferredSizeWidget appBar, Widget pageBody) {
    return CupertinoPageScaffold(
      navigationBar: appBar,
      child: pageBody,
    );
  }

  Widget _buildMaterialScaffold(PreferredSizeWidget appBar, Widget pageBody) {
    return Scaffold(
      appBar: appBar,
      body: pageBody,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Platform.isIOS
          ? Container()
          : FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => _startAddNewTransaction(context),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final bool isLandscape = mediaQuery.orientation == Orientation.landscape;

    final Widget cupertinoAppBar = _buildCupertinoAppBar();
    final Widget materialAppBar = _buildMaterialAppBar();
    final PreferredSizeWidget appBar =
        _platformCheck(cupertinoAppBar, materialAppBar);

    final Widget txListWidget = Container(
      height: (mediaQuery.size.height -
              appBar.preferredSize.height -
              mediaQuery.padding.top) *
          .7,
      child: TransactionList(
        transactions: _userTransactions,
        deleteTx: _deleteTransaction,
      ),
    );
    final Widget pageBody = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            if (isLandscape)
              ..._buildLandscapeContent(mediaQuery, appBar, txListWidget),
            if (!isLandscape)
              ..._buildPortraitContent(mediaQuery, appBar, txListWidget),
          ],
        ),
      ),
    );

    final Widget cupertinoScaffold =
        _buildCupertinoScaffold(cupertinoAppBar, pageBody);
    final Widget materialScaffold =
        _buildMaterialScaffold(materialAppBar, pageBody);

    return _platformCheck(cupertinoScaffold, materialScaffold);
  }
}
