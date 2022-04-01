import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class ScreenProvider extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          title : 'Counter app using provider',
          home : Scaffold(
            appBar: AppBar (
              title: Text('ScreenProvider'),
              leading: BackButton(
                  onPressed: () => Navigator.pop(context)
              ),
            ),
            body: SafeArea(
              child : ChangeNotifierProvider<ProviderCounter> (
                create: (_) => ProviderCounter(),
                child: Counter(),
            ),
            // child: Counter(
          ),
        )
    );
  }
}

class ProviderCounter with ChangeNotifier {
  int _nCount = 0;

  int getCount() => _nCount;

  void increment () {
    _nCount ++;
    notifyListeners();
  }
}

class Counter extends StatelessWidget  {
  @override
  Widget build(BuildContext context) {
    final _counterProvider = Provider.of<ProviderCounter>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          OutlinedButton(
              child: Text('+ 1'),
              onPressed: () => _counterProvider.increment()
          ),
          Text("${_counterProvider._nCount}"),
        ],
      ),
    );
  }
}
