```yaml
layout: default
```

# Flutter 상태관리 - Provider 패턴

이 페이지는 Provider패턴에 대한 Page 입니다. 

해당 페이지에서는 Provider 라이브러리를 이용한 방법을 다룹니다.

## Provider 패턴 특징

> BLoC 패턴과 같은 상태관리를 위한 패턴이며 패턴 작성에 있어 조금 더 간편하게 사용할 수 있는 장점이 있습니다.
> 
> 멀티 사용 역시 BLoC 와 동일하게 사용 가능
> 
> 전체적인 특징은 BLoC와 많은 부분이 동일합니다.

### 설정

> pubspec.lock 에 다음만 추가해주면 사용 설정은 끝입니다.
> (버전은 프로젝트에 맞는 버전으로 설정)

```yml
dependencies:
  ...
  provider : 
  ...
```

### 예제

[예제 깃헙](https://github.com/HeekangLim/HeekangLim.github.io)

해당 github 에서 flutter_hklim 이 프로젝트 폴더.

--------

### 사용 방법

#### Provider 구독

> 노티가 이루어 질때 구독한 Widget은 값이 변경됨을 인지해서 refresh 할 수 있습니다.

```dart
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          title : 'Counter app using provider',
          home : Scaffold(
            appBar: AppBar (
              title: Text('ScreenProvider'),
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
```

#### ChangeNotifier 선언

> 상태 값이 변경되었을 때에 구독하는 UI 에 상태 변경되었음을 노티 삽니다.
> notifyListeners 가 호출되었을 때에 구독하고 있는 UI에 노티됩니다.
> 
> 아래 코드는 단순히 카운트 변수를 가지고 있다가 increment 호출되었을 때 값 증가시킨 후 Noti 하는 클래스입니다.

```dart
class ProviderCounter with ChangeNotifier {
  int _nCount = 0;

  int getCount() => _nCount;

  void increment () {
    _nCount ++;
    notifyListeners();
  }
}
```

#### Counter 위젯

> Provider.of 로 접근 후 값을 증가 시킨 후 noti 를 요청 하고 해당 카운트 값을 보여주는 위젯
> Provider에 접근하여 noti 요청과 실제 UI 부분이 함께 있으나 동작 확인을 위한 코드일 뿐이기 때문에 참고만 부탁드립니다.

```dart
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
```

### 결과

#### 결론

> BLoC 에 비해서 사용하고 이해하기에 더 간편해 졌습니다.
> 
> BLoC와 마찬가지로 서로간의 책임을 분리할 수 있고 설계에 따라서는 완벽한 MVVM 패턴을 완성할 수 있습니다.

##### BLoC 상태관리 : [BLoC](./flutter_state_pattern_bloc.html)

##### GetX 상태관리 : [GetX](./flutter_state_pattern_getx.html)
