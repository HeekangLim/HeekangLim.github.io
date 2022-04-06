import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenBloc extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return
      BlocProvider<BlocCount>(
        create: (BuildContext context) => BlocCount(0),
        child: MaterialApp(
          title : 'Counter app by bloc',
          home : Scaffold(
            appBar: AppBar (
              title: Text('ScreenBloc'),
              leading: BackButton(
                onPressed: () => Navigator.pop(context)
              ),
            ),
            body: SafeArea(
              child :Counter()
            ),
            // child: Counter(
          ),
        ),
      );
  }
}

enum EventCnt { increment }
class BlocCount extends Bloc<EventCnt, int>{
  BlocCount(int initialState) : super(initialState);

  @override
  Stream<int> mapEventToState(EventCnt event) async* {
    yield state + 1;  // state 는 int, 따라서 yield 로 state + 1 노티
  }
}

class Counter extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final _counterBloc = BlocProvider.of<BlocCount>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          OutlinedButton(
              child: Text('+ 1'),
              onPressed: () => _counterBloc.add(EventCnt.increment)),
          BlocBuilder(
              bloc: _counterBloc,
              builder: (BuildContext context, int state) {
                return Text("$state");
              })
        ],
      ),
    );
  }
}
