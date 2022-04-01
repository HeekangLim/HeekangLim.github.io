```yaml
layout: default
```

# Flutter 상태관리 - GetX 패턴

이 페이지는 GetX패턴에 대한 Page 입니다. 

해당 페이지에서는 GetX 라이브러리를 이용한 방법을 다룹니다.

## GetX 패턴 xmrwld

> BLoC 와 Provider에 비해 가볍고 다루기 쉽게 되어 있다.
> 
> 이해하기 쉬운 구조로 되어 있으며 리소스 관리에 매우 용이 하다.
> 
> 효율적인 상태관리 패턴을 재공 함에 따라, 책임을 분리할 수 있다.
> 
> 상태 관리에 있어서 반응형 상태관리를 사용하여 resource를 절약할 수 있으며 update를 통해 갱신하는 것이 아닌 값 변경됨에 따라 반응한다.

### 설정

> pubspec.lock 에 다음만 추가해주면 사용 설정은 끝입니다.
> (버전은 프로젝트에 맞는 버전으로 설정)

```yml
dependencies:
  ...
  getx : 
  ...
```

### 예제

[예제 깃헙](https://github.com/HeekangLim/HeekangLim.github.io)

> 해당 github 에서 flutter_hklim 이 프로젝트 폴더.
> 반응형 과 일반형 보두 사용하여 상태 변환에 따른 차이를 알아 보겠습니다.

--------

### 사용 방법

#### Controller 등록

> GetX 컨트롤러 등록 

```dart
  // Controller 등록
    Get.put(GetXCounter());
```

#### 컨트롤러에서 일반형과 반응형 차이

> 반응형의 경우 일반형과 다르게 뒤에 .obs 를 붙여줍니다.
> 일반형의 경우 update를 해주어야 하지만 반응형은 update를 해주지 않아도 됩니다.

```dart
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
```

#### Counter 위젯

> GetBuilder 를 이용하여 Controller 가 Update 될 때에 호출되는 일반 GetX 사용법을 보여줍니다.
> Obx 로 update가 필요없는 반응형 GetX 사용법을 보여줍니다.

```dart
class Counter extends StatelessWidget  {
  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          // ====================== 일반 GetX =======================
          OutlinedButton(
              child: Text('+ 1'),
              onPressed: () => Get.find<GetXCounter>().increment(),
          ),
          GetBuilder<GetXCounter>(
            builder: (_) => Text('${Get.find<GetXCounter>().getCount()}'),
          ),

          // ====================== 반응형 GetX =======================
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
```

### 결과

#### 결론

> BLoC 와 Provider에 비해서 사용법이 간결해짐.
> BLoC 와 Provider처럼 책임을 분리할 수 있음.
> GetX 의 최대 강점중 하나인 라우트 관리는 다음 페이지에서 소개 하겠습니다.

##### GetX 라우팅 : [GetX Route](./flutter_state_route_getx.html)

##### BLoC 상태관리 : [BLoC](./flutter_state_pattern_bloc.html)

##### Provider 상태관리 : [Provider](./flutter_state_pattern_provider.html)
