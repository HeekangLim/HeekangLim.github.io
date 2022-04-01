import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ScreenGetX extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // Controller 등록
    Get.put(GetXCounter());

    return MaterialApp(
        title : 'Counter app using getX',
        home : Scaffold(
          appBar: AppBar (
            title: Text('ScreenGetX'),
          ),
          body: SafeArea(
            child : Counter()
          )
        ),
      );
  }
}

class GetXCounter extends GetxController {
  int _nCount = 0;
  var _nCountObservable = 0.obs;

  int getCount() => _nCount;
  getCountObs() => _nCountObservable;

  void increment () {
    _nCount ++;
    update();
  }

  void incrementObs () {
    _nCountObservable ++;
  }
}

class Counter extends StatelessWidget  {
  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          OutlinedButton(
              child: Text('+ 1'),
              onPressed: () => Get.find<GetXCounter>().increment(),
          ),
          GetBuilder<GetXCounter>(
            // init 부분 삭제.
            builder: (_) => Text('${Get.find<GetXCounter>().getCount()}'),
          ),
          OutlinedButton(
            child: Text('+ 1 (Observable)'),
            onPressed: () => Get.find<GetXCounter>().incrementObs(),
          ),
          Obx(() => Text('${Get.find<GetXCounter>().getCountObs()}'))
        ],
      ),
    );
  }
}
