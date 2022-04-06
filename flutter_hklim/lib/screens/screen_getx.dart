import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hklim/screens/screen_temp.dart';
import 'package:get/get.dart';

class ScreenGetX extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // Controller 등록
    Get.put(GetXCounter());

    // return MaterialApp(
    return GetMaterialApp(  // getX 라우팅을 위해 GetMaterialApp 으로
      getPages: [
        GetPage(name: '/temp1', page: ()=> ScreenTempNext()),
        GetPage(name: '/temp2', page: ()=> ScreenTemp2()),
        GetPage(name: '/param/:param', page: ()=> ScreenParam() ),
      ],
      title : 'Counter app using getX',
      home : Scaffold(
        appBar: AppBar (
          title: const Text('ScreenGetX'), // 변화 없는 위젯이라 const
        ),
        body: SafeArea(
          child : Column(
            children: [
              Counter(),
              const Text('----------------------------------------'),
              OutlinedButton(
                  onPressed: () => Get.to(ScreenTempNext()),
                  child : const Text('스크린 이동'),
              ),
            ],
          )
          // child : Counter()
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
