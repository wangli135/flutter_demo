import 'dart:math';
import 'dart:async';

class Person {
  String firstName;

//  Person(this.firstName);
  Person.fromJson(Map data) {
    print('in Person');
  }
}

class Employee extends Person {
  Employee.fromJson(Map data) : super.fromJson(data) {
    print("in Employee");
  }
}

class Person1 {
  final _name;

  Person1(this._name);

  String greet(String who) => 'Hello,$who. I am $_name';
}

class Impostor implements Person1 {
  get _name => '';

  @override
  String greet(String who) => 'Hi $who. Do you know who I am?';
}

String greetBob(Person1 person) => person.greet('Bob');

printInterger(int aNumber) {
  print('The number is $aNumber');
}

isNoble(int atomicNumber) => printInterger(atomicNumber);

void enableFlags({bool bold, bool hidden}) {}

String say(String from, String msg,
    [String device = 'carrier pigeon', String mood]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  if (mood != null) {
    result = '$result (in a $mood mood)';
  }

  return result;
}

bool topLevel = true;

abstract class Doer {
  void doSomething();
}

Iterable<int> naturalsTo(int n) sync* {
  if (n > 0) {
    yield n;
    yield* naturalsTo(n - 1);
  }
}

class EffectiveDoer extends Doer {
  @override
  void doSomething() {}
}

class Point {
  num x, y;

  Point(num x, num y) {
    this.x = x;
    this.y = y;
  }

  Point.orign() {
    x = 0;
    y = 0;
  }

  num distanceTo(Point point) {
    var dx = x - point.x;
    var dy = y - point.y;
    return sqrt(dx * dx + dy + dy);
  }
}

class Rectangle {
  num left, top, width, height;

  Rectangle(this.left, this.top, this.width, this.height);

  num get right => left + width;

  set right(num value) => left = value - width;
}

enum Color { red, green, blue }

Future<String> lookUpVersion() async => '1.0.0';

void main() {
//  assert(Color.red.index == 0);
//  assert(Color.green.index == 1);
//  assert(Color.blue.index == 2);

  Iterable<int> iterable = naturalsTo(10);
  iterable.forEach((it) {
    printInterger(it);
  });

//  print(2.runtimeType);

//  var point = Point.orign();

//  var emp = new Employee.fromJson({});

//  print(greetBob(new Person1('Kathy')));
//  print(greetBob(new Impostor()));

//  var insideMain = true;
//
//  void myFunction() {
//    var insideFunction = true;
//
//    void nestedFunction() {
//      var insideNestedFunction = true;
//
//      assert(topLevel);
//      assert(insideMain);
//      assert(insideFunction);
//      assert(insideNestedFunction);
//    }
//  }
}

//main() {
//  var list = ['apples', 'bananas', 'oranges'];
//
//  list.forEach((item) {
//    print('${list.indexOf(item)}:$item');
//  });
//
////  assert(say('Bob', 'Howdy') ==
////      'Bob says Howdy with a carrier pigeon');
//
////  enableFlags(bold: true, hidden: false);
//
////  isNoble(42);
//
////  var number = 42;
////  printInterger(number);
////  print(int.parse('2'));
////
////  var list = const [1, 2, 3];
////  assert(list.length == 3);
////  assert(list[1] == 2);
////
//////   list[1]=1;
////
////  var map = {
////
////    'first':'partridge',
////    'second':'turtledoves',
////    'fifth':'golden rings'
////
////  };
////
////  assert(map.length==3);
////  assert(map['first']=='partridge');
//
////  var clapping = '\u{1f44f}';
////  print(clapping);
////  print(clapping.codeUnits);
////  print(clapping.runes.toList());
////
////  Runes input = new Runes(
////      '\u2665  \u{1f605}  \u{1f60e}  \u{1f47b}  \u{1f596}  \u{1f44d}');
////  print(new String.fromCharCodes(input));
//}
