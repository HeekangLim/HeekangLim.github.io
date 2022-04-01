```yaml
layout: default
```

# Flutter 상태관리 - BLoC 패턴

Flutter에는 각종 상태관리를 위한 패턴이 존재한다. 가장 기본적으로 많이 쓰이는 패턴으로 BLoC / Provider 가 존재하며, 후에 나온 GetX가 있습니다.

이 페이지는 BLoC 패턴에 대한 Page 입니다. ( 스터디를 통해 보강 예정 )

해당 페이지에서는 BLoC 라이브러리를 이용한 방법을 다룹니다.

## BLoC 패턴

> Stream 기반
> 
> Bussiness Logic Component 의 준말로 상태 관리 제어를 위해 디자인 된 패턴.
> 
> UI객체 와 Bussiness Logic 을 분리해서 코드 의존성을 낮추었고 MVVM 패턴을 효율적으로 구현할 수 있습니다.
> 
> BLoC 를 멀티로 사용 가능하며 각 BLoC 패턴을 UI객체 에서 구독하고, BLoC 에서 갱신 될 때에 구동 중인 UI객체가 업데이트 됩니다.

## 멀티 BLoC

> 하나의 UI 객체에서 여러 BLoC 패턴을 구독 가능합니다.
> 
> 여러 UI 에서 여러 BLoC 패턴을 구독 가능합니다.
>   (이 때에 주의할 점으로 무분별한 구독은  뜻하지 않는 갱신을 야기시킬 수 있습니다.)

### 설정

> pubspec.lock 에 다음만 추가해주면 사용 설정은 끝. (버전은 맞는 버전으로 설정)

```yml
dependencies:
  ...
  flutter_bloc: ^7.3.3
  ...
```

### 예제

[예제 깃헙](https://github.com/HeekangLim/HeekangLim.github.io)

해당 github 에서 flutter_hklim 이 프로젝트 폴더.

### 사용 방법

#### Bloc 를 상속받는 class 생성

> 이벤트를 add 했을 때에 수행할 Bloc 선언

```dart
enum EventCnt { increment }    // 이벤트 값에 따라 동작 변환이 가능
class BlocCount extends Bloc<EventCnt, int>{
  BlocCount(int initialState) : super(initialState);

  @override
  Stream<int> mapEventToState(EventCnt event) async* {
    yield state + 1;  // state 는 int, 따라서 yield 로 state + 1 노티
  }
}
```

#### BlocProvider

> child 위젯에 BLoC 를 제공하기 BlocProvider를 선언.

```dart
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
            ),
            body: SafeArea(
              child :Counter()
            ),
            // child: Counter(
          ),
        ),
      );
  }      ),
      );
  }
}
```

#### BlocBuilder

> BLoC 에서 State 가 변경 되었을 때 Widget 을 변경합니다. 아래 내용은 버튼을 선택 했을 때에 Bloc 에 이벤트를 호출해서 Bloc에서 state + 1 로 값이 변경되었기 대문에 BlocBuilder 가 호출되어 widget이 업데이트가 됩니다.

```dart
class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
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
```

### 결과

#### 결론

> 내용에 비해 상당히 코드가 복잡해 보입니다.
> 설계를 잘 한다면 UI 단과 Buissiness Logic을 분리 할 수 있어 책임을 분리할 수 있습니다.
> 샘플 및 사용방법에 대한 설명은 사용방법 설명을 위해 작성된 코드로, 실제 설계시에는 독립성을 가지도록 설계할 수 있습니다.

##### Provider 상태관리 : [Provider](./flutter_state_pattern_provider.html)

##### GetX  상태관리: [GetX](./flutter_state_pattern_getx.html)
