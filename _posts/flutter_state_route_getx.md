```yaml
layout: default
```

# Flutter GetX 패턴 - Route 관리

GetX의 패턴의 특징 중 하나로 Route 관리가 쉽습니다.

해당 페이지에서는 GetX 라이브러리를 이용한 Route 관리를 다룹니다.

## GetX 라우트 관리 특징

> 기존 Flutter Navigation 관리에 비해서 사용하기가 간편하다.
> 
> 라우트 하기 위한 코드가 간결해 져 가독성이 올라갑니다.
> 
> 단점으로, 아직 개선해야 할 부분이 많이 있어 사용에 따라 이슈 발생할 수 있는 가능성이 존재 합니다.

### 설정

> pubspec.lock 에 다음만 추가해주면 사용 설정은 끝입니다.
> (버전은 프로젝트에 맞는 버전으로 설정)

```yml
dependencies:
  ...
  getx : 
  ...
```

> 기존 MaterialApp 을 GetMaterialApp으로 선언해 주고 나면 GetX 라우트 관리를 사용 가능합니다.

```dart
  @override
  Widget build(BuildContext context) {
 // return MaterialApp(
   return GetMaterialApp(  // getX 라우팅을 위해 GetMaterialApp 으로
...
```

### 예제

[예제 깃헙](https://github.com/HeekangLim/HeekangLim.github.io)

> 해당 github 에서 flutter_hklim 이 프로젝트 폴더.
> 
> 어떤식으로 라우팅 관리가 되는지 샘플 코드 순서대로 확인해 보겠습니다.
> 
> 추 후 동작 화면 이미지 첨부 예정.

--------

### 기본 사용

#### 이동 Get.to(Widget())

> 이동하고자 하는 위젯으로 이동 

```dart
Get.to(ScreenTempNext()) // ScreenTempNext 위젯으로 이동
```

#### 뒤로 가기 Get.back()

> Get.to 로 이동 한 Widget에서 Get.back으로 뒤로 이동할 수 있습니다.

```dart
Get.back()    // 이전 Widget으로 이
```

#### 닫고 이동 Get.off(Widget())

> Get.to 는 현재 페이지를 남겨놓고 이동, Get.off 는 현재 Widget를 닫고 이동입니다.

```dart
// ScreenTempNext Widget으로 현재 Widget를 닫고 이동
Get.off(ScreenTempNext())
```

#### 전부 닫고 이동 Get.off(Widget())

> Get.offAll 로 여태까지 이동했던 페이지를 모두 닫고 이동합니다.

```dart
// ScreenTempNext Widget으로 현재 까지의 모든 Widget를 닫고 이동
Get.offAll(ScreenTempNext())
```

---

### 이름 지정 후 사용

#### Widget 이름 지정

> 아래 내용은 다음과 같습니다.
> 
> ScreenTempNext 페이지에 /temp1 이름을 지정
> 
> ScreenTemp2 페이지에 /temp2 이름을 지정
> 
> ScreenTemp2 페이지에 /param 이라는 이름을 지정 param 이라는 이름으로 파라미터를 받는다.

```dart
@override
  Widget build(BuildContext context) {
 // return MaterialApp(
    return GetMaterialApp(  // getX 라우팅을 위해 GetMaterialApp 으로
      getPages: [
        GetPage(name: '/temp1', page: ()=> ScreenTempNext()),
        GetPage(name: '/temp2', page: ()=> ScreenTemp2()),
        GetPage(name: '/param/:param', page: ()=> ScreenParam() ),
    ],
    ...
```

#### 이름으로 호출

> Get.toNamed('지정해 놓은 이름') 으로 해당 페이지로 이동 가능합니다.

```dart
Get.toNamed('temp1'); // temp1 으로 이름 지정되어있는 ScreenTempNext 로 이동
```

#### 이름으로 파라미터와 함께 호출

> Get.toNamed('지정해 놓은 이름') 으로 해당 페이지로 이동 가능합니다.

```dart
// param 으로 이름지어진 ScreenParam으로 다음 param을 보낸다.
// param = test, name1 = nametest2, name2 = nametest3
Get.toNamed('/param/test?name1=nametest2&name2=nametest3')
```

#### 파라미터를 받는 방법

> Get.parameters['\${param 이름}']

```dart
Get.parameters['param']} // test
Get.parameters['name']} // nametest2
Get.parameters['param']} // nametest3
```

---

#### 결과

> 실제로 기존 Flutter 네이게이션 관리에 비해서는 간결해 짐.
> 하지만 더욱 더 복잡한 동작이나 여러가지 동작을 시험 중에 지속적인 이슈가 발생하여, 사용에 주의가 필요. 추 후 GetX 에서 제공하는 여러가지 기능들에 대해 다룬 후 실제 GetX 를 이용한 가상의 커머스 서버를 만들고 테스트 하는 앱 제작 후 발생했던 문제점 및 해당 앱을 만들면서 작성한 모듈을 제공 예정.

#### Flutter 상태 관리 및 GetX 시리즈 링크

[Flutter Group | Developer Hank - Flutter (heekanglim.github.io)](https://heekanglim.github.io/)
