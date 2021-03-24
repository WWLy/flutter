// 默认所有类都继承 Object
main(List<String> args) {
  var p1 = Person.withArgs("张三", 16);

  Object obj1 = "123abc";
  print(obj1);
  // 动态类型, 编译时没问题, 运行时可能报错
  dynamic obj2 = "123abc";
  print(obj2.substring(1));

  var obj3 = Person.withMap({"name": "李四", "age": 21});
  print(obj3.height);

  print(obj3);

  print(getFirst(["1", "2"]));
}

class Person {
  String? name;
  int? age;
  double? height;

  // Person(String name, int age) {
  //   this.name = name;
  //   this.age = age;
  // }

  // 使用命名构造函数
  Person(this.name, this.age, {this.height});

  Person.withArgs(this.name, this.age, {this.height});

  Person.withMap(Map<String, dynamic> map) {
    this.name = map["name"];
    this.age = map["age"];
    this.height = map["height"];
  }

  @override
  String toString() {
    return "$name $age $height";
  }
}

class Person2 {
  String name;
  int? age;

  // 加上 _ 代表只能在当前文件内访问
  String? _p_name;

  Person2(this.name);
  // Person2(this.name, {int age = 10});

  // set 方法
  set setName(String name) {
    this.name = name;
  }

  // get 方法
  String get getName {
    return this.name;
  }
}

class Doctor extends Person2 {
  // Doctor(String name) : assert name.length > 2;
  Doctor(String name) : super(name);
}

// 抽象类
abstract class Shape {
  // 抽象类可以没有方法实现, 没有实现时子类必须要实现
  void getArea();
  String getInfo() {
    return "形状";
  }

  // factory Shape() {
  //   return Rectangle();
  // }
}

// class Rectangle extends Shape {
//   @override
//   void getArea() {
//     print("Rectangle 面积");
//   }
// }

// final s1 = Shape();

// Dart 类不支持多继承
// 当将一个类当做接口使用时, 实现这个接口的类, 必须实现这个接口的所有方法

// 通常使用 abstract 声明一个接口
abstract class Runner {
  void running();
}

class SuperMan implements Runner {
  @override
  void running() {
    print("超人奔跑");
  }
}

// Minin 混入
mixin Flyer {
  void flying();
}

mixin Eater {
  void eating() {
    print("eating");
  }
}

// mixin 声明的类, 通过 with 来混入, 可以使用接口类的默认实现
class Driver with Flyer, Eater {
  @override
  void flying() {
    print("flying");
  }
}

// 泛型类
class Location<T> {
  T x;
  T y;

  Location(this.x, this.y);
}

final l1 = Location(1, 2);
final l2 = Location("1.1", "2.2");

T getFirst<T>(List<T> ts) {
  return ts[0];
}
