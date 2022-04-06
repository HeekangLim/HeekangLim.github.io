import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ScreenTempNext extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar (
          title: const Text('ScreenGetX'), // 변화 없는 위젯이라 const
        ),
        body: SafeArea(
          child: Center(

            child :Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  child: const Text('Go Back, 단순히 뒤로 가기'),
                  onPressed: () => Get.back(),
                ),
                OutlinedButton(
                  child: const Text('Go Next (page 쌓는 용도)'),
                  onPressed: () => Get.to(moveToNext()),
                ),
                OutlinedButton(
                  child: const Text('Go Off (페이지 이동시 현재 페이지는 닫고 가기)'),
                  onPressed: () => Get.off(moveToNext()),
                ),
                OutlinedButton(
                  child: const Text('Go Off (페이지 이동시 모든 이전 페이지 닫고 가기)'),
                  onPressed: () => Get.offAll(moveToNext()),
                ),
                const Text('--------------------------------------------------------------'),
                OutlinedButton(
                  child: const Text('이름으로 호출'),
                  onPressed: () => Get.toNamed(motoToNextString()),
                ),
                OutlinedButton(
                  child: const Text('이름으로 인자값과 함께 호출'),
                  onPressed: () => Get.toNamed('/param/test?name1=nametest2&name2=nametest3'),
                ),
              ],
            ),
          ),
        ),
    );
  }

  Widget moveToNext() {
    return ScreenTemp2();
  }

  String motoToNextString() {
    return '/temp2';
  }
}

class ScreenTemp2 extends ScreenTempNext {

  @override
  Widget moveToNext() {
    return ScreenTempNext();
  }

  @override
  String motoToNextString() {
    return '/temp1';
  }
}

class ScreenParam extends ScreenTempNext {

  @override
  Widget build(BuildContext context) {
    Fluttertoast.showToast(msg: '${Get.parameters['param']}'
        ' / ${Get.parameters['name1']} / ${Get.parameters['name2']}');

    return super.build(context);
  }
}
