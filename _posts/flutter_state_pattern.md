```yaml
layout: default
```

[Link to another page](./another-page.html).

# Flutter 상태관리

Flutter에는 각종 상태관리를 위한 패턴이 존재한다. 가장 기본적으로 많이 쓰이는 패턴으로 BLoC / Provider 가 존재하며, 후에 나온 GetX가 있다.

## BLoC 패턴

> Bussiness Logic Component 의 준말로 상태 관리 제어를 위해 디자인 된 패턴.
> 
> View 와 Bussiness Logic 을 분리해서 코드 의존성을 낮추었고 MVVM 패턴을 효율적으로 구현할 수 있다.
> 
> BLoC 를 멀티로 사용 가능하며 각 BLoC 패턴을 View에서 구독하고, BLoC 에서 갱신 될 때에 View 가 업데이트 된다.
> 
> Stream 기반이다.

### 설정

```js
// Javascript code with syntax highlighting.
var fun = function lang(l) {
  dateformat.i18n = require('./lang/' + l)
  return true;
}
```

```ruby
# Ruby code with syntax highlighting
GitHubPages::Dependencies.gems.each do |gem, version|
  s.add_dependency(gem, "= #{version}")
end
```

#### Header 4

- This is an unordered list following a header.
- This is an unordered list following a header.
- This is an unordered list following a header.

##### Header 5

1. This is an ordered list following a header.
2. This is an ordered list following a header.
3. This is an ordered list following a header.

###### Header 6

| head1        | head two          | three |
| ------------ | ----------------- | ----- |
| ok           | good swedish fish | nice  |
| out of stock | good and plenty   | nice  |
| ok           | good `oreos`      | hmm   |
| ok           | good `zoute` drop | yumm  |

### There's a horizontal rule below this.

---

### Here is an unordered list:

- Item foo
- Item bar
- Item baz
- Item zip

### And an ordered list:

1. Item one
2. Item two
3. Item three
4. Item four

### And a nested list:

- level 1 item
  - level 2 item
  - level 2 item
    - level 3 item
    - level 3 item
- level 1 item
  - level 2 item
  - level 2 item
  - level 2 item
- level 1 item
  - level 2 item
  - level 2 item
- level 1 item

### Small image

![Octocat](https://github.githubassets.com/images/icons/emoji/octocat.png)

### Large image

### Definition lists can be used with HTML syntax.

Name

Godzilla

Born

1952

Birthplace

Japan

Color

Green

```
Long, single-line code blocks should not wrap. They should horizontally scroll if they are too long. This line should be long enough to demonstrate this.
```

```
The final element.
```
